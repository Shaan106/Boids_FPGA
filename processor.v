/**
 * READ THIS DESCRIPTION!
 *
 * This is your processor module that will contain the bulk of your code submission. You are to implement
 * a 5-stage pipelined processor in this module, accounting for hazards and implementing bypasses as
 * necessary.
 *
 * Ultimately, your processor will be tested by a master skeleton, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file, Wrapper.v, acts as a small wrapper around your processor for this purpose. Refer to Wrapper.v
 * for more details.
 *
 * As a result, this module will NOT contain the RegFile nor the memory modules. Study the inputs 
 * very carefully - the RegFile-related I/Os are merely signals to be sent to the RegFile instantiated
 * in your Wrapper module. This is the same for your memory elements. 
 *
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for RegFile
    ctrl_writeReg,                  // O: Register to write to in RegFile
    ctrl_readRegA,                  // O: Register to read from port A of RegFile
    ctrl_readRegB,                  // O: Register to read from port B of RegFile
    data_writeReg,                  // O: Data to write to for RegFile
    data_readRegA,                  // I: Data from port A of RegFile
    data_readRegB                   // I: Data from port B of RegFile
	);

	// Control signals
	input clock, reset;
	
	// Imem (ROM)
    output [31:0] address_imem;
	input [31:0] q_imem;

	// Dmem (RAM)
	output [31:0] address_dmem, data;
	output wren;
	input [31:0] q_dmem;

	// Regfile
	output ctrl_writeEnable;
	output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	output [31:0] data_writeReg;
	input [31:0] data_readRegA, data_readRegB;

	/* YOUR CODE STARTS HERE */


    // GENERAL
    wire n_clock;

    assign n_clock = ~clock;


    wire RAM_data_bypass, stallSignalB, RAM_data_bypass_2;
    wire[1:0] ALUinA_bypass, ALUinB_bypass;

    bypass_controller bypass_controls(.opcode_DX(DX_controls_ext[16:12]), .opcode_XM(XM_controls_ext[16:12]), .opcode_MW(MW_controls_ext[16:12]), .ALUregA(DX_controls_ext[6:2]), .ALUregB(DX_controls_ext[11:7]), .XM_rd(regWriteID_XM), .MW_rd(MW_controls[16:12]), .DX_rd(DX_controls[16:12]), .FD_rs1(regA_to_read), .FD_rs2(regB_to_read), .FD_opcode(opcode), .RAM_data_bypass(RAM_data_bypass), .RAM_data_bypass_2(RAM_data_bypass_2), .ALUinA_bypass(ALUinA_bypass), .ALUinB_bypass(ALUinB_bypass), .stallSignalB(stallSignalB));


//----------- Fetch ----------

    // [PC Register] - falling edge - no need to implement,
    // debugging - make sure everything enabled correct
    // MUX to choose final PC_modified ----------------_!!!

    wire[31:0] PC; //current PC out of PC register
    wire[31:0] PC_modified; // This is either PC + 1 or branch address

    //flushing control for branches
    wire isBranchTaken;
    assign isBranchTaken = (DX_controls[22]) | (isNE & DX_controls[17]) | (bltCheck & DX_controls[23]) | (DX_controls[20]) | (isNE & DX_controls[25]);

    //PC register

    
    single_reg PC_reg(.q(PC), .d(PC_modified), .clk(n_clock), .en( (stallSignal) & (!stallSignalB) ), .clr(reset)); 

    wire[31:0] PC_plus1;
    //PC = PC + 1
    adder PC_plus_1(.out(PC_plus1), .operandA(PC), .operandB(32'b1), .carry_in(1'b0));

    //MUX to choose final PC_modified

    //jump target mux
    wire[31:0] temp_PC_1;
    mux_2 jump_target_mux(.out(temp_PC_1), .select((DX_controls[20])|(isNE & DX_controls[25])), .in0(PC_plus1), .in1(jump_address));

    wire[31:0] temp_PC_2;
    mux_2 bne_mux(.out(temp_PC_2), .select( (isNE & DX_controls[17]) | (bltCheck & DX_controls[23])), .in0(temp_PC_1), .in1(DX_PC_plus_one_plus_N));

    mux_2 jr_PC_mux(.out(PC_modified), .select(DX_controls[22]), .in0(temp_PC_2), .in1(ALU_inB));

    //giving current PC location to ROM, which returns next intruction to be executed
    assign address_imem = PC; 

    //q_imem is the nextinstruction to be executed

