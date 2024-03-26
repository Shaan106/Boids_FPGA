
module isLessThan (out, operandA, operandB, inputNum);

    //input num is the output from a subtraction
    //if the msb is 1 then A < B (because then A - B is -ve => msb = 1)

    //have to deal with overflow

    input[31:0] operandA, operandB, inputNum;
    output out;

    wire w1;

    xor d1(w1, operandA[31], operandB[31]);
    assign out = w1 ? operandA[31] : inputNum[31];

endmodule