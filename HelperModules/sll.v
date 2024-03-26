module sll (shiftedNum, operandA, shamt);

    input[31:0] operandA;
    input[4:0] shamt;
    output[31:0] shiftedNum;

    wire[31:0] stage16, stage8, stage4, stage2, stage1;
    wire[31:0] shifted16, shifted8, shifted4, shifted2, shifted1;

    //doing the 16 shift stage -----------------------------------------------------------

    assign shifted16[31] = operandA[15];
    assign shifted16[30] = operandA[14];
    assign shifted16[29] = operandA[13];
    assign shifted16[28] = operandA[12];
    assign shifted16[27] = operandA[11];
    assign shifted16[26] = operandA[10];
    assign shifted16[25] = operandA[9];
    assign shifted16[24] = operandA[8];
    assign shifted16[23] = operandA[7];
    assign shifted16[22] = operandA[6];
    assign shifted16[21] = operandA[5];
    assign shifted16[20] = operandA[4];
    assign shifted16[19] = operandA[3];
    assign shifted16[18] = operandA[2];
    assign shifted16[17] = operandA[1];
    assign shifted16[16] = operandA[0];
    assign shifted16[15] = 0;
    assign shifted16[14] = 0;
    assign shifted16[13] = 0;
    assign shifted16[12] = 0;
    assign shifted16[11] = 0;
    assign shifted16[10] = 0;
    assign shifted16[9]  = 0;
    assign shifted16[8]  = 0;
    assign shifted16[7]  = 0;
    assign shifted16[6]  = 0;
    assign shifted16[5]  = 0;
    assign shifted16[4]  = 0;
    assign shifted16[3]  = 0;
    assign shifted16[2]  = 0;
    assign shifted16[1]  = 0;
    assign shifted16[0]  = 0;


    mux_2 stage16mux(stage16, shamt[4], operandA, shifted16);


    //doing the 8 shift stage -----------------------------------------------------------

    assign shifted8[31] = stage16[23];
    assign shifted8[30] = stage16[22];
    assign shifted8[29] = stage16[21];
    assign shifted8[28] = stage16[20];
    assign shifted8[27] = stage16[19];
    assign shifted8[26] = stage16[18];
    assign shifted8[25] = stage16[17];
    assign shifted8[24] = stage16[16];
    assign shifted8[23] = stage16[15];
    assign shifted8[22] = stage16[14];
    assign shifted8[21] = stage16[13];
    assign shifted8[20] = stage16[12];
    assign shifted8[19] = stage16[11];
    assign shifted8[18] = stage16[10];
    assign shifted8[17] = stage16[9];
    assign shifted8[16] = stage16[8];
    assign shifted8[15] = stage16[7];
    assign shifted8[14] = stage16[6];
    assign shifted8[13] = stage16[5];
    assign shifted8[12] = stage16[4];
    assign shifted8[11] = stage16[3];
    assign shifted8[10] = stage16[2];
    assign shifted8[9]  = stage16[1];
    assign shifted8[8]  = stage16[0];
    assign shifted8[7]  = 0;
    assign shifted8[6]  = 0;
    assign shifted8[5]  = 0;
    assign shifted8[4]  = 0;
    assign shifted8[3]  = 0;
    assign shifted8[2]  = 0;
    assign shifted8[1]  = 0;
    assign shifted8[0]  = 0;

    mux_2 stage8mux(stage8, shamt[3], stage16, shifted8);

    //doing the 4 shift stage -----------------------------------------------------------

    assign shifted4[31] = stage8[27];
    assign shifted4[30] = stage8[26];
    assign shifted4[29] = stage8[25];
    assign shifted4[28] = stage8[24];
    assign shifted4[27] = stage8[23];
    assign shifted4[26] = stage8[22];
    assign shifted4[25] = stage8[21];
    assign shifted4[24] = stage8[20];
    assign shifted4[23] = stage8[19];
    assign shifted4[22] = stage8[18];
    assign shifted4[21] = stage8[17];
    assign shifted4[20] = stage8[16];
    assign shifted4[19] = stage8[15];
    assign shifted4[18] = stage8[14];
    assign shifted4[17] = stage8[13];
    assign shifted4[16] = stage8[12];
    assign shifted4[15] = stage8[11];
    assign shifted4[14] = stage8[10];
    assign shifted4[13] = stage8[9];
    assign shifted4[12] = stage8[8];
    assign shifted4[11] = stage8[7];
    assign shifted4[10] = stage8[6];
    assign shifted4[9]  = stage8[5];
    assign shifted4[8]  = stage8[4];
    assign shifted4[7]  = stage8[3];
    assign shifted4[6]  = stage8[2];
    assign shifted4[5]  = stage8[1];
    assign shifted4[4]  = stage8[0];
    assign shifted4[3]  = 0;
    assign shifted4[2]  = 0;
    assign shifted4[1]  = 0;
    assign shifted4[0]  = 0;

    mux_2 stage4mux(stage4, shamt[2], stage8, shifted4);

    //doing the 2 shift stage -----------------------------------------------------------

    assign shifted2[31] = stage4[29];
    assign shifted2[30] = stage4[28];
    assign shifted2[29] = stage4[27];
    assign shifted2[28] = stage4[26];
    assign shifted2[27] = stage4[25];
    assign shifted2[26] = stage4[24];
    assign shifted2[25] = stage4[23];
    assign shifted2[24] = stage4[22];
    assign shifted2[23] = stage4[21];
    assign shifted2[22] = stage4[20];
    assign shifted2[21] = stage4[19];
    assign shifted2[20] = stage4[18];
    assign shifted2[19] = stage4[17];
    assign shifted2[18] = stage4[16];
    assign shifted2[17] = stage4[15];
    assign shifted2[16] = stage4[14];
    assign shifted2[15] = stage4[13];
    assign shifted2[14] = stage4[12];
    assign shifted2[13] = stage4[11];
    assign shifted2[12] = stage4[10];
    assign shifted2[11] = stage4[9];
    assign shifted2[10] = stage4[8];
    assign shifted2[9]  = stage4[7];
    assign shifted2[8]  = stage4[6];
    assign shifted2[7]  = stage4[5];
    assign shifted2[6]  = stage4[4];
    assign shifted2[5]  = stage4[3];
    assign shifted2[4]  = stage4[2];
    assign shifted2[3]  = stage4[1];
    assign shifted2[2]  = stage4[0];
    assign shifted2[1]  = 0;
    assign shifted2[0]  = 0;

    mux_2 stage2mux(stage2, shamt[1], stage4, shifted2);

    //doing the 1 shift stage -----------------------------------------------------------

    assign shifted1[31] = stage2[30];
    assign shifted1[30] = stage2[29];
    assign shifted1[29] = stage2[28];
    assign shifted1[28] = stage2[27];
    assign shifted1[27] = stage2[26];
    assign shifted1[26] = stage2[25];
    assign shifted1[25] = stage2[24];
    assign shifted1[24] = stage2[23];
    assign shifted1[23] = stage2[22];
    assign shifted1[22] = stage2[21];
    assign shifted1[21] = stage2[20];
    assign shifted1[20] = stage2[19];
    assign shifted1[19] = stage2[18];
    assign shifted1[18] = stage2[17];
    assign shifted1[17] = stage2[16];
    assign shifted1[16] = stage2[15];
    assign shifted1[15] = stage2[14];
    assign shifted1[14] = stage2[13];
    assign shifted1[13] = stage2[12];
    assign shifted1[12] = stage2[11];
    assign shifted1[11] = stage2[10];
    assign shifted1[10] = stage2[9];
    assign shifted1[9]  = stage2[8];
    assign shifted1[8]  = stage2[7];
    assign shifted1[7]  = stage2[6];
    assign shifted1[6]  = stage2[5];
    assign shifted1[5]  = stage2[4];
    assign shifted1[4]  = stage2[3];
    assign shifted1[3]  = stage2[2];
    assign shifted1[2]  = stage2[1];
    assign shifted1[1]  = stage2[0];
    assign shifted1[0]  = 0;

    mux_2 stage1mux(shiftedNum, shamt[0], stage2, shifted1);


endmodule