//`timescale 1 ns/ 100 ps
module VGAController(     
	input clk, 			// 100 MHz System Clock
	input reset, 		// Reset Signal
	output hSync, 		// H Sync Signal
	output vSync, 		// Veritcal Sync Signal
	output[3:0] VGA_R,  // Red Signal Bits
	output[3:0] VGA_G,  // Green Signal Bits
	output[3:0] VGA_B,  // Blue Signal Bits

	input BTNU,
	input BTNL,
	input BTND,
	input BTNR,
	
	output screenEnd_out,
	output[15:0] LED,

	output[PIXEL_ADDRESS_WIDTH-1:0] boid_read_address,
	input boid_read_data,
	
	input[9:0] scary_boid_x,
	input[8:0] scary_boid_y
	);

	// this is sending the screenEnd signal out of VGA controller so that boid mem can be updated on its posedge
	assign screenEnd_out = screenEnd;
	
	// Lab Memory Files Location
	localparam FILES_PATH = "../RAM_files/"; 

	// Clock divider 100 MHz -> 25 MHz
	wire clk25; // 25MHz clock

	reg[1:0] pixCounter = 0;      // Pixel counter to divide the clock
    assign clk25 = pixCounter[1]; // Set the clock high whenever the second bit (2) is high
	always @(posedge clk) begin
		pixCounter <= pixCounter + 1; // Since the reg is only 3 bits, it will reset every 8 cycles
	end

	localparam 
		VIDEO_WIDTH = 640,  // Standard VGA Width
		VIDEO_HEIGHT = 480, // Standard VGA Height
		PIXEL_COUNT = VIDEO_WIDTH*VIDEO_HEIGHT, 	             // Number of pixels on the screen
		PIXEL_ADDRESS_WIDTH = $clog2(PIXEL_COUNT) + 1,           // Use built in log2 command
		BITS_PER_COLOR = 12, 	  								 // Nexys A7 uses 12 bits/color
		PALETTE_COLOR_COUNT = 256, 								 // Number of Colors available
		PALETTE_ADDRESS_WIDTH = $clog2(PALETTE_COLOR_COUNT) + 1; // Use built in log2 Command

	wire active, screenEnd;
	wire[9:0] x;
	wire[8:0] y;
	                   	                
	
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


    
	// Assign to output color from register if active
	wire[BITS_PER_COLOR-1:0] currentPixel_colour_info;
	wire[BITS_PER_COLOR-1:0] background_colour, boid_colour;

	reg isBoidInPixel;
	
	assign background_colour = 12'b111111111111;
	assign boid_colour =       12'b000000000000;
	
	reg showIsBoid;
	
	always @(posedge isBoidInPixel) begin
	   showIsBoid = ~showIsBoid;
	end 
	
	//assign LED[15] = showIsBoid;
	
//	assign LED[15:14] = currentPixel_colour_info[11:10];
//    assign LED[13:12] = currentPixel_colour_info[7:6];
//    assign LED[11] = isBoidInPixel;
//    assign LED[8] = screenEnd_out;
//    assign LED[9] = screenEnd;
//    assign LED[10] = 1'b0;

	assign currentPixel_colour_info = isBoidInPixel ? boid_colour : background_colour;

	//is Boid in Pixel depends on the x and y
	wire[PIXEL_ADDRESS_WIDTH-1:0] currentPixelAddress;  	 // Image address for the image data
//	assign currentPixelAddress = x/2 + 320*y;	// for scale up factor 2
    assign currentPixelAddress = x + 640*y;


	// which address to read data from to display
	reg[PIXEL_ADDRESS_WIDTH-1:0] boid_read_address_reg;
	assign boid_read_address = boid_read_address_reg;


	always @(posedge clk) begin

		//assigns address to read to current Pixel Address,
		//assigns isBoidInPixel to the data read from the boid memory

		boid_read_address_reg <= currentPixelAddress;
		isBoidInPixel <= boid_read_data;

		// boid_read_address = currentFinalAddress;
		// isBoid = boid_read_data;

	end
	
//	reg[9:0] scary_boid_width = 10'd10;
//	reg[8:0] scary_boid_height = 9'd10;
	
	assign is_draw_scary = (x > scary_boid_x && x < scary_boid_x + 10 && y > scary_boid_y && y < scary_boid_y + 10);

	// Quickly assign the output colors to their channels using concatenation
//	assign {VGA_R, VGA_G, VGA_B} = currentPixel_colour_info;
//	assign {VGA_R, VGA_G, VGA_B} = active ? currentPixel_colour_info : 12'b0;

    wire[3:0] scaryBoidColour;
    assign scaryBoidColour = is_draw_scary ? 4'b0 : currentPixel_colour_info[11:8];
	
	assign VGA_R = active ? scaryBoidColour : 4'b0;
	assign VGA_G = active ? currentPixel_colour_info[7:4] : 4'b0;
	assign VGA_B = active ? currentPixel_colour_info[3:0] : 4'b0;
	
//	always @(posedge screenEnd) begin

////	   box_y = BTNU ? box_y-1 : box_y;
////	   box_y = BTND ? box_y+1 : box_y;
////	   box_x = BTNL ? box_x-1 : box_x;
////	   box_x = BTNR ? box_x+1 : box_x;

//	end
	
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
