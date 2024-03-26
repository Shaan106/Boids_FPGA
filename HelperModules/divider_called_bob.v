module divider_called_bob(
    data_operandA, data_operandB, 
    clock, ctrl_DIV,
    data_quotient, data_remainder, data_exception, data_resultRDY);

    input [31:0] data_operandA, data_operandB;
    input clock;
    input ctrl_DIV; // when this is 1, reset counter to start division.

    output [31:0] data_quotient, data_remainder;
    output data_exception, data_resultRDY;

    assign data_resultRDY = (counter[5] & (~counter[4]) & (~counter[3]) & (~counter[2]) & (~counter[1]) & counter[0]);

    // exceptions

    // Inside the divider_called_bob module
    // always @(posedge clock) begin
    //     if (ctrl_DIV) $display("Reset activated at time %t", $time);
    //     $display("OperandA = %d, OperandB = %d, Result = %d, ready? = %b, remainder = %d, Counter = %d, rqLoop = %b",
    //             data_operandA, data_operandB, data_quotient, data_resultRDY, data_remainder, counter, remainder_quotient_out);
    // end

    // have not returned proper remainder because need to do final +D after cycle 33. -- I FIXED IT =D

    //---------------------------COUNTER COUNTER---------------------------
    wire[5:0] counter;
    //output[5:0] counter;
    counter my_counter_is_faster(.clock(clock), .reset(ctrl_DIV), .count(counter));

    //-------------------------- cycle 0 setup initial -------------------

    //making sure that both the divisor and dividend is positive

    wire[31:0] negOpA;
    adder divider_child_bob(.out(negOpA), .operandA(~(data_operandA)), .operandB(32'b0), .carry_in(1'b1));

    wire[31:0] negOpB;
    adder divider_child_bob2(.out(negOpB), .operandA(~(data_operandB)), .operandB(32'b0), .carry_in(1'b1));

    wire[31:0] modOpA, modOpB;
    mux_2 joeseph(.out(modOpA), .select(data_operandA[31]), .in0(data_operandA), .in1(negOpA));
    mux_2 joeseph2(.out(modOpB), .select(data_operandB[31]), .in0(data_operandB), .in1(negOpB));
    

    wire[31:0] negDivisor; // -divisor
    wire[31:0] notDivisor;
    assign notDivisor = ~modOpB;
    adder divider_child_bob53(.out(negDivisor), .operandA(notDivisor), .operandB(32'b0), .carry_in(1'b1));

    wire[31:0] divisor; // +divisor
    assign divisor[31:0] = modOpB[31:0];

    wire[63:0] remainder_quotient_out, remainder_quotient_in, remainder_quotient_initial, remainder_quotient_loop; 
    //out is out of reg, in is into reg

    assign remainder_quotient_initial[63:32] = 32'b0; //top half all 0s
    assign remainder_quotient_initial[31:0] = modOpA[31:0]; //bottom half is the dividend

    mux_2_64 joeseph2132(.out(remainder_quotient_in), .select(|counter), .in0(remainder_quotient_initial), .in1(remainder_quotient_loop));

    single_reg_64 silverback_gorilla(.q(remainder_quotient_out), .d(remainder_quotient_in), .clk(clock), .en(1'b1), .clr(ctrl_DIV)); // takes 1 cycle to set out.
    //reg is on cycle 0 the initial -> out to initial otherwise loop.


    //storing previous MSB in a dff 
    // wire prevMSBout, prevMSBin; //initially 0

    // dffe_ref prevMSB(.q(prevMSBout), .d(prevMSBin), .clk(clock), .en(1'b1), .clr(ctrl_DIV));

    //------------------------------------- cycling ------------------------------


    //take output of rq in register 
    // = remainder_quotient_out


    // --------------- STEP 1 - left shift by 1 --------------------

    wire[63:0] shifted_rq;
    assign shifted_rq = remainder_quotient_out << 1'b1;

    // --------------- STEP 2 - set MSB --------------------

    wire qMSB; //setting MSB bit
    assign qMSB = remainder_quotient_out[63];

    // --------------- STEP 2 - choose divisor --------------------
    // mux to choose whether to +d or -d
    // if msb = 0 then -d
    // if msb = 1 then +d

    wire[31:0] divisor_to_use;

    mux_2 choose_divisor(.out(divisor_to_use), .select(qMSB), .in0(negDivisor), .in1(divisor));

    // -------------------------- STEP 3 - add shifted to chosen divisor --------------------

    //wire[63:0] remainder_quotient_loop;

    adder my_cousin_throckmorton(.out(remainder_quotient_loop[63:32]), .operandA(shifted_rq[63:32]), .operandB(divisor_to_use), .carry_in(1'b0));

    // -------------------------- STEP 4 - assign bottom 32 bits + set last bit --------------------

    assign remainder_quotient_loop[31:1] = shifted_rq[31:1];
    assign remainder_quotient_loop[0] = ~(remainder_quotient_loop[63]);


    // ----------------- FINAL outputs - Quotient ready cycle 33, Remainder cycle 34/35 ------------------------

    wire[63:0] tempFinalOutput, ratatouille; //ratatouille is my output dish. I don't actually like ratatouille much, but I like the movie.

    assign tempFinalOutput = remainder_quotient_in;

    single_reg_64 peregrine_falcon(.q(ratatouille), .d(tempFinalOutput), .clk(clock), .en(counter[5] & ~counter[4] & ~counter[3] & ~counter[2] & ~counter[1] & ~counter[0]), .clr(ctrl_DIV)); //write on clock cycle 33

    // assign data_remainder = ratatouille[63:32];
    
    // if MSB = 1 then add D o/w done
    wire[31:0] wireOne, wireTwo;

    assign wireTwo = ratatouille[63:32];

    adder by_jupiter(.out(wireOne), .operandA(ratatouille[63:32]), .operandB(divisor), .carry_in(1'b0));

    mux_2 choosinator3000(.out(data_remainder), .select(ratatouille[63]), .in0(wireTwo), .in1(wireOne));

    assign data_exception = ~(|modOpB);

    //for final final output need to make sure output is positive or negative. I'm not going to care about remainder for now.

    wire tossIt;

    // assign data_quotient = ratatouille[31:0];

    wire[31:0] negRatatouille;
    adder divider_child_bob3(.out(negRatatouille), .operandA(~(ratatouille[31:0])), .operandB(32'b0), .carry_in(1'b1));

    mux_2 choosinator3001(.out(data_quotient), .select(data_operandA[31] ^ data_operandB[31]), .in0(ratatouille[31:0]), .in1(negRatatouille));

    // T_flip_flop numberOne  (.T((counter[5] & ~counter[4] & ~counter[3] & ~counter[2] & ~counter[1] & counter[0]) | (counter[5] & counter[4] & counter[3] & counter[2] & counter[1] & counter[0])), .clock(clock), .reset(ctrl_DIV), .Q(data_resultRDY), .notQ(tossIt));

endmodule