module isNotEqual (out, inputNum);

    //input num is the output from a subtraction
    //if the bits are all equal then input num is all zeros.

    input[31:0] inputNum;
    output out;

    wire w1,w2,w3,w4;

    or or_gate_07(w1, inputNum[0], inputNum[1], inputNum[2], inputNum[3], inputNum[4], inputNum[5], inputNum[6], inputNum[7]);
    or or_gate_815(w2, inputNum[8], inputNum[9], inputNum[10], inputNum[11], inputNum[12], inputNum[13], inputNum[14], inputNum[15]);
    or or_gate_1623(w3, inputNum[16], inputNum[17], inputNum[18], inputNum[19], inputNum[20], inputNum[21], inputNum[22], inputNum[23]);
    or or_gate_2431(w4, inputNum[24], inputNum[25], inputNum[26], inputNum[27], inputNum[28], inputNum[29], inputNum[30], inputNum[31]);

    or final_or(out, w1, w2, w3, w4);

endmodule