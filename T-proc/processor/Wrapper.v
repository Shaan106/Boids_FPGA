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

module Wrapper (CLK100MHZ, CPU_RESETN, LED, SW, BTNU, BTNL, BTND,BTNR, hSync, vSync, VGA_R, VGA_G, VGA_B);

    input CLK100MHZ, CPU_RESETN;
    input BTNU;
    input BTNL;
    input BTND;
    input BTNR;
    
    output[15:0] LED;
    input[15:0] SW;
     
    output hSync; 		// H Sync Signal
    output vSync; 		// Veritcal Sync Signal
    output[3:0] VGA_R;  // Red Signal Bits
    output[3:0] VGA_G;  // Green Signal Bits
    output[3:0] VGA_B;  // Blue Signal output with 
	
	reg[21:0] counter;
	wire clock; // 50 mhz clock 
	wire reset;
	
    assign reset = ~CPU_RESETN; 
	 
	always @(posedge CLK100MHZ) begin
	   counter <= counter + 1;
	end
	
	assign clock =  counter[0]; //downclock

	 
	wire rwe, mwe;
	wire[4:0] rd, rs1, rs2;
	wire[31:0] instAddr, instData, 
		rData, regA, regB,
		memAddr, memDataIn, memDataOut;
 

	// ADD YOUR MEMORY FILE HERE
	localparam INSTR_FILE = "../../BPU/main"; 
	
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
	
	wire[31:0] reg_26_data, reg_27_data, reg_28_data, reg_29_data;

	// Register File
	regfile RegisterFile(.clock(clock), 
		.ctrl_writeEnable(rwe), .ctrl_reset(reset), 
		.ctrl_writeReg(rd),
		.ctrl_readRegA(rs1), .ctrl_readRegB(rs2), 
		.data_writeReg(rData), .data_readRegA(regA), .data_readRegB(regB),
		.reg_out26(reg_26_data), .reg_out27(reg_27_data), .reg_out28(reg_28_data), .reg_out29(reg_29_data));

						
	// Processor Memory (RAM)
	RAM  #(
	    .DATA_WIDTH(32),
		.ADDRESS_WIDTH(13), // how many bits to address 
		.DEPTH(8192) //size of RAM
	) ProcMem(.clk(clock), 
		.wEn(mwe), 
		.addr(memAddr[11:0]), 
		.dataIn(memDataIn), 
		.dataOut(memDataOut));


	// ------------------------- x,y,we data from RAM --------------------------

	//full x and y data from mem
	wire[31:0] CPU_x_loc_full, CPU_y_loc_full;
	assign CPU_x_loc_full = reg_28_data;
	assign CPU_y_loc_full = reg_26_data;

	//shortened x and y data (to VGA size) from mem
	wire[9:0] CPU_x_loc;
	wire[8:0] CPU_y_loc;
	
	// x,y for onlyUpdate v6 and earlier
//	assign CPU_x_loc = CPU_x_loc_full[27:18];
//	assign CPU_y_loc = CPU_y_loc_full[27:19];
 
    // x,y for onlyUpdate v7 and beyond
    
    assign CPU_x_loc = CPU_x_loc_full[9:0];
	assign CPU_y_loc = CPU_y_loc_full[8:0];

    
//    assign LED[10:0] = boid_address_out_testing[10:0];
//    assign LED[9:0] = x_loc_out_testing[9:0];    
    
    assign LED[15:11] = which_boid_to_write_to_one_hot[4:0];
     
