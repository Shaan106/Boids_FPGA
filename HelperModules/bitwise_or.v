module bitwise_or (out, operandA, operandB);

    input[31:0] operandA, operandB;
    output[31:0] out;

    or AorB0(out[0],  operandA[0], operandB[0]);
    or AorB1(out[1],  operandA[1], operandB[1]);
    or AorB2(out[2],  operandA[2], operandB[2]);
    or AorB3(out[3],  operandA[3], operandB[3]);
    or AorB4(out[4],  operandA[4], operandB[4]);
    or AorB5(out[5],  operandA[5], operandB[5]);
    or AorB6(out[6],  operandA[6], operandB[6]);
    or AorB7(out[7],  operandA[7], operandB[7]);
    or AorB8(out[8],  operandA[8], operandB[8]);
    or AorB9(out[9],  operandA[9], operandB[9]);
    or AorB10(out[10], operandA[10], operandB[10]);
    or AorB11(out[11], operandA[11], operandB[11]);
    or AorB12(out[12], operandA[12], operandB[12]);
    or AorB13(out[13], operandA[13], operandB[13]);
    or AorB14(out[14], operandA[14], operandB[14]);
    or AorB15(out[15], operandA[15], operandB[15]);
    or AorB16(out[16], operandA[16], operandB[16]);
    or AorB17(out[17], operandA[17], operandB[17]);
    or AorB18(out[18], operandA[18], operandB[18]);
    or AorB19(out[19], operandA[19], operandB[19]);
    or AorB20(out[20], operandA[20], operandB[20]);
    or AorB21(out[21], operandA[21], operandB[21]);
    or AorB22(out[22], operandA[22], operandB[22]);
    or AorB23(out[23], operandA[23], operandB[23]);
    or AorB24(out[24], operandA[24], operandB[24]);
    or AorB25(out[25], operandA[25], operandB[25]);
    or AorB26(out[26], operandA[26], operandB[26]);
    or AorB27(out[27], operandA[27], operandB[27]);
    or AorB28(out[28], operandA[28], operandB[28]);
    or AorB29(out[29], operandA[29], operandB[29]);
    or AorB30(out[30], operandA[30], operandB[30]);
    or AorB31(out[31], operandA[31], operandB[31]);


    
endmodule