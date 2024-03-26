
module isThereOverflow (out, operandA, operandB, addResult);

    //input two numbers being added and the result of the addition
    //if (!A and !B and C) or (A and B and !C) then overflow

    //have to deal with overflow

    input[31:0] operandA, operandB, addResult;
    output out;

    wire notA, notB, notResult;

    not notA1(notA, operandA[31]);
    not notB1(notB, operandB[31]);
    not notR1(notResult, addResult[31]);

    //case two positives make a negative
    wire case1;

    and and_case1(case1, notA, notB, addResult[31]);

    // case two negatives make a positive
    wire case2;

    and and_case2(case2, operandA[31], operandB[31], notResult);

    // final or gate for output

    or final_or(out, case1, case2);


endmodule