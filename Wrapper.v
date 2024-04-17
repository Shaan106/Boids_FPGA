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


	// -------------------------- local params ---------------------------------

	localparam 
		VIDEO_WIDTH = 640,  // Standard VGA Width
		VIDEO_HEIGHT = 480; // Standard VGA Height

		PIXEL_COUNT = VIDEO_WIDTH*VIDEO_HEIGHT, 	             // Number of pixels on the screen
		PIXEL_ADDRESS_WIDTH = $clog2(PIXEL_COUNT) + 1,           // Use built in log2 command

		MAX_BOIDS = 32,
		BITS_FOR_BOIDS = $clog2(MAX_BOIDS); // how many bits needed to access MAX_BOIDS amount of data.


	// -------------------------- creating BPUs ---------------------------------


	// creating BPU instances and choosing relevant output.
	wire[9:0] x_loc_out; //x loc of chosen boid
	wire[8:0] y_loc_out; // y loc of chosen boid
	wire[PIXEL_ADDRESS_WIDTH-1:0] boid_address_out; //address of chosen boid

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


	wire[PIXEL_ADDRESS_WIDTH-1:0] imgAddress;  	 // Image address for the image data
	wire[PALETTE_ADDRESS_WIDTH-1:0] colorAddr; 	 // Color address for the color palette
	assign imgAddress = x + 640*y;				 // Address calculated coordinate
	wire pixelColorOut, pixelColorIn, pixelWriteEnable;

	reg writing_to_boids;
	wire writing_to_boids_wire; // this is input to resettable RAM
	assign writing_to_boids_wire = writing_to_boids;

	wire[PIXEL_ADDRESS_WIDTH-1:0] boid_read_address_wire; // this is the input read loc for RAM.
	// assign[PIXEL_ADDRESS_WIDTH-1:0] boid_read_address_wire = boid_read_address;

	reg boid_data_read;
	wire boid_read_data;
	assign boid_read_data = boid_data_read;

	RAM_resettable #(
		.DEPTH(PIXEL_COUNT), //depth = how many pixels on screen.
		.ADDRESS_WIDTH(PIXEL_ADDRESS_WIDTH) //address_width = how many bits needed to access that many pixels
	) Boid_display_mem(
		.clk(clock),
		.we(writing_to_boids_wire),
		.reset(reset),

		.write_addr(boid_address_out),
		.read_addr(boid_read_address_wire),

		.write_data(writing_to_boids_wire), //if we is on, then write data = 1
		.read_data(boid_data_read) //read data is a reg - it's a 1 or 0.
	);


	//-----------------------boid mem updating-----------------------------

	// counter for looping through boids
	reg[BITS_FOR_BOIDS-1:0] boid_counter;
	assign chosen_boid_to_read = boid_counter;

	// at every screenEnd, enable writing to boids and set initial boid = 0
	always @(posedge screenEnd_out) begin
		writing_to_boids <= 1;
		boid_counter <= 0;
	end

	always @(posedge clock) begin
		if (writing_to_boids) begin
			boid_counter <= boid_counter + 1;
			if (boid_counter == (MAX_BOIDS-1)) begin //change this value when num_boids changed.
				writing_to_boids <= 0;
			end
		end
	end


	//---------------------data to VGA controller--------------------------

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
								   .screenEnd_out(screenEnd_out),
                                   .LED(LED),

								   .boid_read_address(boid_read_address_wire),
								   .isBoidInPixel(boid_read_data) //outputs whether there is a boid in the pixel given by address
								   
								   );
   


endmodule
