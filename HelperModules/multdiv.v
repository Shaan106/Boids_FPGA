module multdiv(
	data_operandA, data_operandB, 
	ctrl_MULT, ctrl_DIV, 
	clock, 
	data_result, data_exception, data_resultRDY);

    input [31:0] data_operandA, data_operandB;
    input ctrl_MULT, ctrl_DIV, clock;

    output [31:0] data_result;
    output data_exception, data_resultRDY;

    // add your code here
    wire[63:0] bigMultOut;
    wire multReady, multDataException;
    // i have now realised that this is sadly not a wallace tree multiplier - but just a mere combinational multiplier
    wallaceTreeMultiplier wally(.data_operandA(data_operandA), .data_operandB(data_operandB), .clock(clock), .data_result(bigMultOut), .data_exception(multDataException), .data_resultRDY(multReady), .ctrl_MULT(ctrl_MULT));

    wire[31:0] divQuotient, divRemainder;
    wire divReady, divDataException;

    divider_called_bob morgan_freeman(.data_operandA(data_operandA), .data_operandB(data_operandB), .clock(clock), .ctrl_DIV(ctrl_DIV), .data_quotient(divQuotient), .data_remainder(divRemainder), .data_exception(divDataException), .data_resultRDY(divReady));

    //dffs to store if true innit

    wire lightningMcQueen; //0 = multiply, 1 = divide

    dffe_ref tow_truck(.q(lightningMcQueen), .d(ctrl_DIV), .clk(clock), .en(ctrl_DIV), .clr(ctrl_MULT)); //register is 0 if mult, 1 if divide

    assign data_resultRDY = lightningMcQueen ? divReady : multReady; //divReady if 1, multReady if 0

    // have to decide which one to output
    // have a dff that holds if it is a MULT or DIV

    mux_2 theDocHudson(.out(data_result), .select(lightningMcQueen), .in0(bigMultOut[31:0]), .in1(divQuotient));

    // assign data_exception = divDataException;

    assign data_exception = lightningMcQueen ? divDataException : multDataException;

    // assign data_result = bigMultOut[31:0];


endmodule