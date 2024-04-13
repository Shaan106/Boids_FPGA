`timescale 1ns / 1ps
/**
 * 
 * READ THIS DESCRIPTION:
 *
 * This is the Wrapper module that will serve as the header file combining your processor, 
 * RegFile and Memory elements together.
 *
 * This file will be used to generate the bitstream to upload to the FPGA.
 * We have provided a sibling file, Wrapper_tb.v so that you can test your processor's functionality.
 * 
 * We will be using our own separate Wrapper_tb.v to test your code. You are allowed to make changes to the Wrapper files 
 * for your own individual testing, but we expect your final processor.v and memory modules to work with the 
 * provided Wrapper interface.
 * 
 * Refer to Lab 5 documents for detailed instructions on how to interface 
 * with the memory elements. Each imem and dmem modules will take 12-bit 
 * addresses and will allow for storing of 32-bit values at each address. 
 * Each memory module should receive a single clock. At which edges, is 
 * purely a design choice (and thereby up to you). 
 * 
 * You must change line 36 to add the memory file of the test you created using the assembler
 * For example, you would add sample inside of the quotes on line 38 after assembling sample.s
 *
 **/

module Wrapper (CLK100MHZ, CPU_RESETN, LED, BTNU, BTNL, BTND,BTNR, hSync, vSync, VGA_R, VGA_G, VGA_B);

    input CLK100MHZ, CPU_RESETN; 
    input BTNU;
    input BTNL;
    input BTND;
    input BTNR;
    
    output[15:0] LED;
    output hSync; 		// H Sync Signal
    output vSync; 		// Veritcal Sync Signal
    output[3:0] VGA_R;  // Red Signal Bits
    output[3:0] VGA_G;  // Green Signal Bits
    output[3:0] VGA_B;  // Blue Signal output with 

	
	assign LED[7:0] = instAddr[7:0];
	
	reg[10:0] counter;
	wire clock; // 50 mhz clock
	wire reset;
	
    assign reset = ~CPU_RESETN; 
	
	always @(posedge CLK100MHZ) begin
	   counter <= counter + 1;
	end
	
	assign clock =  counter[0];
	
	wire rwe, mwe;
	wire[4:0] rd, rs1, rs2;
	wire[31:0] instAddr, instData, 
		rData, regA, regB,
		memAddr, memDataIn, memDataOut;


	// ADD YOUR MEMORY FILE HERE
	localparam INSTR_FILE = "Test Files/Memory Files/sort";
	
	// Main Processing Unit
	processor CPU(.clock(clock), .reset(reset), 
								
		// ROM
		.address_imem(instAddr), .q_imem(instData),
									
		// Regfile
		.ctrl_writeEnable(rwe),     .ctrl_writeReg(rd),
		.ctrl_readRegA(rs1),     .ctrl_readRegB(rs2), 
		.data_writeReg(rData), .data_readRegA(regA), .data_readRegB(regB),
									
		// RAM
		.wren(mwe), .address_dmem(memAddr), 
		.data(memDataIn), .q_dmem(memDataOut)); 
	
	// Instruction Memory (ROM)
	ROM #(.MEMFILE({INSTR_FILE, ".mem"}))
	InstMem(.clk(clock), 
		.addr(instAddr[11:0]), 
		.dataOut(instData));
	
	// Register File
	regfile RegisterFile(.clock(clock), 
		.ctrl_writeEnable(rwe), .ctrl_reset(reset), 
		.ctrl_writeReg(rd),
		.ctrl_readRegA(rs1), .ctrl_readRegB(rs2), 
		.data_writeReg(rData), .data_readRegA(regA), .data_readRegB(regB));

						
	// Processor Memory (RAM)
	RAM ProcMem(.clk(clock), 
		.wEn(mwe), 
		.addr(memAddr[11:0]), 
		.dataIn(memDataIn), 
		.dataOut(memDataOut));


	// creating BPU instances and choosing relevant output.
	wire[9:0] x_loc_out;
	wire[8:0] y_loc_out;
	wire[11:0] boid_address_out;

	wire[BITS_FOR_BOIDS-1:0] chosen_boid_to_read; //set value - loop through all boids

	wire[MAX_BOIDS-1:0] chosen_boid_to_read_onehot;
	decoder32 ch(.out(chosen_boid_to_read_onehot), .select(chosen_boid_to_read), .enable(1'b1));

	genvar i;
	generate 
		for (i = 0; i < MAX_BOIDS; i = i + 1) begin: loop1
            wire[31:0] reg_out;

			wire[9:0] x_loc;
			wire[8:0] y_loc;
			wire addr_enable;
			wire[11:0] boid_address;

			assign addr_enable = 1'b1;
			
			BPU BoidProcessorUnit(.clock(clock), .x_loc(x_loc), .y_loc(y_loc), .addr_enable(addr_enable), .address(boid_address));

			tristate x_output_tristate(.in(x_loc), .en(chosen_boid_to_read_onehot[i]), .out(x_loc_out));
			tristate y_output_tristate(.in(y_loc), .en(chosen_boid_to_read_onehot[i]), .out(y_loc_out));
			// calc address with x_loc_out and y_loc_out

			tristate boid_address_output_tristate(.in(boid_address), .en(chosen_boid_to_read_onehot[i]), .out(boid_address_out));

        end
   endgenerate

	// ------------------------ creating Boid display memory ------------------------
	localparam 
		VIDEO_WIDTH = 640,  // Standard VGA Width
		VIDEO_HEIGHT = 480; // Standard VGA Height
	localparam 
		PIXEL_COUNT = VIDEO_WIDTH*VIDEO_HEIGHT, 	             // Number of pixels on the screen
		PIXEL_ADDRESS_WIDTH = $clog2(PIXEL_COUNT) + 1,           // Use built in log2 command
		BITS_PER_COLOR = 12, 	  								 // Nexys A7 uses 12 bits/color
		PALETTE_COLOR_COUNT = 256, 								 // Number of Colors available
		PALETTE_ADDRESS_WIDTH = $clog2(PALETTE_COLOR_COUNT) + 1; // Use built in log2 Command
		MAX_BOIDS = 32;
		BITS_FOR_BOIDS = $clog2(MAX_BOIDS);

	wire[PIXEL_ADDRESS_WIDTH-1:0] imgAddress;  	 // Image address for the image data
	wire[PALETTE_ADDRESS_WIDTH-1:0] colorAddr; 	 // Color address for the color palette
	assign imgAddress = x + 640*y;				 // Address calculated coordinate

	// Boids Mem

	wire pixelColorOut, pixelColorIn, pixelWriteEnable;

	RAM Boid_display_mem(		
		.DEPTH(PIXEL_COUNT), 				     // Set RAM depth to contain every pixel
		.DATA_WIDTH(1),      // Set data width according to the color palette
		.ADDRESS_WIDTH(PIXEL_ADDRESS_WIDTH)     // Set address with according to the pixel count 
		// .MEMFILE({FILES_PATH, "boids_display.mem"}))  
	ImageData(
		.clk(clock), 						 // Falling edge of the 100 MHz clk
		.addr(boid_address_out),					 // Image data address
		.dataOut(pixelColorOut),				 // Color palette address
		.dataIn(pixelColorIn),
		.wEn(pixelWriteEnable)); 	


	// ---------- this could all be wrong ----------------
	// pixelWriteEnable = screenEnd_out; // high for 1 cycle
	// assign chosen_boid_to_read = counter[BITS_FOR_BOIDS-1:0]; // loop through all boids
	// assign pixelWriteEnable = counter[5]; // 1/16th of 25mhz clock, 1/64th of 100mhz clock
	// assign pixelColorIn = 1'b1; // because the boid_address_out will always only be the location of a boid.


	always @(posedge screenEnd_out) begin

		// boid mem = all blank

		// update boid mem with new boid locations 
		// - have tristate implementation to get one of N boids' mem location

	end



	// at screen refresh end, update boid memory.

    wire cursorType;
	wire screenEnd_out;
    assign cursorType = BTNR | BTNL;
    VGAController VGAControlModule(.clk(CLK100MHZ),
                                   .reset(reset),
                                   .hSync(hSync),
                                   .vSync(vSync),
                                   .VGA_R(VGA_R),
                                   .VGA_G(VGA_G),
                                   .VGA_B(VGA_B),
                                   .BTNU(BTNU),
                                   .BTNL(BTNL),
                                   .BTND(BTND),
                                   .BTNR(BTNR),
                                   .cursorType(cursorType),
								   .screenEnd_out(screenEnd_out),
                                   .LED(LED));
   


endmodule