//    assign LED[15:0] = reg_28_data[15:0];
 

	//checking if global WE should be on
	wire CPU_all_boids_we;
	assign CPU_all_boids_we = !(reg_27_data[31] & reg_27_data[30] & reg_27_data[29] & reg_27_data[28] & reg_27_data[27] & reg_27_data[26] & reg_27_data[25] & reg_27_data[24] & reg_27_data[23] & reg_27_data[22] & reg_27_data[21] & reg_27_data[20] & reg_27_data[19] & reg_27_data[18] & reg_27_data[17] & reg_27_data[16] & reg_27_data[15] & reg_27_data[14] & reg_27_data[13] & reg_27_data[12] & reg_27_data[11] & reg_27_data[10] & reg_27_data[9] & reg_27_data[8] & reg_27_data[7] & reg_27_data[6] & reg_27_data[5] & reg_27_data[4] & reg_27_data[3] & reg_27_data[2] & reg_27_data[1] & reg_27_data[0]);

	//decoder to see which boid to write to.
	wire[BITS_FOR_BOIDS-1:0] which_boid_to_write_to;

	assign which_boid_to_write_to = reg_27_data[BITS_FOR_BOIDS-1:0];

    // THIS NEEDS TO BE CHANGED WHEN WRITING MORE THAN 32 BOIDS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    wire[31:0] which_boid_to_write_to_one_hot;
	decoder32 boid_writing_decoder(.out(which_boid_to_write_to_one_hot), .select(reg_27_data[4:0]), .enable(CPU_all_boids_we));


	// -------------------------- local params ---------------------------------

	localparam 
		VIDEO_WIDTH = 640,  // Standard VGA Width
		VIDEO_HEIGHT = 480, // Standard VGA Height

		PIXEL_COUNT = VIDEO_WIDTH*VIDEO_HEIGHT, 	             // Number of pixels on the screen
		PIXEL_ADDRESS_WIDTH = $clog2(PIXEL_COUNT) + 1,           // Use built in log2 command

		MAX_BOIDS = 128,
		BITS_FOR_BOIDS = $clog2(MAX_BOIDS); // how many bits needed to access MAX_BOIDS amount of data.


	// -------------------------- creating BPUs ---------------------------------


	// creating BPU instances and choosing relevant output.
	wire[9:0] x_loc_out; //x loc of chosen boid
	wire[8:0] y_loc_out; // y loc of chosen boid
	wire[PIXEL_ADDRESS_WIDTH-1:0] boid_address_out; //address of chosen boid

	wire[BITS_FOR_BOIDS-1:0] chosen_boid_to_read; //set value - loop through all boids

	wire[MAX_BOIDS-1:0] chosen_boid_to_read_onehot;
	decoder32 ch(.out(chosen_boid_to_read_onehot), .select(chosen_boid_to_read), .enable(1'b1));
	
//	wire[PIXEL_ADDRESS_WIDTH-1:0] boid_address_out_testing;
//	wire[31:0] x_loc_out_testing; //x loc of chosen BITS_FOR_BOIDS
	
//	//wire[31:0] y_loc_out_testing; //x loc of chosen BITS_FOR_BOIDS
	
//	wire[3:0] testLocChoice;
//	assign testLocChoice[0] = SW[0];
//	assign testLocChoice[1] = SW[1];
//	assign testLocChoice[2] = SW[2];
//	assign testLocChoice[3] = SW[3];
	
//	assign testLocChoice[4] = SW[4];
//	assign testLocChoice[5] = SW[5];
//	assign testLocChoice[6] = SW[6];
//	assign testLocChoice[7] = SW[7];
	

	genvar i;
	generate 
		for (i = 0; i < MAX_BOIDS; i = i + 1) begin: loop1
		  
		    wire[31:0] reg_out; 

			wire[9:0] x_loc;
			wire[8:0] y_loc;
			// wire screenEnd_out; //this is from VGA screen
			wire[PIXEL_ADDRESS_WIDTH-1:0] boid_address;

			
//			BPU BoidProcessorUnit(.clock(clock), .x_loc(x_loc), .y_loc(y_loc), .screenEnd_out(screenEnd_out), .address(boid_address),
//								  .CPU_x_loc(CPU_x_loc), .CPU_y_loc(CPU_y_loc), .CPU_curr_boid_we(which_boid_to_write_to_one_hot[i]));

            BPU BoidProcessorUnit(.clock(clock), .x_loc(x_loc), .y_loc(y_loc), .screenEnd_out(screenEnd_out), .address(boid_address),
								  .CPU_x_loc(CPU_x_loc), .CPU_y_loc(CPU_y_loc), .CPU_curr_boid_we(which_boid_to_write_to_one_hot[i]));


			tristate x_output_tristate(.in(x_loc), .en(chosen_boid_to_read_onehot[i]), .out(x_loc_out));
			tristate y_output_tristate(.in(y_loc), .en(chosen_boid_to_read_onehot[i]), .out(y_loc_out));
			// calc address with x_loc_out and y_loc_out

			tristate boid_address_output_tristate(.in(boid_address), .en(chosen_boid_to_read_onehot[i]), .out(boid_address_out));
			
//			tristate boid_address_output_tristate_testing(.in(boid_address), .en(testLocChoice[i]), .out(boid_address_out_testing));
			
//			wire[31:0] x_loc_ext;
			
//			assign x_loc_ext[9:0] = x_loc;
//			assign x_loc_ext[31:10] = which_boid_to_write_to_one_hot[31:10];
			
//			tristate boid_x_loc_output_tristate_testing(.in(x_loc_ext), .en(testLocChoice[i]), .out(x_loc_out_testing));
			
//			wire[31:0] y_loc_ext;
			
//			assign y_loc_ext[8:0] = y_loc;
//			assign y_loc_ext[31:9] = which_boid_to_write_to_one_hot[31:9];
			
//			tristate boid_y_loc_output_tristate_testing(.in(y_loc_ext), .en(testLocChoice[i+4]), .out(x_loc_out_testing));

        end
   endgenerate

	// ------------------------ creating Boid display memory ------------------------


//	wire[PIXEL_ADDRESS_WIDTH-1:0] imgAddress;  	 // Image address for the image data
//	wire[PALETTE_ADDRESS_WIDTH-1:0] colorAddr; 	 // Color address for the color palette
//	assign imgAddress = x + 640*y;				 // Address calculated coordinate
//	wire pixelColorOut, pixelColorIn, pixelWriteEnable;

	reg writing_to_boids_disp;
	wire writing_to_boids_disp_wire; // this is input to resettable RAM
	assign writing_to_boids_disp_wire = writing_to_boids_disp;

	wire[PIXEL_ADDRESS_WIDTH-1:0] boid_read_address_wire; // this is the input read loc for RAM.
	wire[PIXEL_ADDRESS_WIDTH-1:0] boid_read_address_wire2; // this is the input read loc for RAM.
	
	assign boid_read_address_wire2 = 19'd6410;
	
	//assign[PIXEL_ADDRESS_WIDTH-1:0] boid_read_address_wire = boid_read_address;


	wire boid_read_data;
	

	reg switchRam; // one cycle pulse to switch to a clear RAM

	RAM_resettable #(
		.DEPTH(PIXEL_COUNT), //depth = how many pixels on screen.
		.ADDR_WIDTH(PIXEL_ADDRESS_WIDTH) //address_width = how many bits needed to access that many pixels
	) Boid_display_mem(
		.clk(clock),
		.we(writing_to_boids_disp_wire),
		.reset(switchRam),

		.write_addr(boid_address_out),
		.read_addr(boid_read_address_wire),

		.write_data(1'b1), //if we is on, then write data = 1
		.read_data(boid_read_data), //read data is a reg - it's a 1 or 0.

		.LED(LED),
		
		.reset_pause(special_switch_reset_pause)
	);


	//-----------------------boid mem updating-----------------------------

	// counter for looping through boids
	reg[BITS_FOR_BOIDS-1:0] boid_counter;
	assign chosen_boid_to_read = boid_counter;


    reg ledA = 0; // for testing purposes.
    
    
//    wire RAM_refresh_pulse_choice = counter[20] & ~counter[19] &  ~counter[18] &  ~counter[17] &  ~counter[16] &  ~counter[15] &  ~counter[14] &  ~counter[13] &  ~counter[12] &  ~counter[11] &  ~counter[10] &  ~counter[9] &  ~counter[8] &  ~counter[7] &  ~counter[6] &  ~counter[5] &  ~counter[4] &  ~counter[3] &  ~counter[2] &  ~counter[1] &  ~counter[0];
    

    //choosing display method.
    
    wire RAM_refresh_pulse_1 = SW[1] ? screenEnd_out : refresh_slow_wire; 
    wire RAM_refresh_pulse = SW[0] ?  1'b0 : RAM_refresh_pulse_1; //choice 1
    
    wire special_switch_reset_pause = ~SW[15];
    
    //slowing down refresh rate
    
    reg[4:0] refresh_slow_reg;
    
    always @(posedge screenEnd_out) begin
        refresh_slow_reg <= refresh_slow_reg + 1; 
    end
    
    wire[4:0] refresh_slow_intermediate;
    wire refresh_slow_wire;
    
    assign refresh_slow_intermediate = refresh_slow_reg[3] & refresh_slow_reg[2] & refresh_slow_reg[1] & refresh_slow_reg[0];
    assign refresh_slow_wire = refresh_slow_intermediate & screenEnd_out;
   

	always @(posedge clock) begin
	
	   
	   if (RAM_refresh_pulse) begin // put RAM_refresh_pulse_choice in here and then it creates chaotic system
	       ledA = ~ledA;
	       writing_to_boids_disp = 1;
	       switchRam = 1; // could change this to choose RAM out here.
	   end else begin
	       if (writing_to_boids_disp) begin
                switchRam = 0; //this is a one cycle pulse to switch to a clear RAM
                boid_counter = boid_counter + 1;
                if (boid_counter == (MAX_BOIDS-1)) begin //change this value when num_boids changed.
                    writing_to_boids_disp = 0;
                    boid_counter = 0;
                end
            end
		end
	end
	

//    assign LED [12:0]  =  boid_read_address_wire2[14:0];
//    assign LED[0] = ledA;
//    assign LED[15] = boid_read_data; //ok so it is not reading correctly from memory

    

	//---------------------data to VGA controller--------------------------

	// at screen refresh end, update boid memory

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
								   .boid_read_data(boid_read_data), //outputs whether there is a boid in the pixel given by address
								   .scary_boid_x(scary_boid_x),
								   .scary_boid_y(scary_boid_y)
								   );
   
   // --------------------- Scary user boid -----------------------------------
   
   reg[9:0] scary_boid_x = 10'b100;
   reg[8:0] scary_boid_y = 9'b100;
   
   
   assign LED[9:0] = scary_boid_x;
   
   
   always @(posedge screenEnd_out) begin
        
        scary_boid_x = BTNR ? scary_boid_x + 1 : scary_boid_x;
        scary_boid_x = BTNL ? scary_boid_x - 1 : scary_boid_x;
        
        scary_boid_y = BTNU ? scary_boid_y + 1 : scary_boid_y;
        scary_boid_y = BTND ? scary_boid_y - 1 : scary_boid_y;
        
   end
   
   
   


endmodule