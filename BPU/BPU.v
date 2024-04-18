
module BPU(clock, x_loc, y_loc, addr_enable, address);

    localparam 
		VIDEO_WIDTH = 640,  // Standard VGA Width
		VIDEO_HEIGHT = 480, // Standard VGA Height
		PIXEL_COUNT = VIDEO_WIDTH*VIDEO_HEIGHT, 	             // Number of pixels on the screen
		PIXEL_ADDRESS_WIDTH = $clog2(PIXEL_COUNT) + 1,           // Use built in log2 command
		BITS_PER_COLOR = 12, 	  								 // Nexys A7 uses 12 bits/color
		PALETTE_COLOR_COUNT = 256, 								 // Number of Colors available
		PALETTE_ADDRESS_WIDTH = $clog2(PALETTE_COLOR_COUNT) + 1; // Use built in log2 Command

    input clock;
    // 50 MHz clock

    output[9:0] x_loc;
    output[8:0] y_loc;

    input addr_enable;
    output[PIXEL_ADDRESS_WIDTH-1:0] address; 

    reg[9:0] x_reg = 9'd10;
    reg[8:0] y_reg = 8'd10;

    reg[PIXEL_ADDRESS_WIDTH-1:0] address_reg;

     assign x_loc = x_reg;
     assign y_loc = y_reg;

//    assign x_loc = 9'd10;
//    assign y_loc = 8'd10;

    always @(posedge clock) begin
        
        address_reg <= x_loc + 640 * y_loc; // 640 is the width of the screen, can do this w 2 bit shifts and an add
        
        x_reg <= x_reg + 1;
        y_reg <= y_reg + 1;
        
//        x_loc <= x_loc + 1;
//        y_loc <= y_loc + 1;
            
    end

    assign address = address_reg;

    reg dx;
    reg dy;

endmodule
