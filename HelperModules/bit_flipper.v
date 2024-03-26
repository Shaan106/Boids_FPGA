module bit_flipper (out, inputNum);

    input[31:0] inputNum;
    output[31:0] out;

    not not_gate31(out[31], inputNum[31]);
    not not_gate30(out[30], inputNum[30]);
    not not_gate29(out[29], inputNum[29]);
    not not_gate28(out[28], inputNum[28]);
    not not_gate27(out[27], inputNum[27]);
    not not_gate26(out[26], inputNum[26]);
    not not_gate25(out[25], inputNum[25]);
    not not_gate24(out[24], inputNum[24]);
    not not_gate23(out[23], inputNum[23]);
    not not_gate22(out[22], inputNum[22]);
    not not_gate21(out[21], inputNum[21]);
    not not_gate20(out[20], inputNum[20]);
    not not_gate19(out[19], inputNum[19]);
    not not_gate18(out[18], inputNum[18]);
    not not_gate17(out[17], inputNum[17]);
    not not_gate16(out[16], inputNum[16]);
    not not_gate15(out[15], inputNum[15]);
    not not_gate14(out[14], inputNum[14]);
    not not_gate13(out[13], inputNum[13]);
    not not_gate12(out[12], inputNum[12]);
    not not_gate11(out[11], inputNum[11]);
    not not_gate10(out[10], inputNum[10]);
    not not_gate9(out[9], inputNum[9]);
    not not_gate8(out[8], inputNum[8]);
    not not_gate7(out[7], inputNum[7]);
    not not_gate6(out[6], inputNum[6]);
    not not_gate5(out[5], inputNum[5]);
    not not_gate4(out[4], inputNum[4]);
    not not_gate3(out[3], inputNum[3]);
    not not_gate2(out[2], inputNum[2]);
    not not_gate1(out[1], inputNum[1]);
    not not_gate0(out[0], inputNum[0]);

endmodule