//---------- Fetch ----------


//---------- [FD Latch] ----------
    // two regs - to store instruction and to store PC.
    
    //outputs of latch
    wire [31:0] FD_PC, FD_Instruction;

    //storing PC + 1 in latch
    single_reg FD_latch_PC(.q(FD_PC), .d(PC), .clk(n_clock), .en((stallSignal) & (!stallSignalB)), .clr(reset));

    wire[31:0] F_instruction;

    mux_2 FD_latch_mux(.out(F_instruction), .select(isBranchTaken), .in0(q_imem), .in1(32'b0)); 

    //storing instruction in latch
    single_reg FD_latch_Instruction(.q(FD_Instruction), .d(F_instruction), .clk(n_clock), .en((stallSignal)  & (!stallSignalB)), .clr(reset)); 
    
//---------- [FD Latch] ----------


//---------- Decode ----------

    // Split binary instruction into different usable inputs
    wire[4:0] opcode;
    wire[26:0] operand;
    wire[4:0] rd, rs, rt, shamt, alu_op;
    wire[31:0] immidiate; //sign extended
    wire[31:0] target; //for jumping, 0 extended

    splitInstruction FD_split(.instruction(FD_Instruction), .opcode(opcode), .operand(operand), .rd(rd), .rs(rs), .rt(rt), .shamt(shamt), .alu_op(alu_op), .immidiate(immidiate), .target(target));
    
    // 2. Controller to set which MUXes to use
    wire regWE, ALUinIMM, RAM_WE, RAM_rd_write, read_from_RAM, jump_direct, read_rd, ctrl_bne, jal_write, jr_PC_update, ctrl_blt, ctrl_bex, ctrl_setx, rstatus_update, mult_signal, div_signal;
    wire[1:0] rstatus_inst;
    wire[4:0] alu_op_modified;
    controller allTheMuxes(.opcode(opcode), .alu_op_input(alu_op), .alu_op_modified(alu_op_modified), .regWriteEnable(regWE), .ALUinIMM(ALUinIMM), .RAM_WE(RAM_WE), .RAM_rd_write(RAM_rd_write), .read_from_RAM(read_from_RAM), .jump_direct(jump_direct), .read_rd(read_rd), .ctrl_bne(ctrl_bne), .jal_write(jal_write), .jr_PC_update(jr_PC_update), .ctrl_blt(ctrl_blt), .ctrl_bex(ctrl_bex), .ctrl_setx(ctrl_setx), .rstatus_update(rstatus_update), .rstatus_inst(rstatus_inst), .mult_signal(mult_signal), .div_signal(div_signal));

    //NOTE: need to pass in alu_op into controller because when addi, want to do add alu_op
    //but alu_op is taken over by imm there therefore it's wrong if unchanged.


    // 3. Get appropriate stuff from RegFile & write correctly to reg file
    wire[4:0] regWriteID;
    wire[31:0] regWriteData;
    wire regWriteEnable; //this is different from regWE, this is from writeback stage instruction, regWE is from current instruction

    // assign regWriteID = MW_regWriteID; // <---------------------- check this control signal IN MW Stage
    // assign regWriteData = MW_regWriteData; // <---------------------- check this control signal
    
    assign ctrl_writeEnable = regWriteEnable; //In writeback stage

    wire[4:0] regA_to_read;

    assign regA_to_read = (ctrl_bex) ? 5'b11110 : rs; // current rgeA to read from

    assign ctrl_readRegA = regA_to_read; // current rgeA to read from

    wire[31:0] regB_to_read_32; //choosing whether to read from rt or rd
    wire[31:0] rt_32, rd_32;
    assign rt_32[4:0] = rt;
    assign rd_32[4:0] = rd;

    mux_2 regB_mux(.out(regB_to_read_32), .select(read_rd), .in0(rt_32), .in1(rd_32));

    //moving around wires to make 32 bit mux work
    wire[4:0] regB_to_read;
    assign regB_to_read[4:0] = regB_to_read_32[4:0];

    assign ctrl_readRegB = regB_to_read; // current regB to read from

    assign ctrl_writeReg = regWriteID; // which register to write to (from MW stage)
    assign data_writeReg = regWriteData; // this wire is from WM stage with data to write into regfile

    // 4. assign values read
    wire[31:0] value_rs, value_rt;
    assign value_rs = data_readRegA;
    assign value_rt = data_readRegB;

    wire[31:0] latch_value_rt;
    mux_2 latch_rt_mux(.out(latch_value_rt), .select(ctrl_bex), .in0(value_rt), .in1(32'b0));


//---------- Decode ----------



//---------- [DX Latch] ----------
    // 5. Store values in DX Latch
    //storing PC in latch
    wire[31:0] DX_PC;
    single_reg DX_latch_PC(.q(DX_PC), .d(FD_PC), .clk(n_clock), .en(stallSignal), .clr(reset)); 

    //storing regAData in latch
    wire[31:0] DX_rs_data;
    single_reg DX_latch_regAData(.q(DX_rs_data), .d(value_rs), .clk(n_clock), .en(stallSignal), .clr(reset)); 

    //storing regBData in latch
    wire[31:0] DX_rt_data; // can contain rt data is read_rd is true (which it is in case of bne)
    single_reg DX_latch_regBData(.q(DX_rt_data), .d(latch_value_rt), .clk(n_clock), .en(stallSignal), .clr(reset)); 

    //storing immidiate in latch
    wire[31:0] DX_immidiate;
    single_reg DX_latch_immidiate(.q(DX_immidiate), .d(immidiate), .clk(n_clock), .en(stallSignal), .clr(reset));

    //storing target in latch
    wire[31:0] DX_target;
    single_reg DX_latch_target(.q(DX_target), .d(target), .clk(n_clock), .en(stallSignal), .clr(reset));
    

    // storing control signals in latch
    wire[31:0] DX_controls;
    wire[31:0] controller_controls;

    //these have the decoded controls for this current instruction
    // need to assign to correct muxes and control points at correct stage of pipeline

    assign controller_controls[0] = regWE; // register write enable
    assign controller_controls[1] = ALUinIMM; // ALU in immediate
    assign controller_controls[6:2] = alu_op_modified; // ALU operation (fixed via controller)
    assign controller_controls[11:7] = shamt; //shift amount
    assign controller_controls[16:12] = rd; //destination register
    //assign controller_controls[17] = RAM_rd_write; //RAM read/write THIS IS OBSOLETE
    assign controller_controls[17] = ctrl_bne; //branch not equal
    assign controller_controls[18] = RAM_WE; //RAM write enable
    assign controller_controls[19] = read_from_RAM; //read from RAM
    assign controller_controls[20] = jump_direct; //jump direct
    assign controller_controls[21] = jal_write; //jump and link write
    assign controller_controls[22] = jr_PC_update; //jump register PC update
    assign controller_controls[23] = ctrl_blt; //branch less than
    assign controller_controls[24] = ctrl_setx; //setx
    assign controller_controls[25] = ctrl_bex; //branch exception
    assign controller_controls[26] = rstatus_update; //rstatus update
    assign controller_controls[28:27] = rstatus_inst; //rstatus instruction

    wire[31:0] D_controller_controls;
    mux_2 FD_latch_mux_2(.out(D_controller_controls), .select(isBranchTaken | stallSignalB), .in0(controller_controls), .in1(32'b0)); 

    single_reg DX_latch_controls(.q(DX_controls), .d(D_controller_controls), .clk(n_clock), .en(stallSignal), .clr(reset));

    wire[31:0] DX_controls_ext;
    wire[31:0] controller_controls_ext;

    assign controller_controls_ext[0] = mult_signal; //mult signal
    assign controller_controls_ext[1] = div_signal; //div signal
    assign controller_controls_ext[6:2] = regA_to_read;
    assign controller_controls_ext[11:7] = regB_to_read;
    assign controller_controls_ext[16:12] = opcode;

    wire[31:0] D_controller_controls_ext;
    mux_2 FD_latch_mux_3(.out(D_controller_controls_ext), .select(isBranchTaken | stallSignalB), .in0(controller_controls_ext), .in1(32'b0));

    single_reg DX_latch_controls_ext(.q(DX_controls_ext), .d(D_controller_controls_ext), .clk(n_clock), .en(stallSignal), .clr(reset));

    wire[31:0] DX_md_reg, DX_md_reg_input, DX_md_temp;
    assign DX_md_temp[0] = mult_signal;
    assign DX_md_temp[1] = div_signal;

    mux_2 DX_md_mux(.out(DX_md_reg_input), .select(mult_pulse | div_pulse), .in0(DX_md_temp), .in1(32'b0));
    single_reg DX_md_reg_l(.q(DX_md_reg), .d(DX_md_reg_input), .clk(n_clock), .en(stallSignal | (mult_pulse | div_pulse)), .clr(reset));

//---------- [DX Latch] ----------




//---------- Execute ----------

    // ALU operations
    wire[31:0] ALU_inA, ALU_inB;

    //choosing inputs to ALU
    //assign ALU_inA = DX_rs_data;

    mux_4 ALUinA_bypass_mux(.out(ALU_inA), .select(ALUinA_bypass), .in0(DX_rs_data), .in1(regWriteData), .in2(XM_ALU_output_2), .in3(32'b0));

    wire[31:0] temp_ALU_inB;
    mux_4 ALUinB_bypass_mux(.out(temp_ALU_inB), .select(ALUinB_bypass), .in0(DX_rt_data), .in1(regWriteData), .in2(XM_ALU_output_2), .in3(32'b0));

    mux_2 ALU_inB_mux(.out(ALU_inB), .select(DX_controls[1]), .in0(temp_ALU_inB), .in1(DX_immidiate));

    wire[31:0] ALU_output;
    wire isNE, isLT, isOV;
    alu deceptivelyAwesomeALU(.data_operandA(ALU_inA), .data_operandB(ALU_inB), .ctrl_ALUopcode(DX_controls[6:2]), .ctrl_shiftamt(DX_controls[11:7]), .data_result(ALU_output), .isNotEqual(isNE), .isLessThan(isLT), .overflow(isOV));

    //this is for bne, calculating PC + 1 + immidiate
        //PC + 1
    wire[31:0] DX_PC_plus_one;
    adder DX_PC_plus_1(.out(DX_PC_plus_one), .operandA(DX_PC), .operandB(32'b1), .carry_in(1'b0));

        //PC + 1 + immidiate
    wire[31:0] DX_PC_plus_one_plus_N;
    adder DX_PC_plus_1_plus_N(.out(DX_PC_plus_one_plus_N), .operandA(DX_PC_plus_one), .operandB(DX_immidiate), .carry_in(1'b0));

    //whether to write into #r31

    wire[31:0] ALU_or_jal;
    mux_2 jal_mux(.out(ALU_or_jal), .select(DX_controls[21]), .in0(ALU_output), .in1(DX_PC_plus_one));

    wire[31:0] ALU_jal_or_T;
    mux_2 Tea_mux(.out(ALU_jal_or_T), .select(DX_controls[24]), .in0(ALU_or_jal), .in1(DX_target));

    wire[31:0] ALU_jT_or_mult;
    mux_2 mult_mux(.out(ALU_jT_or_mult), .select( (DX_controls_ext[0]) | (DX_controls_ext[1]) ), .in0(ALU_jal_or_T), .in1(multdiv_result));

    //MULTDIV MULTDIV
    wire[31:0] multdiv_result;
    wire multdiv_exception, multdiv_resultRDY;

    wire mult_pulse, div_pulse;
    pulse_generator mult_pulse_gen(.clk(clock), .in_signal(DX_md_reg[0]), .out_pulse(mult_pulse));
    pulse_generator div_pulse_gen(.clk(clock), .in_signal(DX_md_reg[1]), .out_pulse(div_pulse));

    wire[31:0] md_A, md_B;
    single_reg mdForA(.q(md_A), .d(ALU_inA), .clk(clock), .en(mult_pulse | div_pulse), .clr(reset));
    single_reg mdForB(.q(md_B), .d(ALU_inB), .clk(clock), .en(mult_pulse | div_pulse), .clr(reset));

    multdiv ruminatingMultiplierDiv(.data_operandA(md_A), .data_operandB(md_B), .ctrl_MULT(mult_pulse), .ctrl_DIV(div_pulse), .clock(clock), .data_result(multdiv_result), .data_exception(multdiv_exception), .data_resultRDY(multdiv_resultRDY));

    wire stallSignal;
    assign stallSignal = !( (DX_controls_ext[0] & !(multdiv_resultRDY)) | (DX_controls_ext[1] & !(multdiv_resultRDY)) );


    //address for jump
    wire[31:0] jump_address;
    assign jump_address = DX_target;

    //branch less than check
    wire bltCheck;
    assign bltCheck = (isNE) & !(isLT);

    assign DX_controls[31] = isOV; //overflow
    assign DX_controls[30] = isLT; //less than
    assign DX_controls[29] = isNE; //not equal
//---------- Execute ----------



//---------- [XM Latch] ----------
    // Store values in XM Latch

    // this is equivalent of O
    wire[31:0] XM_ALU_output;
    single_reg XM_latch_DataWriteLocation(.q(XM_ALU_output), .d(ALU_jT_or_mult), .clk(n_clock), .en(stallSignal), .clr(reset));

    // this is equivalent of B
    wire[31:0] XM_rt_data;

    wire[31:0] t323;
    assign t323 = (RAM_data_bypass_2) ? regWriteData : DX_rt_data;

    single_reg XM_latch_DataToWrite(.q(XM_rt_data), .d(t323), .clk(n_clock), .en(stallSignal), .clr(reset));

    //storing controls in latch
    wire[31:0] XM_controls;
    single_reg XM_latch_controls(.q(XM_controls), .d(DX_controls), .clk(n_clock), .en(stallSignal), .clr(reset));

    wire[31:0] XM_controls_ext;
    assign DX_controls_ext[31] = multdiv_exception;
    single_reg DX_latch_controls_ext3543(.q(XM_controls_ext), .d(DX_controls_ext), .clk(n_clock), .en(stallSignal), .clr(reset));
//---------- [EX Latch] ----------



//---------- Memory ----------


    wire[4:0] regWriteID_1;
    assign regWriteID_1 = (XM_controls[21]) ? 5'b11111 : XM_controls[16:12];

    wire[4:0] regWriteID_XM;
    assign regWriteID_XM = ((XM_controls[24])|(XM_controls[26] & XM_controls[31])|(XM_controls_ext[31] & XM_controls_ext[1])|(XM_controls_ext[31] & XM_controls_ext[0])) ? 5'b11110 : regWriteID_1;

    // 1. RAM operations

    wire[31:0] RAM_address_for_write;
    wire[31:0] RAM_data_for_write;

    assign RAM_address_for_write = XM_ALU_output; //RAM location to write to

    wire[1:0] sel_rstatus;
    assign sel_rstatus[0] = XM_controls[27] & XM_controls[31];
    assign sel_rstatus[1] = XM_controls[28] & XM_controls[31];

    mux_4 regWriteDataMux22(.out(regWriteData_2), .select(sel_rstatus), .in0(XM_ALU_output), .in1(32'b1), .in2(32'b00000000000000000000000000000010), .in3(32'b00000000000000000000000000000011));
    // regWriteData
    wire[31:0] regWriteData_2, regWriteData_3;

    mux_2 regWriteDataMux222(.out(regWriteData_3), .select((XM_controls_ext[31] & XM_controls_ext[0])), .in0(regWriteData_2), .in1(32'b00000000000000000000000000000100));

    wire[31:0] XM_ALU_output_2;

    mux_2 regWriteDataMux2222(.out(XM_ALU_output_2), .select((XM_controls_ext[31] & XM_controls_ext[1])), .in0(regWriteData_3), .in1(32'b00000000000000000000000000000101));

    //data to write to RAM
    // mux_2 RAM_data_mux(.out(RAM_data_for_write), .select(XM_controls[17]), .in0(XM_rt_data), .in1(XM_controls[16:12]));

    //below lines are input to RAM
    assign address_dmem = RAM_address_for_write;

    // assign RAM_data_for_write = XM_rt_data; // this contains rd during store word
    
    assign RAM_data_for_write = (RAM_data_bypass) ? regWriteData : XM_rt_data;

    assign data = RAM_data_for_write;

    //write enable control, need to implement.
    assign wren = XM_controls[18]; //RAM write enable

    //result from RAM is stored in q_dmem
    wire[31:0] RAM_data_out;
    assign RAM_data_out = q_dmem;

//---------- Memory ----------



//---------- [MW Latch] ----------
    // equivalent of O
    wire[31:0] MW_ALU_output;
    single_reg MW_latch_DataFromALU(.q(MW_ALU_output), .d(XM_ALU_output_2), .clk(n_clock), .en(stallSignal), .clr(reset));

    //equivalent of D
    wire[31:0] MW_RAM_data_out;
    single_reg MW_latch_DataFromRAM(.q(MW_RAM_data_out), .d(RAM_data_out), .clk(n_clock), .en(stallSignal), .clr(reset));

    //storing controls in latch

    wire[31:0] XM_controls_with_regID;

    assign XM_controls_with_regID[31:17] = XM_controls[31:17];
    assign XM_controls_with_regID[16:12] = regWriteID_XM;
    assign XM_controls_with_regID[11:0] = XM_controls[11:0];

    wire[31:0] MW_controls;
    single_reg MW_latch_controls(.q(MW_controls), .d(XM_controls_with_regID), .clk(n_clock), .en(stallSignal), .clr(reset));

    wire[31:0] MW_controls_ext;
    single_reg DX_latch_controls_ext3343(.q(MW_controls_ext), .d(XM_controls_ext), .clk(n_clock), .en(stallSignal), .clr(reset));
//---------- [MW Latch] ----------



//---------- Writeback ----------

    // just do a bunch of MUXes here

    // wire[4:0] regWriteID;
    // wire[31:0] regWriteData;
    // wire regWriteEnable;

    //control signal below, for now always write data from ALU
    // wire[31:0] regWriteData_1;
    mux_2 regWriteDataMux(.out(regWriteData), .select(MW_controls[19]), .in0(MW_ALU_output), .in1(MW_RAM_data_out));

    // wire[1:0] sel_rstatus;
    // assign sel_rstatus[0] = MW_controls[27] & MW_controls[31];
    // assign sel_rstatus[1] = MW_controls[28] & MW_controls[31];

    // mux_4 regWriteDataMux22(.out(regWriteData_2), .select(sel_rstatus), .in0(regWriteData_1), .in1(32'b1), .in2(32'b00000000000000000000000000000010), .in3(32'b00000000000000000000000000000011));
    // // regWriteData
    // wire[31:0] regWriteData_2, regWriteData_3;

    // mux_2 regWriteDataMux222(.out(regWriteData_3), .select((MW_controls_ext[31] & MW_controls_ext[0])), .in0(regWriteData_2), .in1(32'b00000000000000000000000000000100));

    // mux_2 regWriteDataMux2222(.out(regWriteData), .select((MW_controls_ext[31] & MW_controls_ext[1])), .in0(regWriteData_3), .in1(32'b00000000000000000000000000000101));

    // assign regWriteData = 32'b01101101101101101101101101101101;

    // mux_2 regWriteDataMux(.out(regWriteData), .select(1'b0), .in0(MW_ALU_output), .in1(MW_RAM_data_out));

    // write to destination register
    // assign regWriteID = MW_controls[16:12]; //destination register

    // wire[4:0] regWriteID_1;
    // assign regWriteID_1 = (MW_controls[21]) ? 5'b11111 : MW_controls[16:12];

    // assign regWriteID = ((MW_controls[24])|(MW_controls[26] & MW_controls[31])|(MW_controls_ext[31] & MW_controls_ext[1])|(MW_controls_ext[31] & MW_controls_ext[0])) ? 5'b11110 : regWriteID_1;

    assign regWriteID = MW_controls[16:12];

    // enable register write
    assign regWriteEnable = MW_controls[0]; //register write enable

	
//---------- Writeback ----------

	/* END CODE */
endmodule
