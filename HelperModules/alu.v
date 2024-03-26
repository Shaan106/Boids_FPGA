module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
        
    input [31:0] data_operandA, data_operandB;
    input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

    output [31:0] data_result;
    output isNotEqual, isLessThan, overflow;

    wire [31:0] shiftLeftOutput;
    wire [31:0] shiftRightOutput;
    wire [31:0] bitwiseAndOutput;
    wire [31:0] bitwiseOrOutput;
    wire [31:0] adderOutput;
    wire [31:0] subtractorOutput;

    // ----------------- SHIFT LEFT -----------------

    sll shiftleft( .shiftedNum(shiftLeftOutput), .operandA(data_operandA), .shamt(ctrl_shiftamt));

    // ----------------- SHIFT RIGHT ----------------- // 

    sra shiftright( .shiftedNum(shiftRightOutput), .operandA(data_operandA), .shamt(ctrl_shiftamt));

    // ----------------- BITWISE AND ----------------- //

    bitwise_and bitAnd( .out(bitwiseAndOutput), .operandA(data_operandA), .operandB(data_operandB));

    // ----------------- BITWISE OR ----------------- // 
    
    bitwise_or bitOr( .out(bitwiseOrOutput), .operandA(data_operandA), .operandB(data_operandB));

    // ----------------- ADDER ----------------- //

    wire const_zero;
    wire adderOverflow;
    assign const_zero = 1'b0;
    adder AddAB(.out(adderOutput), .operandA(data_operandA), .operandB(data_operandB), .carry_in(const_zero));

    isThereOverflow isItThereOverflowADD(.out(adderOverflow), .operandA(data_operandA), .operandB(data_operandB), .addResult(adderOutput));

    // ----------------- SUBTRACTOR ----------------- //

    wire const_one;
    wire subtractorOverflow;
    assign const_one = 1'b1;
    wire[31:0] flipped;

    bit_flipper bitFlopped(.out(flipped), .inputNum(data_operandB));
    adder SubAB(.out(subtractorOutput), .operandA(data_operandA), .operandB(flipped), .carry_in(const_one));

    isNotEqual isItNotEqual(.out(isNotEqual), .inputNum(subtractorOutput));
    isLessThan isItLessThan(.out(isLessThan), .operandA(data_operandA), .operandB(data_operandB), .inputNum(subtractorOutput));
    isThereOverflow isItThereOverflowSUB(.out(subtractorOverflow), .operandA(data_operandA), .operandB(flipped), .addResult(subtractorOutput));

    // ----------------- MUXING MUXING ----------------- //

    //choosing correct overflow

    assign overflow = ctrl_ALUopcode[0] ? subtractorOverflow : adderOverflow;

    mux_8 m1(.out(data_result), .select(ctrl_ALUopcode[2:0]), .in0(adderOutput), .in1(subtractorOutput), .in2(bitwiseAndOutput), .in3(bitwiseOrOutput), .in4(shiftLeftOutput), .in5(shiftRightOutput), .in6(32'b0), .in7(32'b0));

endmodule