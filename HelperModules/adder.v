module adder (out, operandA, operandB, carry_in);

    input[31:0] operandA, operandB;
    input carry_in;
    output[31:0] out;

    //bitwise and to generate all "g" bits
    wire[31:0] generateBits;
    bitwise_and gFunc(.out(generateBits), .operandA(operandA), .operandB(operandB));

    wire [31:0] propogateBits;
    bitwise_or pFunc(.out(propogateBits), .operandA(operandA), .operandB(operandB));

    //big G and P generating (and setting) c0, c8, c16, c24, c32
    wire temp_c8, temp_c16, temp_c24, temp_c32;

    // module CLA_L2_block (c8, c16, c24, c32, g, p, cIn);
    CLA_L2_block L2_block(.c8(temp_c8), .c16(temp_c16), .c24(temp_c24), .c32(temp_c32), .g(generateBits), .p(propogateBits), .cIn(carry_in));

    // ------------------------------------ society ---------
    wire[31:0] carryBitsMain;

    // module CLA_L1_block (carryBits, g, p, cIn);
    CLA_L1_block bits0_7Block(.carryBits(carryBitsMain[7:0]), .g(generateBits[7:0]), .p(propogateBits[7:0]), .cIn(carry_in));
    
    CLA_L1_block bits8_15Block(.carryBits(carryBitsMain[15:8]), .g(generateBits[15:8]), .p(propogateBits[15:8]), .cIn(temp_c8));

    CLA_L1_block bits16_23Block(.carryBits(carryBitsMain[23:16]), .g(generateBits[23:16]), .p(propogateBits[23:16]), .cIn(temp_c16));

    CLA_L1_block bits24_31Block(.carryBits(carryBitsMain[31:24]), .g(generateBits[31:24]), .p(propogateBits[31:24]), .cIn(temp_c24));

    xor bit0(out[0], carryBitsMain[0], operandA[0], operandB[0]); 
    xor bit1(out[1], carryBitsMain[1], operandA[1], operandB[1]);
    xor bit2(out[2], carryBitsMain[2], operandA[2], operandB[2]);
    xor bit3(out[3], carryBitsMain[3], operandA[3], operandB[3]);
    xor bit4(out[4], carryBitsMain[4], operandA[4], operandB[4]);
    xor bit5(out[5], carryBitsMain[5], operandA[5], operandB[5]);
    xor bit6(out[6], carryBitsMain[6], operandA[6], operandB[6]);
    xor bit7(out[7], carryBitsMain[7], operandA[7], operandB[7]);
    xor bit8(out[8], carryBitsMain[8], operandA[8], operandB[8]);
    xor bit9(out[9], carryBitsMain[9], operandA[9], operandB[9]);
    xor bit10(out[10], carryBitsMain[10], operandA[10], operandB[10]);
    xor bit11(out[11], carryBitsMain[11], operandA[11], operandB[11]);
    xor bit12(out[12], carryBitsMain[12], operandA[12], operandB[12]);
    xor bit13(out[13], carryBitsMain[13], operandA[13], operandB[13]);
    xor bit14(out[14], carryBitsMain[14], operandA[14], operandB[14]);
    xor bit15(out[15], carryBitsMain[15], operandA[15], operandB[15]);
    xor bit16(out[16], carryBitsMain[16], operandA[16], operandB[16]);
    xor bit17(out[17], carryBitsMain[17], operandA[17], operandB[17]);
    xor bit18(out[18], carryBitsMain[18], operandA[18], operandB[18]);
    xor bit19(out[19], carryBitsMain[19], operandA[19], operandB[19]);
    xor bit20(out[20], carryBitsMain[20], operandA[20], operandB[20]);
    xor bit21(out[21], carryBitsMain[21], operandA[21], operandB[21]);
    xor bit22(out[22], carryBitsMain[22], operandA[22], operandB[22]);
    xor bit23(out[23], carryBitsMain[23], operandA[23], operandB[23]);
    xor bit24(out[24], carryBitsMain[24], operandA[24], operandB[24]);
    xor bit25(out[25], carryBitsMain[25], operandA[25], operandB[25]);
    xor bit26(out[26], carryBitsMain[26], operandA[26], operandB[26]);
    xor bit27(out[27], carryBitsMain[27], operandA[27], operandB[27]);
    xor bit28(out[28], carryBitsMain[28], operandA[28], operandB[28]);
    xor bit29(out[29], carryBitsMain[29], operandA[29], operandB[29]);
    xor bit30(out[30], carryBitsMain[30], operandA[30], operandB[30]);
    xor bit31(out[31], carryBitsMain[31], operandA[31], operandB[31]);
    
endmodule