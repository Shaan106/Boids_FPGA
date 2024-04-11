//`timescale 1 ns/ 100 ps
module VGAController(     
	input clk, 			// 100 MHz System Clock
	input reset, 		// Reset Signal
	output hSync, 		// H Sync Signal
	output vSync, 		// Veritcal Sync Signal
	output[3:0] VGA_R,  // Red Signal Bits
	output[3:0] VGA_G,  // Green Signal Bits
	output[3:0] VGA_B,  // Blue Signal Bits
//	inout ps2_clk,
//	inout ps2_data,
	input BTNU,
	input BTNL,
	input BTND,
	input BTNR,
	
	input cursorType // this is what to show for the cursor
	);
	
	// Lab Memory Files Location
	localparam FILES_PATH = "../RAM_files/"; 

	// Clock divider 100 MHz -> 25 MHz
	wire clk25; // 25MHz clock

	reg[1:0] pixCounter = 0;      // Pixel counter to divide the clock
    assign clk25 = pixCounter[1]; // Set the clock high whenever the second bit (2) is high
	always @(posedge clk) begin
		pixCounter <= pixCounter + 1; // Since the reg is only 3 bits, it will reset every 8 cycles
	end
	
//	wire clk50;
//	assign clk50 = pixCounter[0];

	// VGA Timing Generation for a Standard VGA Screen
	localparam 
		VIDEO_WIDTH = 640,  // Standard VGA Width
		VIDEO_HEIGHT = 480; // Standard VGA Height

	wire active, screenEnd;
	wire[9:0] x;
	wire[8:0] y;
	
//	wire read_data;
//	wire[7:0] rx_data_unlatched;
	
//	Ps2Interface jonas(.ps2_clk(ps2_clk),
//	                   .ps2_data(ps2_data),
//	                   .read_data(read_data),
//	                   .rx_data(rx_data_unlatched),
//	                   .clk(clk));
	                   
//	 wire[7:0] rx_data_latched;
	 
	 
//	 latch_8bit my_key_latch(.D(rx_data_unlatched), .EN(read_data), .Q(rx_data_latched));
	 
	 wire[6:0] spriteIndex; //mem location of sprite corresponding to ASCII recieved from keyboard
//	 wire[6:0] spriteIndex2; // keyboard trash out
	 
//	 RAM #(
//		.DEPTH(256), 		       // Set depth to contain every color		
//		.DATA_WIDTH(7), 		       // Set data width according to the bits per color
//		.ADDRESS_WIDTH(8),     // Set address width according to the color count
//		.MEMFILE({FILES_PATH, "ascii.mem"}))  // Memory initialization
//	 ASCII(
//		.clk(clk), 							   	   // Rising edge of the 100 MHz clk
//		.addr(rx_data_latched),					       // Address from the ImageData RAM
//		.dataOut(spriteIndex2),				       // Color at current pixel
//		.wEn(1'b0)); 						       // We're always reading
		
		
    wire[6:0] spriteIndexTest = 7'b0000010;
    
    wire[6:0] dashIndex = 7'b0000001;
    wire[6:0] dotIndex = 7'b0001010;
    
