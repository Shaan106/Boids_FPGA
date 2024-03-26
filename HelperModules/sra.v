
module sra_Nshift #(parameter numShifts = 1) (in, out);
    input[31:0] in;
    output[31:0] out;

    assign out[31:31-(numShifts-1)] = {numShifts{in[31]}};
    assign out[31-numShifts:0] = in[31:numShifts];

endmodule


module sra (shiftedNum, operandA, shamt);

    input[31:0] operandA;
    input[4:0] shamt;
    output[31:0] shiftedNum;

    wire[31:0] stage16, stage8, stage4, stage2, stage1;
    wire[31:0] shifted16, shifted8, shifted4, shifted2, shifted1;

    //shifting right by 16
    sra_Nshift #(16) shift16(.in(operandA), .out(shifted16));
    mux_2 stage16mux(stage16, shamt[4], operandA, shifted16);

    //shifting right by 8
    sra_Nshift #(8) shift8(.in(stage16), .out(shifted8));
    mux_2 stage8mux(stage8, shamt[3], stage16, shifted8);

    //shifting right by 4
    sra_Nshift #(4) shift4(.in(stage8), .out(shifted4));
    mux_2 stage4mux(stage4, shamt[2], stage8, shifted4);

    //shifting right by 2
    sra_Nshift #(2) shift2(.in(stage4), .out(shifted2));
    mux_2 stage2mux(stage2, shamt[1], stage4, shifted2);

    //shifting right by 1
    sra_Nshift #(1) shift1(.in(stage2), .out(shifted1));
    mux_2 stage1mux(shiftedNum, shamt[0], stage2, shifted1);

endmodule