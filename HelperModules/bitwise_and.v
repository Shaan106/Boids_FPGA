

module bitwise_and (out, operandA, operandB);

    input[31:0] operandA, operandB;
    output[31:0] out;

    and AandB0(out[0],  operandA[0], operandB[0]);
    and AandB1(out[1],  operandA[1], operandB[1]);
    and AandB2(out[2],  operandA[2], operandB[2]);
    and AandB3(out[3],  operandA[3], operandB[3]);
    and AandB4(out[4],  operandA[4], operandB[4]);
    and AandB5(out[5],  operandA[5], operandB[5]);
    and AandB6(out[6],  operandA[6], operandB[6]);
    and AandB7(out[7],  operandA[7], operandB[7]);
    and AandB8(out[8],  operandA[8], operandB[8]);
    and AandB9(out[9],  operandA[9], operandB[9]);
    and AandB10(out[10], operandA[10], operandB[10]);
    and AandB11(out[11], operandA[11], operandB[11]);
    and AandB12(out[12], operandA[12], operandB[12]);
    and AandB13(out[13], operandA[13], operandB[13]);
    and AandB14(out[14], operandA[14], operandB[14]);
    and AandB15(out[15], operandA[15], operandB[15]);
    and AandB16(out[16], operandA[16], operandB[16]);
    and AandB17(out[17], operandA[17], operandB[17]);
    and AandB18(out[18], operandA[18], operandB[18]);
    and AandB19(out[19], operandA[19], operandB[19]);
    and AandB20(out[20], operandA[20], operandB[20]);
    and AandB21(out[21], operandA[21], operandB[21]);
    and AandB22(out[22], operandA[22], operandB[22]);
    and AandB23(out[23], operandA[23], operandB[23]);
    and AandB24(out[24], operandA[24], operandB[24]);
    and AandB25(out[25], operandA[25], operandB[25]);
    and AandB26(out[26], operandA[26], operandB[26]);
    and AandB27(out[27], operandA[27], operandB[27]);
    and AandB28(out[28], operandA[28], operandB[28]);
    and AandB29(out[29], operandA[29], operandB[29]);
    and AandB30(out[30], operandA[30], operandB[30]);
    and AandB31(out[31], operandA[31], operandB[31]);


    
endmodule