//    assign spriteIndex = spriteIndexTest;

    assign spriteIndex = cursorType ? dashIndex : dotIndex;
		
	 RAM #(
		.DEPTH(235000), 		       // Set depth to contain every color		
		.DATA_WIDTH(1), 		       // Set data width according to the bits per color
		.ADDRESS_WIDTH(18),     // Set address width according to the color count
		.MEMFILE({FILES_PATH, "sprites.mem"}))  // Memory initialization
	 SPRITE(
		.clk(clk), 							   	   // Rising edge of the 100 MHz clk
		.addr((spriteIndex-1) * 2500 + (y-box_y)*50 + (x-box_x)),					       // Address from the ImageData RAM
		.dataOut(box_black),				       // Color at current pixel
		.wEn(1'b0)); 						       // We're always reading
	
    wire box_black;
	                   
	                
	
	VGATimingGenerator #(
		.HEIGHT(VIDEO_HEIGHT), // Use the standard VGA Values
		.WIDTH(VIDEO_WIDTH))
	Display( 
		.clk25(clk25),  	   // 25MHz Pixel Clock
		.reset(reset),		   // Reset Signal
		.screenEnd(screenEnd), // High for one cycle when between two frames
		.active(active),	   // High when drawing pixels
		.hSync(hSync),  	   // Set Generated H Signal
		.vSync(vSync),		   // Set Generated V Signal
		.x(x), 				   // X Coordinate (from left)
		.y(y)); 			   // Y Coordinate (from top)	   

	// Image Data to Map Pixel Location to Color Address
	localparam 
		PIXEL_COUNT = VIDEO_WIDTH*VIDEO_HEIGHT, 	             // Number of pixels on the screen
		PIXEL_ADDRESS_WIDTH = $clog2(PIXEL_COUNT) + 1,           // Use built in log2 command
		BITS_PER_COLOR = 12, 	  								 // Nexys A7 uses 12 bits/color
		PALETTE_COLOR_COUNT = 256, 								 // Number of Colors available
		PALETTE_ADDRESS_WIDTH = $clog2(PALETTE_COLOR_COUNT) + 1; // Use built in log2 Command

	wire[PIXEL_ADDRESS_WIDTH-1:0] imgAddress;  	 // Image address for the image data
	wire[PALETTE_ADDRESS_WIDTH-1:0] colorAddr; 	 // Color address for the color palette
	assign imgAddress = x + 640*y;				 // Address calculated coordinate

	RAM #(		
		.DEPTH(PIXEL_COUNT), 				     // Set RAM depth to contain every pixel
		.DATA_WIDTH(PALETTE_ADDRESS_WIDTH),      // Set data width according to the color palette
		.ADDRESS_WIDTH(PIXEL_ADDRESS_WIDTH),     // Set address with according to the pixel count
		.MEMFILE({FILES_PATH, "image.mem"})) // Memory initialization
	ImageData(
		.clk(clk), 						 // Falling edge of the 100 MHz clk
		.addr(imgAddress),					 // Image data address
		.dataOut(colorAddr),				 // Color palette address
		.wEn(1'b0)); 						 // We're always reading

	// Color Palette to Map Color Address to 12-Bit Color
	wire[BITS_PER_COLOR-1:0] colorData; // 12-bit color data at current pixel

	RAM #(
		.DEPTH(PALETTE_COLOR_COUNT), 		       // Set depth to contain every color		
		.DATA_WIDTH(BITS_PER_COLOR), 		       // Set data width according to the bits per color
		.ADDRESS_WIDTH(PALETTE_ADDRESS_WIDTH),     // Set address width according to the color count
		.MEMFILE({FILES_PATH, "colors.mem"}))  // Memory initialization
	ColorPalette(
		.clk(clk), 							   	   // Rising edge of the 100 MHz clk
		.addr(colorAddr),					       // Address from the ImageData RAM
		.dataOut(colorData),				       // Color at current pixel
		.wEn(1'b0)); 						       // We're always reading
	

	// Assign to output color from register if active
	wire[BITS_PER_COLOR-1:0] colorOut; 			  // Output color 
	
	wire square;
	wire[11:0] realColor;
	reg[9:0] box_x = 9'd50;
	reg[8:0] box_y = 9'd50;
	
		
	assign square = (x > box_x && x < box_x + 50 && y > box_y && y < box_y+50) && box_black;
//	assign square = (x > box_x && x < box_x + 50 && y > box_y && y < box_y+50);
	
	assign squareColor = 12'b010011010010; 
	
	assign colorOut = active ? colorData : 12'd0; // When not active, output black
	assign realColor = square ? squareColor : colorOut;

	// Quickly assign the output colors to their channels using concatenation
	assign {VGA_R, VGA_G, VGA_B} = realColor;
	
	always @(posedge screenEnd) begin

	   box_y = BTNU ? box_y-1 : box_y;
	   box_y = BTND ? box_y+1 : box_y;
	   box_x = BTNL ? box_x-1 : box_x;
	   box_x = BTNR ? box_x+1 : box_x;

	end
	
endmodule

module latch_8bit(
    input wire[7:0] D,
    input wire EN,
    output reg[7:0] Q
);
    always @(EN or D) begin
        if (EN) Q <= D;
    end
endmodule