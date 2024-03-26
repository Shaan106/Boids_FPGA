module splitInstruction(instruction, opcode, operand, rd, rs, rt, shamt, alu_op, immidiate, target);

    input [31:0] instruction;

    output [4:0] opcode;
    output [26:0] operand;
    output [4:0] rd, rs, rt, shamt, alu_op;
    output [31:0] immidiate; //sign extended
    output [31:0] target; //for jumping


    assign opcode = instruction[31:27];
    assign operand = instruction[26:0];

    assign rd[4:0] = instruction[26:22];
    assign rs[4:0] = instruction[21:17];
    assign rt[4:0] = instruction[16:12];
    assign shamt[4:0] = instruction[11:7];
    assign alu_op[4:0] = instruction[6:2];

    assign immidiate[16:0] = instruction[16:0];
    assign immidiate[31] = instruction[16];
    assign immidiate[30] = instruction[16];
    assign immidiate[29] = instruction[16];
    assign immidiate[28] = instruction[16];
    assign immidiate[27] = instruction[16];
    assign immidiate[26] = instruction[16];
    assign immidiate[25] = instruction[16];
    assign immidiate[24] = instruction[16];
    assign immidiate[23] = instruction[16];
    assign immidiate[22] = instruction[16];
    assign immidiate[21] = instruction[16];
    assign immidiate[20] = instruction[16];
    assign immidiate[19] = instruction[16];
    assign immidiate[18] = instruction[16];
    assign immidiate[17] = instruction[16];

    assign target[26:0] = instruction[26:0];
    assign target[27] = 1'b0;
    assign target[28] = 1'b0;
    assign target[29] = 1'b0;
    assign target[30] = 1'b0;
    assign target[31] = 1'b0;

endmodule