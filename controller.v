module controller(opcode, alu_op_input, alu_op_modified, regWriteEnable, ALUinIMM, RAM_WE, RAM_rd_write, read_from_RAM, jump_direct, 
read_rd, ctrl_bne, jal_write, jr_PC_update, ctrl_blt, ctrl_bex, ctrl_setx, rstatus_update, rstatus_inst, mult_signal, div_signal);

    input [4:0] opcode;
    input [4:0] alu_op_input;

    output[4:0] alu_op_modified; //ie store word would turn add optype on
    output regWriteEnable;
    output ALUinIMM;
    output RAM_WE, RAM_rd_write;
    output read_from_RAM;
    output jump_direct;
    output read_rd;
    output ctrl_bne;
    output jal_write;
    output jr_PC_update;
    output ctrl_blt;
    output ctrl_bex;
    output ctrl_setx;
    output rstatus_update;
    output[1:0] rstatus_inst;
    output mult_signal;
    output div_signal;

    //checking if opcode is all 0
    wire opcodeZero;
    assign opcodeZero = |opcode;

    wire[31:0] tempALU_op;

    assign tempALU_op[0] = 1'b0;
    assign tempALU_op[1] = 1'b0;
    assign tempALU_op[2] = 1'b0;
    assign tempALU_op[3] = 1'b0;
    assign tempALU_op[4] = 1'b0;

    wire[31:0] alu_op_input_t;
    assign alu_op_input_t[4:0] = alu_op_input;

    wire[31:0] alu_op_modified_t;
    //setting ALU_op to read ALU_op if all 0 opcode, otherwise to add.
    mux_2 chooseALU_modified(.out(alu_op_modified_t), .select(opcodeZero), .in0(alu_op_input_t), .in1(tempALU_op));

    assign alu_op_modified = alu_op_modified_t[4:0];

    wire[31:0] operationSelected;

    decoder32 decoder(.out(operationSelected), .select(opcode), .enable(1'b1));

    //finding out which ALU instruction was chosen
    wire[31:0] ALUinst;
    decoder32 ALUdecoder(.out(ALUinst), .select(alu_op_input), .enable(1'b1));
    wire add;
    assign add = ALUinst[0];
    wire sub;
    assign sub = ALUinst[1];
    wire and_ALU;
    assign and_ALU = ALUinst[2];
    wire or_ALU;
    assign or_ALU = ALUinst[3];
    wire sll;
    assign sll = ALUinst[4];
    wire sra;
    assign sra = ALUinst[5];
    wire mul;
    assign mul = ALUinst[6];
    wire div;
    assign div = ALUinst[7];

    // control for mult
    assign mult_signal = ALU & mul;

    // control for div
    assign div_signal = ALU & div;


    wire ALU;
    assign ALU = operationSelected[0];
    wire jump;
    assign jump = operationSelected[1];
    wire bne;
    assign bne = operationSelected[2];
    wire jal;
    assign jal = operationSelected[3];
    wire jr;
    assign jr = operationSelected[4];
    wire addi;
    assign addi = operationSelected[5];
    wire blt;
    assign blt = operationSelected[6];
    wire sw;
    assign sw = operationSelected[7];
    wire lw;
    assign lw = operationSelected[8];


    wire bex;
    assign bex = operationSelected[22];
    wire setx;
    assign setx = operationSelected[21];


    //operationSelected[0] is add through div (not including addi)
    //operationSelected[5] is addi

    // regfile write enable
    assign regWriteEnable = ALU | addi | lw | jal | setx; 

    // is ALU data B in immidiate wire
    assign ALUinIMM = addi | sw | lw;

    // RAM write enable
    assign RAM_WE = sw;

    // is write data for RAM in rd control
    assign RAM_rd_write = 1'b0;

    // is the read data from RAM
    assign read_from_RAM = lw;

    // controls whether to set the PC to the target address from j T instruction
    assign jump_direct = jump | jal;

    // controls whether the second register read is rd (or left as rt)
    assign read_rd = sw | bne | jr | blt;

    // control alongside isNE, to make sure doesnt branch accidentally
    assign ctrl_bne = bne;

    // control for jal to write into $r31
    assign jal_write = jal;

    // control for jr to update PC
    assign jr_PC_update = jr;

    // control for blt
    assign ctrl_blt = blt;

    // control for bex
    assign ctrl_bex = bex;

    // control for setx
    assign ctrl_setx = setx;

    // control for rstatus update
    assign rstatus_update = addi | (ALU & add) | (ALU & sub);

    // control for rstatus instruction
    assign rstatus_inst[1] = addi | (ALU & sub);
    assign rstatus_inst[0] = (ALU & add) | (ALU & sub);



endmodule