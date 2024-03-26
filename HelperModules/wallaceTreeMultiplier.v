module wallaceTreeMultiplier(
data_operandA, data_operandB, 
clock, 
data_result, data_exception, data_resultRDY, ctrl_MULT);

input [31:0] data_operandA, data_operandB;
input clock, ctrl_MULT;

output [63:0] data_result;
output data_exception, data_resultRDY;



wire[5:0] count;

counter counter1(.clock(clock), .reset(ctrl_MULT), .count(count));

assign data_resultRDY = (~count[5] & ~count[4] & count[3] & ~count[2] & ~count[1] & ~count[0]);


wire [63:0] data_result;
      
// BASE CASE BASE CASE
wire w_0_0, w_0_1, w_0_2, w_0_3, w_0_4, w_0_5, w_0_6, w_0_7, w_0_8, w_0_9, w_0_10, w_0_11, w_0_12, w_0_13, w_0_14, w_0_15, w_0_16, w_0_17, w_0_18, w_0_19, w_0_20, w_0_21, w_0_22, w_0_23, w_0_24, w_0_25, w_0_26, w_0_27, w_0_28, w_0_29, w_0_30, w_0_31, w_0_32;

assign w_0_0 = data_operandA[0] & data_operandB[0];
assign w_0_1 = data_operandA[0] & data_operandB[1];
assign w_0_2 = data_operandA[0] & data_operandB[2];
assign w_0_3 = data_operandA[0] & data_operandB[3];
assign w_0_4 = data_operandA[0] & data_operandB[4];
assign w_0_5 = data_operandA[0] & data_operandB[5];
assign w_0_6 = data_operandA[0] & data_operandB[6];
assign w_0_7 = data_operandA[0] & data_operandB[7];
assign w_0_8 = data_operandA[0] & data_operandB[8];
assign w_0_9 = data_operandA[0] & data_operandB[9];
assign w_0_10 = data_operandA[0] & data_operandB[10];
assign w_0_11 = data_operandA[0] & data_operandB[11];
assign w_0_12 = data_operandA[0] & data_operandB[12];
assign w_0_13 = data_operandA[0] & data_operandB[13];
assign w_0_14 = data_operandA[0] & data_operandB[14];
assign w_0_15 = data_operandA[0] & data_operandB[15];
assign w_0_16 = data_operandA[0] & data_operandB[16];
assign w_0_17 = data_operandA[0] & data_operandB[17];
assign w_0_18 = data_operandA[0] & data_operandB[18];
assign w_0_19 = data_operandA[0] & data_operandB[19];
assign w_0_20 = data_operandA[0] & data_operandB[20];
assign w_0_21 = data_operandA[0] & data_operandB[21];
assign w_0_22 = data_operandA[0] & data_operandB[22];
assign w_0_23 = data_operandA[0] & data_operandB[23];
assign w_0_24 = data_operandA[0] & data_operandB[24];
assign w_0_25 = data_operandA[0] & data_operandB[25];
assign w_0_26 = data_operandA[0] & data_operandB[26];
assign w_0_27 = data_operandA[0] & data_operandB[27];
assign w_0_28 = data_operandA[0] & data_operandB[28];
assign w_0_29 = data_operandA[0] & data_operandB[29];
assign w_0_30 = data_operandA[0] & data_operandB[30];
assign w_0_31 = !(data_operandA[0] & data_operandB[31]);
assign w_0_32 = 1'b0;


// these are my wires that have the result of each full adder
wire w_1_33, w_1_1, w_1_2, w_1_3, w_1_4, w_1_5, w_1_6, w_1_7, w_1_8, w_1_9, w_1_10, w_1_11, w_1_12, w_1_13, w_1_14, w_1_15, w_1_16, w_1_17, w_1_18, w_1_19, w_1_20, w_1_21, w_1_22, w_1_23, w_1_24, w_1_25, w_1_26, w_1_27, w_1_28, w_1_29, w_1_30, w_1_31, w_1_32;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_1_1, c_1_2, c_1_3, c_1_4, c_1_5, c_1_6, c_1_7, c_1_8, c_1_9, c_1_10, c_1_11, c_1_12, c_1_13, c_1_14, c_1_15, c_1_16, c_1_17, c_1_18, c_1_19, c_1_20, c_1_21, c_1_22, c_1_23, c_1_24, c_1_25, c_1_26, c_1_27, c_1_28, c_1_29, c_1_30, c_1_31, c_1_32;

full_adder add_w_1_1(.S(w_1_1), .Cout(c_1_1),  .A(w_0_1), .B(data_operandA[1] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_1_2(.S(w_1_2), .Cout(c_1_2),  .A(w_0_2), .B(data_operandA[1] & data_operandB[1]), .Cin(c_1_1));
full_adder add_w_1_3(.S(w_1_3), .Cout(c_1_3),  .A(w_0_3), .B(data_operandA[1] & data_operandB[2]), .Cin(c_1_2));
full_adder add_w_1_4(.S(w_1_4), .Cout(c_1_4),  .A(w_0_4), .B(data_operandA[1] & data_operandB[3]), .Cin(c_1_3));
full_adder add_w_1_5(.S(w_1_5), .Cout(c_1_5),  .A(w_0_5), .B(data_operandA[1] & data_operandB[4]), .Cin(c_1_4));
full_adder add_w_1_6(.S(w_1_6), .Cout(c_1_6),  .A(w_0_6), .B(data_operandA[1] & data_operandB[5]), .Cin(c_1_5));
full_adder add_w_1_7(.S(w_1_7), .Cout(c_1_7),  .A(w_0_7), .B(data_operandA[1] & data_operandB[6]), .Cin(c_1_6));
full_adder add_w_1_8(.S(w_1_8), .Cout(c_1_8),  .A(w_0_8), .B(data_operandA[1] & data_operandB[7]), .Cin(c_1_7));
full_adder add_w_1_9(.S(w_1_9), .Cout(c_1_9),  .A(w_0_9), .B(data_operandA[1] & data_operandB[8]), .Cin(c_1_8));
full_adder add_w_1_10(.S(w_1_10), .Cout(c_1_10),  .A(w_0_10), .B(data_operandA[1] & data_operandB[9]), .Cin(c_1_9));
full_adder add_w_1_11(.S(w_1_11), .Cout(c_1_11),  .A(w_0_11), .B(data_operandA[1] & data_operandB[10]), .Cin(c_1_10));
full_adder add_w_1_12(.S(w_1_12), .Cout(c_1_12),  .A(w_0_12), .B(data_operandA[1] & data_operandB[11]), .Cin(c_1_11));
full_adder add_w_1_13(.S(w_1_13), .Cout(c_1_13),  .A(w_0_13), .B(data_operandA[1] & data_operandB[12]), .Cin(c_1_12));
full_adder add_w_1_14(.S(w_1_14), .Cout(c_1_14),  .A(w_0_14), .B(data_operandA[1] & data_operandB[13]), .Cin(c_1_13));
full_adder add_w_1_15(.S(w_1_15), .Cout(c_1_15),  .A(w_0_15), .B(data_operandA[1] & data_operandB[14]), .Cin(c_1_14));
full_adder add_w_1_16(.S(w_1_16), .Cout(c_1_16),  .A(w_0_16), .B(data_operandA[1] & data_operandB[15]), .Cin(c_1_15));
full_adder add_w_1_17(.S(w_1_17), .Cout(c_1_17),  .A(w_0_17), .B(data_operandA[1] & data_operandB[16]), .Cin(c_1_16));
full_adder add_w_1_18(.S(w_1_18), .Cout(c_1_18),  .A(w_0_18), .B(data_operandA[1] & data_operandB[17]), .Cin(c_1_17));
full_adder add_w_1_19(.S(w_1_19), .Cout(c_1_19),  .A(w_0_19), .B(data_operandA[1] & data_operandB[18]), .Cin(c_1_18));
full_adder add_w_1_20(.S(w_1_20), .Cout(c_1_20),  .A(w_0_20), .B(data_operandA[1] & data_operandB[19]), .Cin(c_1_19));
full_adder add_w_1_21(.S(w_1_21), .Cout(c_1_21),  .A(w_0_21), .B(data_operandA[1] & data_operandB[20]), .Cin(c_1_20));
full_adder add_w_1_22(.S(w_1_22), .Cout(c_1_22),  .A(w_0_22), .B(data_operandA[1] & data_operandB[21]), .Cin(c_1_21));
full_adder add_w_1_23(.S(w_1_23), .Cout(c_1_23),  .A(w_0_23), .B(data_operandA[1] & data_operandB[22]), .Cin(c_1_22));
full_adder add_w_1_24(.S(w_1_24), .Cout(c_1_24),  .A(w_0_24), .B(data_operandA[1] & data_operandB[23]), .Cin(c_1_23));
full_adder add_w_1_25(.S(w_1_25), .Cout(c_1_25),  .A(w_0_25), .B(data_operandA[1] & data_operandB[24]), .Cin(c_1_24));
full_adder add_w_1_26(.S(w_1_26), .Cout(c_1_26),  .A(w_0_26), .B(data_operandA[1] & data_operandB[25]), .Cin(c_1_25));
full_adder add_w_1_27(.S(w_1_27), .Cout(c_1_27),  .A(w_0_27), .B(data_operandA[1] & data_operandB[26]), .Cin(c_1_26));
full_adder add_w_1_28(.S(w_1_28), .Cout(c_1_28),  .A(w_0_28), .B(data_operandA[1] & data_operandB[27]), .Cin(c_1_27));
full_adder add_w_1_29(.S(w_1_29), .Cout(c_1_29),  .A(w_0_29), .B(data_operandA[1] & data_operandB[28]), .Cin(c_1_28));
full_adder add_w_1_30(.S(w_1_30), .Cout(c_1_30),  .A(w_0_30), .B(data_operandA[1] & data_operandB[29]), .Cin(c_1_29));
full_adder add_w_1_31(.S(w_1_31), .Cout(c_1_31),  .A(w_0_31), .B(data_operandA[1] & data_operandB[30]), .Cin(c_1_30));
full_adder add_w_1_32(.S(w_1_32), .Cout(w_1_33),  .A(1'b1), .B( !(data_operandA[1] & data_operandB[31])), .Cin(c_1_31));



// these are my wires that have the result of each full adder
wire w_2_34, w_2_2, w_2_3, w_2_4, w_2_5, w_2_6, w_2_7, w_2_8, w_2_9, w_2_10, w_2_11, w_2_12, w_2_13, w_2_14, w_2_15, w_2_16, w_2_17, w_2_18, w_2_19, w_2_20, w_2_21, w_2_22, w_2_23, w_2_24, w_2_25, w_2_26, w_2_27, w_2_28, w_2_29, w_2_30, w_2_31, w_2_32, w_2_33;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_2_2, c_2_3, c_2_4, c_2_5, c_2_6, c_2_7, c_2_8, c_2_9, c_2_10, c_2_11, c_2_12, c_2_13, c_2_14, c_2_15, c_2_16, c_2_17, c_2_18, c_2_19, c_2_20, c_2_21, c_2_22, c_2_23, c_2_24, c_2_25, c_2_26, c_2_27, c_2_28, c_2_29, c_2_30, c_2_31, c_2_32, c_2_33;

full_adder add_w_2_2(.S(w_2_2), .Cout(c_2_2),  .A(w_1_2), .B(data_operandA[2] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_2_3(.S(w_2_3), .Cout(c_2_3),  .A(w_1_3), .B(data_operandA[2] & data_operandB[1]), .Cin(c_2_2));
full_adder add_w_2_4(.S(w_2_4), .Cout(c_2_4),  .A(w_1_4), .B(data_operandA[2] & data_operandB[2]), .Cin(c_2_3));
full_adder add_w_2_5(.S(w_2_5), .Cout(c_2_5),  .A(w_1_5), .B(data_operandA[2] & data_operandB[3]), .Cin(c_2_4));
full_adder add_w_2_6(.S(w_2_6), .Cout(c_2_6),  .A(w_1_6), .B(data_operandA[2] & data_operandB[4]), .Cin(c_2_5));
full_adder add_w_2_7(.S(w_2_7), .Cout(c_2_7),  .A(w_1_7), .B(data_operandA[2] & data_operandB[5]), .Cin(c_2_6));
full_adder add_w_2_8(.S(w_2_8), .Cout(c_2_8),  .A(w_1_8), .B(data_operandA[2] & data_operandB[6]), .Cin(c_2_7));
full_adder add_w_2_9(.S(w_2_9), .Cout(c_2_9),  .A(w_1_9), .B(data_operandA[2] & data_operandB[7]), .Cin(c_2_8));
full_adder add_w_2_10(.S(w_2_10), .Cout(c_2_10),  .A(w_1_10), .B(data_operandA[2] & data_operandB[8]), .Cin(c_2_9));
full_adder add_w_2_11(.S(w_2_11), .Cout(c_2_11),  .A(w_1_11), .B(data_operandA[2] & data_operandB[9]), .Cin(c_2_10));
full_adder add_w_2_12(.S(w_2_12), .Cout(c_2_12),  .A(w_1_12), .B(data_operandA[2] & data_operandB[10]), .Cin(c_2_11));
full_adder add_w_2_13(.S(w_2_13), .Cout(c_2_13),  .A(w_1_13), .B(data_operandA[2] & data_operandB[11]), .Cin(c_2_12));
full_adder add_w_2_14(.S(w_2_14), .Cout(c_2_14),  .A(w_1_14), .B(data_operandA[2] & data_operandB[12]), .Cin(c_2_13));
full_adder add_w_2_15(.S(w_2_15), .Cout(c_2_15),  .A(w_1_15), .B(data_operandA[2] & data_operandB[13]), .Cin(c_2_14));
full_adder add_w_2_16(.S(w_2_16), .Cout(c_2_16),  .A(w_1_16), .B(data_operandA[2] & data_operandB[14]), .Cin(c_2_15));
full_adder add_w_2_17(.S(w_2_17), .Cout(c_2_17),  .A(w_1_17), .B(data_operandA[2] & data_operandB[15]), .Cin(c_2_16));
full_adder add_w_2_18(.S(w_2_18), .Cout(c_2_18),  .A(w_1_18), .B(data_operandA[2] & data_operandB[16]), .Cin(c_2_17));
full_adder add_w_2_19(.S(w_2_19), .Cout(c_2_19),  .A(w_1_19), .B(data_operandA[2] & data_operandB[17]), .Cin(c_2_18));
full_adder add_w_2_20(.S(w_2_20), .Cout(c_2_20),  .A(w_1_20), .B(data_operandA[2] & data_operandB[18]), .Cin(c_2_19));
full_adder add_w_2_21(.S(w_2_21), .Cout(c_2_21),  .A(w_1_21), .B(data_operandA[2] & data_operandB[19]), .Cin(c_2_20));
full_adder add_w_2_22(.S(w_2_22), .Cout(c_2_22),  .A(w_1_22), .B(data_operandA[2] & data_operandB[20]), .Cin(c_2_21));
full_adder add_w_2_23(.S(w_2_23), .Cout(c_2_23),  .A(w_1_23), .B(data_operandA[2] & data_operandB[21]), .Cin(c_2_22));
full_adder add_w_2_24(.S(w_2_24), .Cout(c_2_24),  .A(w_1_24), .B(data_operandA[2] & data_operandB[22]), .Cin(c_2_23));
full_adder add_w_2_25(.S(w_2_25), .Cout(c_2_25),  .A(w_1_25), .B(data_operandA[2] & data_operandB[23]), .Cin(c_2_24));
full_adder add_w_2_26(.S(w_2_26), .Cout(c_2_26),  .A(w_1_26), .B(data_operandA[2] & data_operandB[24]), .Cin(c_2_25));
full_adder add_w_2_27(.S(w_2_27), .Cout(c_2_27),  .A(w_1_27), .B(data_operandA[2] & data_operandB[25]), .Cin(c_2_26));
full_adder add_w_2_28(.S(w_2_28), .Cout(c_2_28),  .A(w_1_28), .B(data_operandA[2] & data_operandB[26]), .Cin(c_2_27));
full_adder add_w_2_29(.S(w_2_29), .Cout(c_2_29),  .A(w_1_29), .B(data_operandA[2] & data_operandB[27]), .Cin(c_2_28));
full_adder add_w_2_30(.S(w_2_30), .Cout(c_2_30),  .A(w_1_30), .B(data_operandA[2] & data_operandB[28]), .Cin(c_2_29));
full_adder add_w_2_31(.S(w_2_31), .Cout(c_2_31),  .A(w_1_31), .B(data_operandA[2] & data_operandB[29]), .Cin(c_2_30));
full_adder add_w_2_32(.S(w_2_32), .Cout(c_2_32),  .A(w_1_32), .B(data_operandA[2] & data_operandB[30]), .Cin(c_2_31));
full_adder add_w_2_33(.S(w_2_33), .Cout(w_2_34),  .A(w_1_33), .B( !(data_operandA[2] & data_operandB[31])), .Cin(c_2_32));



// these are my wires that have the result of each full adder
wire w_3_35, w_3_3, w_3_4, w_3_5, w_3_6, w_3_7, w_3_8, w_3_9, w_3_10, w_3_11, w_3_12, w_3_13, w_3_14, w_3_15, w_3_16, w_3_17, w_3_18, w_3_19, w_3_20, w_3_21, w_3_22, w_3_23, w_3_24, w_3_25, w_3_26, w_3_27, w_3_28, w_3_29, w_3_30, w_3_31, w_3_32, w_3_33, w_3_34;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_3_3, c_3_4, c_3_5, c_3_6, c_3_7, c_3_8, c_3_9, c_3_10, c_3_11, c_3_12, c_3_13, c_3_14, c_3_15, c_3_16, c_3_17, c_3_18, c_3_19, c_3_20, c_3_21, c_3_22, c_3_23, c_3_24, c_3_25, c_3_26, c_3_27, c_3_28, c_3_29, c_3_30, c_3_31, c_3_32, c_3_33, c_3_34;

full_adder add_w_3_3(.S(w_3_3), .Cout(c_3_3),  .A(w_2_3), .B(data_operandA[3] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_3_4(.S(w_3_4), .Cout(c_3_4),  .A(w_2_4), .B(data_operandA[3] & data_operandB[1]), .Cin(c_3_3));
full_adder add_w_3_5(.S(w_3_5), .Cout(c_3_5),  .A(w_2_5), .B(data_operandA[3] & data_operandB[2]), .Cin(c_3_4));
full_adder add_w_3_6(.S(w_3_6), .Cout(c_3_6),  .A(w_2_6), .B(data_operandA[3] & data_operandB[3]), .Cin(c_3_5));
full_adder add_w_3_7(.S(w_3_7), .Cout(c_3_7),  .A(w_2_7), .B(data_operandA[3] & data_operandB[4]), .Cin(c_3_6));
full_adder add_w_3_8(.S(w_3_8), .Cout(c_3_8),  .A(w_2_8), .B(data_operandA[3] & data_operandB[5]), .Cin(c_3_7));
full_adder add_w_3_9(.S(w_3_9), .Cout(c_3_9),  .A(w_2_9), .B(data_operandA[3] & data_operandB[6]), .Cin(c_3_8));
full_adder add_w_3_10(.S(w_3_10), .Cout(c_3_10),  .A(w_2_10), .B(data_operandA[3] & data_operandB[7]), .Cin(c_3_9));
full_adder add_w_3_11(.S(w_3_11), .Cout(c_3_11),  .A(w_2_11), .B(data_operandA[3] & data_operandB[8]), .Cin(c_3_10));
full_adder add_w_3_12(.S(w_3_12), .Cout(c_3_12),  .A(w_2_12), .B(data_operandA[3] & data_operandB[9]), .Cin(c_3_11));
full_adder add_w_3_13(.S(w_3_13), .Cout(c_3_13),  .A(w_2_13), .B(data_operandA[3] & data_operandB[10]), .Cin(c_3_12));
full_adder add_w_3_14(.S(w_3_14), .Cout(c_3_14),  .A(w_2_14), .B(data_operandA[3] & data_operandB[11]), .Cin(c_3_13));
full_adder add_w_3_15(.S(w_3_15), .Cout(c_3_15),  .A(w_2_15), .B(data_operandA[3] & data_operandB[12]), .Cin(c_3_14));
full_adder add_w_3_16(.S(w_3_16), .Cout(c_3_16),  .A(w_2_16), .B(data_operandA[3] & data_operandB[13]), .Cin(c_3_15));
full_adder add_w_3_17(.S(w_3_17), .Cout(c_3_17),  .A(w_2_17), .B(data_operandA[3] & data_operandB[14]), .Cin(c_3_16));
full_adder add_w_3_18(.S(w_3_18), .Cout(c_3_18),  .A(w_2_18), .B(data_operandA[3] & data_operandB[15]), .Cin(c_3_17));
full_adder add_w_3_19(.S(w_3_19), .Cout(c_3_19),  .A(w_2_19), .B(data_operandA[3] & data_operandB[16]), .Cin(c_3_18));
full_adder add_w_3_20(.S(w_3_20), .Cout(c_3_20),  .A(w_2_20), .B(data_operandA[3] & data_operandB[17]), .Cin(c_3_19));
full_adder add_w_3_21(.S(w_3_21), .Cout(c_3_21),  .A(w_2_21), .B(data_operandA[3] & data_operandB[18]), .Cin(c_3_20));
full_adder add_w_3_22(.S(w_3_22), .Cout(c_3_22),  .A(w_2_22), .B(data_operandA[3] & data_operandB[19]), .Cin(c_3_21));
full_adder add_w_3_23(.S(w_3_23), .Cout(c_3_23),  .A(w_2_23), .B(data_operandA[3] & data_operandB[20]), .Cin(c_3_22));
full_adder add_w_3_24(.S(w_3_24), .Cout(c_3_24),  .A(w_2_24), .B(data_operandA[3] & data_operandB[21]), .Cin(c_3_23));
full_adder add_w_3_25(.S(w_3_25), .Cout(c_3_25),  .A(w_2_25), .B(data_operandA[3] & data_operandB[22]), .Cin(c_3_24));
full_adder add_w_3_26(.S(w_3_26), .Cout(c_3_26),  .A(w_2_26), .B(data_operandA[3] & data_operandB[23]), .Cin(c_3_25));
full_adder add_w_3_27(.S(w_3_27), .Cout(c_3_27),  .A(w_2_27), .B(data_operandA[3] & data_operandB[24]), .Cin(c_3_26));
full_adder add_w_3_28(.S(w_3_28), .Cout(c_3_28),  .A(w_2_28), .B(data_operandA[3] & data_operandB[25]), .Cin(c_3_27));
full_adder add_w_3_29(.S(w_3_29), .Cout(c_3_29),  .A(w_2_29), .B(data_operandA[3] & data_operandB[26]), .Cin(c_3_28));
full_adder add_w_3_30(.S(w_3_30), .Cout(c_3_30),  .A(w_2_30), .B(data_operandA[3] & data_operandB[27]), .Cin(c_3_29));
full_adder add_w_3_31(.S(w_3_31), .Cout(c_3_31),  .A(w_2_31), .B(data_operandA[3] & data_operandB[28]), .Cin(c_3_30));
full_adder add_w_3_32(.S(w_3_32), .Cout(c_3_32),  .A(w_2_32), .B(data_operandA[3] & data_operandB[29]), .Cin(c_3_31));
full_adder add_w_3_33(.S(w_3_33), .Cout(c_3_33),  .A(w_2_33), .B(data_operandA[3] & data_operandB[30]), .Cin(c_3_32));
full_adder add_w_3_34(.S(w_3_34), .Cout(w_3_35),  .A(w_2_34), .B( !(data_operandA[3] & data_operandB[31])), .Cin(c_3_33));



// these are my wires that have the result of each full adder
wire w_4_36, w_4_4, w_4_5, w_4_6, w_4_7, w_4_8, w_4_9, w_4_10, w_4_11, w_4_12, w_4_13, w_4_14, w_4_15, w_4_16, w_4_17, w_4_18, w_4_19, w_4_20, w_4_21, w_4_22, w_4_23, w_4_24, w_4_25, w_4_26, w_4_27, w_4_28, w_4_29, w_4_30, w_4_31, w_4_32, w_4_33, w_4_34, w_4_35;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_4_4, c_4_5, c_4_6, c_4_7, c_4_8, c_4_9, c_4_10, c_4_11, c_4_12, c_4_13, c_4_14, c_4_15, c_4_16, c_4_17, c_4_18, c_4_19, c_4_20, c_4_21, c_4_22, c_4_23, c_4_24, c_4_25, c_4_26, c_4_27, c_4_28, c_4_29, c_4_30, c_4_31, c_4_32, c_4_33, c_4_34, c_4_35;

full_adder add_w_4_4(.S(w_4_4), .Cout(c_4_4),  .A(w_3_4), .B(data_operandA[4] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_4_5(.S(w_4_5), .Cout(c_4_5),  .A(w_3_5), .B(data_operandA[4] & data_operandB[1]), .Cin(c_4_4));
full_adder add_w_4_6(.S(w_4_6), .Cout(c_4_6),  .A(w_3_6), .B(data_operandA[4] & data_operandB[2]), .Cin(c_4_5));
full_adder add_w_4_7(.S(w_4_7), .Cout(c_4_7),  .A(w_3_7), .B(data_operandA[4] & data_operandB[3]), .Cin(c_4_6));
full_adder add_w_4_8(.S(w_4_8), .Cout(c_4_8),  .A(w_3_8), .B(data_operandA[4] & data_operandB[4]), .Cin(c_4_7));
full_adder add_w_4_9(.S(w_4_9), .Cout(c_4_9),  .A(w_3_9), .B(data_operandA[4] & data_operandB[5]), .Cin(c_4_8));
full_adder add_w_4_10(.S(w_4_10), .Cout(c_4_10),  .A(w_3_10), .B(data_operandA[4] & data_operandB[6]), .Cin(c_4_9));
full_adder add_w_4_11(.S(w_4_11), .Cout(c_4_11),  .A(w_3_11), .B(data_operandA[4] & data_operandB[7]), .Cin(c_4_10));
full_adder add_w_4_12(.S(w_4_12), .Cout(c_4_12),  .A(w_3_12), .B(data_operandA[4] & data_operandB[8]), .Cin(c_4_11));
full_adder add_w_4_13(.S(w_4_13), .Cout(c_4_13),  .A(w_3_13), .B(data_operandA[4] & data_operandB[9]), .Cin(c_4_12));
full_adder add_w_4_14(.S(w_4_14), .Cout(c_4_14),  .A(w_3_14), .B(data_operandA[4] & data_operandB[10]), .Cin(c_4_13));
full_adder add_w_4_15(.S(w_4_15), .Cout(c_4_15),  .A(w_3_15), .B(data_operandA[4] & data_operandB[11]), .Cin(c_4_14));
full_adder add_w_4_16(.S(w_4_16), .Cout(c_4_16),  .A(w_3_16), .B(data_operandA[4] & data_operandB[12]), .Cin(c_4_15));
full_adder add_w_4_17(.S(w_4_17), .Cout(c_4_17),  .A(w_3_17), .B(data_operandA[4] & data_operandB[13]), .Cin(c_4_16));
full_adder add_w_4_18(.S(w_4_18), .Cout(c_4_18),  .A(w_3_18), .B(data_operandA[4] & data_operandB[14]), .Cin(c_4_17));
full_adder add_w_4_19(.S(w_4_19), .Cout(c_4_19),  .A(w_3_19), .B(data_operandA[4] & data_operandB[15]), .Cin(c_4_18));
full_adder add_w_4_20(.S(w_4_20), .Cout(c_4_20),  .A(w_3_20), .B(data_operandA[4] & data_operandB[16]), .Cin(c_4_19));
full_adder add_w_4_21(.S(w_4_21), .Cout(c_4_21),  .A(w_3_21), .B(data_operandA[4] & data_operandB[17]), .Cin(c_4_20));
full_adder add_w_4_22(.S(w_4_22), .Cout(c_4_22),  .A(w_3_22), .B(data_operandA[4] & data_operandB[18]), .Cin(c_4_21));
full_adder add_w_4_23(.S(w_4_23), .Cout(c_4_23),  .A(w_3_23), .B(data_operandA[4] & data_operandB[19]), .Cin(c_4_22));
full_adder add_w_4_24(.S(w_4_24), .Cout(c_4_24),  .A(w_3_24), .B(data_operandA[4] & data_operandB[20]), .Cin(c_4_23));
full_adder add_w_4_25(.S(w_4_25), .Cout(c_4_25),  .A(w_3_25), .B(data_operandA[4] & data_operandB[21]), .Cin(c_4_24));
full_adder add_w_4_26(.S(w_4_26), .Cout(c_4_26),  .A(w_3_26), .B(data_operandA[4] & data_operandB[22]), .Cin(c_4_25));
full_adder add_w_4_27(.S(w_4_27), .Cout(c_4_27),  .A(w_3_27), .B(data_operandA[4] & data_operandB[23]), .Cin(c_4_26));
full_adder add_w_4_28(.S(w_4_28), .Cout(c_4_28),  .A(w_3_28), .B(data_operandA[4] & data_operandB[24]), .Cin(c_4_27));
full_adder add_w_4_29(.S(w_4_29), .Cout(c_4_29),  .A(w_3_29), .B(data_operandA[4] & data_operandB[25]), .Cin(c_4_28));
full_adder add_w_4_30(.S(w_4_30), .Cout(c_4_30),  .A(w_3_30), .B(data_operandA[4] & data_operandB[26]), .Cin(c_4_29));
full_adder add_w_4_31(.S(w_4_31), .Cout(c_4_31),  .A(w_3_31), .B(data_operandA[4] & data_operandB[27]), .Cin(c_4_30));
full_adder add_w_4_32(.S(w_4_32), .Cout(c_4_32),  .A(w_3_32), .B(data_operandA[4] & data_operandB[28]), .Cin(c_4_31));
full_adder add_w_4_33(.S(w_4_33), .Cout(c_4_33),  .A(w_3_33), .B(data_operandA[4] & data_operandB[29]), .Cin(c_4_32));
full_adder add_w_4_34(.S(w_4_34), .Cout(c_4_34),  .A(w_3_34), .B(data_operandA[4] & data_operandB[30]), .Cin(c_4_33));
full_adder add_w_4_35(.S(w_4_35), .Cout(w_4_36),  .A(w_3_35), .B( !(data_operandA[4] & data_operandB[31])), .Cin(c_4_34));



// these are my wires that have the result of each full adder
wire w_5_37, w_5_5, w_5_6, w_5_7, w_5_8, w_5_9, w_5_10, w_5_11, w_5_12, w_5_13, w_5_14, w_5_15, w_5_16, w_5_17, w_5_18, w_5_19, w_5_20, w_5_21, w_5_22, w_5_23, w_5_24, w_5_25, w_5_26, w_5_27, w_5_28, w_5_29, w_5_30, w_5_31, w_5_32, w_5_33, w_5_34, w_5_35, w_5_36;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_5_5, c_5_6, c_5_7, c_5_8, c_5_9, c_5_10, c_5_11, c_5_12, c_5_13, c_5_14, c_5_15, c_5_16, c_5_17, c_5_18, c_5_19, c_5_20, c_5_21, c_5_22, c_5_23, c_5_24, c_5_25, c_5_26, c_5_27, c_5_28, c_5_29, c_5_30, c_5_31, c_5_32, c_5_33, c_5_34, c_5_35, c_5_36;

full_adder add_w_5_5(.S(w_5_5), .Cout(c_5_5),  .A(w_4_5), .B(data_operandA[5] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_5_6(.S(w_5_6), .Cout(c_5_6),  .A(w_4_6), .B(data_operandA[5] & data_operandB[1]), .Cin(c_5_5));
full_adder add_w_5_7(.S(w_5_7), .Cout(c_5_7),  .A(w_4_7), .B(data_operandA[5] & data_operandB[2]), .Cin(c_5_6));
full_adder add_w_5_8(.S(w_5_8), .Cout(c_5_8),  .A(w_4_8), .B(data_operandA[5] & data_operandB[3]), .Cin(c_5_7));
full_adder add_w_5_9(.S(w_5_9), .Cout(c_5_9),  .A(w_4_9), .B(data_operandA[5] & data_operandB[4]), .Cin(c_5_8));
full_adder add_w_5_10(.S(w_5_10), .Cout(c_5_10),  .A(w_4_10), .B(data_operandA[5] & data_operandB[5]), .Cin(c_5_9));
full_adder add_w_5_11(.S(w_5_11), .Cout(c_5_11),  .A(w_4_11), .B(data_operandA[5] & data_operandB[6]), .Cin(c_5_10));
full_adder add_w_5_12(.S(w_5_12), .Cout(c_5_12),  .A(w_4_12), .B(data_operandA[5] & data_operandB[7]), .Cin(c_5_11));
full_adder add_w_5_13(.S(w_5_13), .Cout(c_5_13),  .A(w_4_13), .B(data_operandA[5] & data_operandB[8]), .Cin(c_5_12));
full_adder add_w_5_14(.S(w_5_14), .Cout(c_5_14),  .A(w_4_14), .B(data_operandA[5] & data_operandB[9]), .Cin(c_5_13));
full_adder add_w_5_15(.S(w_5_15), .Cout(c_5_15),  .A(w_4_15), .B(data_operandA[5] & data_operandB[10]), .Cin(c_5_14));
full_adder add_w_5_16(.S(w_5_16), .Cout(c_5_16),  .A(w_4_16), .B(data_operandA[5] & data_operandB[11]), .Cin(c_5_15));
full_adder add_w_5_17(.S(w_5_17), .Cout(c_5_17),  .A(w_4_17), .B(data_operandA[5] & data_operandB[12]), .Cin(c_5_16));
full_adder add_w_5_18(.S(w_5_18), .Cout(c_5_18),  .A(w_4_18), .B(data_operandA[5] & data_operandB[13]), .Cin(c_5_17));
full_adder add_w_5_19(.S(w_5_19), .Cout(c_5_19),  .A(w_4_19), .B(data_operandA[5] & data_operandB[14]), .Cin(c_5_18));
full_adder add_w_5_20(.S(w_5_20), .Cout(c_5_20),  .A(w_4_20), .B(data_operandA[5] & data_operandB[15]), .Cin(c_5_19));
full_adder add_w_5_21(.S(w_5_21), .Cout(c_5_21),  .A(w_4_21), .B(data_operandA[5] & data_operandB[16]), .Cin(c_5_20));
full_adder add_w_5_22(.S(w_5_22), .Cout(c_5_22),  .A(w_4_22), .B(data_operandA[5] & data_operandB[17]), .Cin(c_5_21));
full_adder add_w_5_23(.S(w_5_23), .Cout(c_5_23),  .A(w_4_23), .B(data_operandA[5] & data_operandB[18]), .Cin(c_5_22));
full_adder add_w_5_24(.S(w_5_24), .Cout(c_5_24),  .A(w_4_24), .B(data_operandA[5] & data_operandB[19]), .Cin(c_5_23));
full_adder add_w_5_25(.S(w_5_25), .Cout(c_5_25),  .A(w_4_25), .B(data_operandA[5] & data_operandB[20]), .Cin(c_5_24));
full_adder add_w_5_26(.S(w_5_26), .Cout(c_5_26),  .A(w_4_26), .B(data_operandA[5] & data_operandB[21]), .Cin(c_5_25));
full_adder add_w_5_27(.S(w_5_27), .Cout(c_5_27),  .A(w_4_27), .B(data_operandA[5] & data_operandB[22]), .Cin(c_5_26));
full_adder add_w_5_28(.S(w_5_28), .Cout(c_5_28),  .A(w_4_28), .B(data_operandA[5] & data_operandB[23]), .Cin(c_5_27));
full_adder add_w_5_29(.S(w_5_29), .Cout(c_5_29),  .A(w_4_29), .B(data_operandA[5] & data_operandB[24]), .Cin(c_5_28));
full_adder add_w_5_30(.S(w_5_30), .Cout(c_5_30),  .A(w_4_30), .B(data_operandA[5] & data_operandB[25]), .Cin(c_5_29));
full_adder add_w_5_31(.S(w_5_31), .Cout(c_5_31),  .A(w_4_31), .B(data_operandA[5] & data_operandB[26]), .Cin(c_5_30));
full_adder add_w_5_32(.S(w_5_32), .Cout(c_5_32),  .A(w_4_32), .B(data_operandA[5] & data_operandB[27]), .Cin(c_5_31));
full_adder add_w_5_33(.S(w_5_33), .Cout(c_5_33),  .A(w_4_33), .B(data_operandA[5] & data_operandB[28]), .Cin(c_5_32));
full_adder add_w_5_34(.S(w_5_34), .Cout(c_5_34),  .A(w_4_34), .B(data_operandA[5] & data_operandB[29]), .Cin(c_5_33));
full_adder add_w_5_35(.S(w_5_35), .Cout(c_5_35),  .A(w_4_35), .B(data_operandA[5] & data_operandB[30]), .Cin(c_5_34));
full_adder add_w_5_36(.S(w_5_36), .Cout(w_5_37),  .A(w_4_36), .B( !(data_operandA[5] & data_operandB[31])), .Cin(c_5_35));



// these are my wires that have the result of each full adder
wire w_6_38, w_6_6, w_6_7, w_6_8, w_6_9, w_6_10, w_6_11, w_6_12, w_6_13, w_6_14, w_6_15, w_6_16, w_6_17, w_6_18, w_6_19, w_6_20, w_6_21, w_6_22, w_6_23, w_6_24, w_6_25, w_6_26, w_6_27, w_6_28, w_6_29, w_6_30, w_6_31, w_6_32, w_6_33, w_6_34, w_6_35, w_6_36, w_6_37;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_6_6, c_6_7, c_6_8, c_6_9, c_6_10, c_6_11, c_6_12, c_6_13, c_6_14, c_6_15, c_6_16, c_6_17, c_6_18, c_6_19, c_6_20, c_6_21, c_6_22, c_6_23, c_6_24, c_6_25, c_6_26, c_6_27, c_6_28, c_6_29, c_6_30, c_6_31, c_6_32, c_6_33, c_6_34, c_6_35, c_6_36, c_6_37;

full_adder add_w_6_6(.S(w_6_6), .Cout(c_6_6),  .A(w_5_6), .B(data_operandA[6] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_6_7(.S(w_6_7), .Cout(c_6_7),  .A(w_5_7), .B(data_operandA[6] & data_operandB[1]), .Cin(c_6_6));
full_adder add_w_6_8(.S(w_6_8), .Cout(c_6_8),  .A(w_5_8), .B(data_operandA[6] & data_operandB[2]), .Cin(c_6_7));
full_adder add_w_6_9(.S(w_6_9), .Cout(c_6_9),  .A(w_5_9), .B(data_operandA[6] & data_operandB[3]), .Cin(c_6_8));
full_adder add_w_6_10(.S(w_6_10), .Cout(c_6_10),  .A(w_5_10), .B(data_operandA[6] & data_operandB[4]), .Cin(c_6_9));
full_adder add_w_6_11(.S(w_6_11), .Cout(c_6_11),  .A(w_5_11), .B(data_operandA[6] & data_operandB[5]), .Cin(c_6_10));
full_adder add_w_6_12(.S(w_6_12), .Cout(c_6_12),  .A(w_5_12), .B(data_operandA[6] & data_operandB[6]), .Cin(c_6_11));
full_adder add_w_6_13(.S(w_6_13), .Cout(c_6_13),  .A(w_5_13), .B(data_operandA[6] & data_operandB[7]), .Cin(c_6_12));
full_adder add_w_6_14(.S(w_6_14), .Cout(c_6_14),  .A(w_5_14), .B(data_operandA[6] & data_operandB[8]), .Cin(c_6_13));
full_adder add_w_6_15(.S(w_6_15), .Cout(c_6_15),  .A(w_5_15), .B(data_operandA[6] & data_operandB[9]), .Cin(c_6_14));
full_adder add_w_6_16(.S(w_6_16), .Cout(c_6_16),  .A(w_5_16), .B(data_operandA[6] & data_operandB[10]), .Cin(c_6_15));
full_adder add_w_6_17(.S(w_6_17), .Cout(c_6_17),  .A(w_5_17), .B(data_operandA[6] & data_operandB[11]), .Cin(c_6_16));
full_adder add_w_6_18(.S(w_6_18), .Cout(c_6_18),  .A(w_5_18), .B(data_operandA[6] & data_operandB[12]), .Cin(c_6_17));
full_adder add_w_6_19(.S(w_6_19), .Cout(c_6_19),  .A(w_5_19), .B(data_operandA[6] & data_operandB[13]), .Cin(c_6_18));
full_adder add_w_6_20(.S(w_6_20), .Cout(c_6_20),  .A(w_5_20), .B(data_operandA[6] & data_operandB[14]), .Cin(c_6_19));
full_adder add_w_6_21(.S(w_6_21), .Cout(c_6_21),  .A(w_5_21), .B(data_operandA[6] & data_operandB[15]), .Cin(c_6_20));
full_adder add_w_6_22(.S(w_6_22), .Cout(c_6_22),  .A(w_5_22), .B(data_operandA[6] & data_operandB[16]), .Cin(c_6_21));
full_adder add_w_6_23(.S(w_6_23), .Cout(c_6_23),  .A(w_5_23), .B(data_operandA[6] & data_operandB[17]), .Cin(c_6_22));
full_adder add_w_6_24(.S(w_6_24), .Cout(c_6_24),  .A(w_5_24), .B(data_operandA[6] & data_operandB[18]), .Cin(c_6_23));
full_adder add_w_6_25(.S(w_6_25), .Cout(c_6_25),  .A(w_5_25), .B(data_operandA[6] & data_operandB[19]), .Cin(c_6_24));
full_adder add_w_6_26(.S(w_6_26), .Cout(c_6_26),  .A(w_5_26), .B(data_operandA[6] & data_operandB[20]), .Cin(c_6_25));
full_adder add_w_6_27(.S(w_6_27), .Cout(c_6_27),  .A(w_5_27), .B(data_operandA[6] & data_operandB[21]), .Cin(c_6_26));
full_adder add_w_6_28(.S(w_6_28), .Cout(c_6_28),  .A(w_5_28), .B(data_operandA[6] & data_operandB[22]), .Cin(c_6_27));
full_adder add_w_6_29(.S(w_6_29), .Cout(c_6_29),  .A(w_5_29), .B(data_operandA[6] & data_operandB[23]), .Cin(c_6_28));
full_adder add_w_6_30(.S(w_6_30), .Cout(c_6_30),  .A(w_5_30), .B(data_operandA[6] & data_operandB[24]), .Cin(c_6_29));
full_adder add_w_6_31(.S(w_6_31), .Cout(c_6_31),  .A(w_5_31), .B(data_operandA[6] & data_operandB[25]), .Cin(c_6_30));
full_adder add_w_6_32(.S(w_6_32), .Cout(c_6_32),  .A(w_5_32), .B(data_operandA[6] & data_operandB[26]), .Cin(c_6_31));
full_adder add_w_6_33(.S(w_6_33), .Cout(c_6_33),  .A(w_5_33), .B(data_operandA[6] & data_operandB[27]), .Cin(c_6_32));
full_adder add_w_6_34(.S(w_6_34), .Cout(c_6_34),  .A(w_5_34), .B(data_operandA[6] & data_operandB[28]), .Cin(c_6_33));
full_adder add_w_6_35(.S(w_6_35), .Cout(c_6_35),  .A(w_5_35), .B(data_operandA[6] & data_operandB[29]), .Cin(c_6_34));
full_adder add_w_6_36(.S(w_6_36), .Cout(c_6_36),  .A(w_5_36), .B(data_operandA[6] & data_operandB[30]), .Cin(c_6_35));
full_adder add_w_6_37(.S(w_6_37), .Cout(w_6_38),  .A(w_5_37), .B( !(data_operandA[6] & data_operandB[31])), .Cin(c_6_36));



// these are my wires that have the result of each full adder
wire w_7_39, w_7_7, w_7_8, w_7_9, w_7_10, w_7_11, w_7_12, w_7_13, w_7_14, w_7_15, w_7_16, w_7_17, w_7_18, w_7_19, w_7_20, w_7_21, w_7_22, w_7_23, w_7_24, w_7_25, w_7_26, w_7_27, w_7_28, w_7_29, w_7_30, w_7_31, w_7_32, w_7_33, w_7_34, w_7_35, w_7_36, w_7_37, w_7_38;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_7_7, c_7_8, c_7_9, c_7_10, c_7_11, c_7_12, c_7_13, c_7_14, c_7_15, c_7_16, c_7_17, c_7_18, c_7_19, c_7_20, c_7_21, c_7_22, c_7_23, c_7_24, c_7_25, c_7_26, c_7_27, c_7_28, c_7_29, c_7_30, c_7_31, c_7_32, c_7_33, c_7_34, c_7_35, c_7_36, c_7_37, c_7_38;

full_adder add_w_7_7(.S(w_7_7), .Cout(c_7_7),  .A(w_6_7), .B(data_operandA[7] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_7_8(.S(w_7_8), .Cout(c_7_8),  .A(w_6_8), .B(data_operandA[7] & data_operandB[1]), .Cin(c_7_7));
full_adder add_w_7_9(.S(w_7_9), .Cout(c_7_9),  .A(w_6_9), .B(data_operandA[7] & data_operandB[2]), .Cin(c_7_8));
full_adder add_w_7_10(.S(w_7_10), .Cout(c_7_10),  .A(w_6_10), .B(data_operandA[7] & data_operandB[3]), .Cin(c_7_9));
full_adder add_w_7_11(.S(w_7_11), .Cout(c_7_11),  .A(w_6_11), .B(data_operandA[7] & data_operandB[4]), .Cin(c_7_10));
full_adder add_w_7_12(.S(w_7_12), .Cout(c_7_12),  .A(w_6_12), .B(data_operandA[7] & data_operandB[5]), .Cin(c_7_11));
full_adder add_w_7_13(.S(w_7_13), .Cout(c_7_13),  .A(w_6_13), .B(data_operandA[7] & data_operandB[6]), .Cin(c_7_12));
full_adder add_w_7_14(.S(w_7_14), .Cout(c_7_14),  .A(w_6_14), .B(data_operandA[7] & data_operandB[7]), .Cin(c_7_13));
full_adder add_w_7_15(.S(w_7_15), .Cout(c_7_15),  .A(w_6_15), .B(data_operandA[7] & data_operandB[8]), .Cin(c_7_14));
full_adder add_w_7_16(.S(w_7_16), .Cout(c_7_16),  .A(w_6_16), .B(data_operandA[7] & data_operandB[9]), .Cin(c_7_15));
full_adder add_w_7_17(.S(w_7_17), .Cout(c_7_17),  .A(w_6_17), .B(data_operandA[7] & data_operandB[10]), .Cin(c_7_16));
full_adder add_w_7_18(.S(w_7_18), .Cout(c_7_18),  .A(w_6_18), .B(data_operandA[7] & data_operandB[11]), .Cin(c_7_17));
full_adder add_w_7_19(.S(w_7_19), .Cout(c_7_19),  .A(w_6_19), .B(data_operandA[7] & data_operandB[12]), .Cin(c_7_18));
full_adder add_w_7_20(.S(w_7_20), .Cout(c_7_20),  .A(w_6_20), .B(data_operandA[7] & data_operandB[13]), .Cin(c_7_19));
full_adder add_w_7_21(.S(w_7_21), .Cout(c_7_21),  .A(w_6_21), .B(data_operandA[7] & data_operandB[14]), .Cin(c_7_20));
full_adder add_w_7_22(.S(w_7_22), .Cout(c_7_22),  .A(w_6_22), .B(data_operandA[7] & data_operandB[15]), .Cin(c_7_21));
full_adder add_w_7_23(.S(w_7_23), .Cout(c_7_23),  .A(w_6_23), .B(data_operandA[7] & data_operandB[16]), .Cin(c_7_22));
full_adder add_w_7_24(.S(w_7_24), .Cout(c_7_24),  .A(w_6_24), .B(data_operandA[7] & data_operandB[17]), .Cin(c_7_23));
full_adder add_w_7_25(.S(w_7_25), .Cout(c_7_25),  .A(w_6_25), .B(data_operandA[7] & data_operandB[18]), .Cin(c_7_24));
full_adder add_w_7_26(.S(w_7_26), .Cout(c_7_26),  .A(w_6_26), .B(data_operandA[7] & data_operandB[19]), .Cin(c_7_25));
full_adder add_w_7_27(.S(w_7_27), .Cout(c_7_27),  .A(w_6_27), .B(data_operandA[7] & data_operandB[20]), .Cin(c_7_26));
full_adder add_w_7_28(.S(w_7_28), .Cout(c_7_28),  .A(w_6_28), .B(data_operandA[7] & data_operandB[21]), .Cin(c_7_27));
full_adder add_w_7_29(.S(w_7_29), .Cout(c_7_29),  .A(w_6_29), .B(data_operandA[7] & data_operandB[22]), .Cin(c_7_28));
full_adder add_w_7_30(.S(w_7_30), .Cout(c_7_30),  .A(w_6_30), .B(data_operandA[7] & data_operandB[23]), .Cin(c_7_29));
full_adder add_w_7_31(.S(w_7_31), .Cout(c_7_31),  .A(w_6_31), .B(data_operandA[7] & data_operandB[24]), .Cin(c_7_30));
full_adder add_w_7_32(.S(w_7_32), .Cout(c_7_32),  .A(w_6_32), .B(data_operandA[7] & data_operandB[25]), .Cin(c_7_31));
full_adder add_w_7_33(.S(w_7_33), .Cout(c_7_33),  .A(w_6_33), .B(data_operandA[7] & data_operandB[26]), .Cin(c_7_32));
full_adder add_w_7_34(.S(w_7_34), .Cout(c_7_34),  .A(w_6_34), .B(data_operandA[7] & data_operandB[27]), .Cin(c_7_33));
full_adder add_w_7_35(.S(w_7_35), .Cout(c_7_35),  .A(w_6_35), .B(data_operandA[7] & data_operandB[28]), .Cin(c_7_34));
full_adder add_w_7_36(.S(w_7_36), .Cout(c_7_36),  .A(w_6_36), .B(data_operandA[7] & data_operandB[29]), .Cin(c_7_35));
full_adder add_w_7_37(.S(w_7_37), .Cout(c_7_37),  .A(w_6_37), .B(data_operandA[7] & data_operandB[30]), .Cin(c_7_36));
full_adder add_w_7_38(.S(w_7_38), .Cout(w_7_39),  .A(w_6_38), .B( !(data_operandA[7] & data_operandB[31])), .Cin(c_7_37));



// these are my wires that have the result of each full adder
wire w_8_40, w_8_8, w_8_9, w_8_10, w_8_11, w_8_12, w_8_13, w_8_14, w_8_15, w_8_16, w_8_17, w_8_18, w_8_19, w_8_20, w_8_21, w_8_22, w_8_23, w_8_24, w_8_25, w_8_26, w_8_27, w_8_28, w_8_29, w_8_30, w_8_31, w_8_32, w_8_33, w_8_34, w_8_35, w_8_36, w_8_37, w_8_38, w_8_39;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_8_8, c_8_9, c_8_10, c_8_11, c_8_12, c_8_13, c_8_14, c_8_15, c_8_16, c_8_17, c_8_18, c_8_19, c_8_20, c_8_21, c_8_22, c_8_23, c_8_24, c_8_25, c_8_26, c_8_27, c_8_28, c_8_29, c_8_30, c_8_31, c_8_32, c_8_33, c_8_34, c_8_35, c_8_36, c_8_37, c_8_38, c_8_39;

full_adder add_w_8_8(.S(w_8_8), .Cout(c_8_8),  .A(w_7_8), .B(data_operandA[8] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_8_9(.S(w_8_9), .Cout(c_8_9),  .A(w_7_9), .B(data_operandA[8] & data_operandB[1]), .Cin(c_8_8));
full_adder add_w_8_10(.S(w_8_10), .Cout(c_8_10),  .A(w_7_10), .B(data_operandA[8] & data_operandB[2]), .Cin(c_8_9));
full_adder add_w_8_11(.S(w_8_11), .Cout(c_8_11),  .A(w_7_11), .B(data_operandA[8] & data_operandB[3]), .Cin(c_8_10));
full_adder add_w_8_12(.S(w_8_12), .Cout(c_8_12),  .A(w_7_12), .B(data_operandA[8] & data_operandB[4]), .Cin(c_8_11));
full_adder add_w_8_13(.S(w_8_13), .Cout(c_8_13),  .A(w_7_13), .B(data_operandA[8] & data_operandB[5]), .Cin(c_8_12));
full_adder add_w_8_14(.S(w_8_14), .Cout(c_8_14),  .A(w_7_14), .B(data_operandA[8] & data_operandB[6]), .Cin(c_8_13));
full_adder add_w_8_15(.S(w_8_15), .Cout(c_8_15),  .A(w_7_15), .B(data_operandA[8] & data_operandB[7]), .Cin(c_8_14));
full_adder add_w_8_16(.S(w_8_16), .Cout(c_8_16),  .A(w_7_16), .B(data_operandA[8] & data_operandB[8]), .Cin(c_8_15));
full_adder add_w_8_17(.S(w_8_17), .Cout(c_8_17),  .A(w_7_17), .B(data_operandA[8] & data_operandB[9]), .Cin(c_8_16));
full_adder add_w_8_18(.S(w_8_18), .Cout(c_8_18),  .A(w_7_18), .B(data_operandA[8] & data_operandB[10]), .Cin(c_8_17));
full_adder add_w_8_19(.S(w_8_19), .Cout(c_8_19),  .A(w_7_19), .B(data_operandA[8] & data_operandB[11]), .Cin(c_8_18));
full_adder add_w_8_20(.S(w_8_20), .Cout(c_8_20),  .A(w_7_20), .B(data_operandA[8] & data_operandB[12]), .Cin(c_8_19));
full_adder add_w_8_21(.S(w_8_21), .Cout(c_8_21),  .A(w_7_21), .B(data_operandA[8] & data_operandB[13]), .Cin(c_8_20));
full_adder add_w_8_22(.S(w_8_22), .Cout(c_8_22),  .A(w_7_22), .B(data_operandA[8] & data_operandB[14]), .Cin(c_8_21));
full_adder add_w_8_23(.S(w_8_23), .Cout(c_8_23),  .A(w_7_23), .B(data_operandA[8] & data_operandB[15]), .Cin(c_8_22));
full_adder add_w_8_24(.S(w_8_24), .Cout(c_8_24),  .A(w_7_24), .B(data_operandA[8] & data_operandB[16]), .Cin(c_8_23));
full_adder add_w_8_25(.S(w_8_25), .Cout(c_8_25),  .A(w_7_25), .B(data_operandA[8] & data_operandB[17]), .Cin(c_8_24));
full_adder add_w_8_26(.S(w_8_26), .Cout(c_8_26),  .A(w_7_26), .B(data_operandA[8] & data_operandB[18]), .Cin(c_8_25));
full_adder add_w_8_27(.S(w_8_27), .Cout(c_8_27),  .A(w_7_27), .B(data_operandA[8] & data_operandB[19]), .Cin(c_8_26));
full_adder add_w_8_28(.S(w_8_28), .Cout(c_8_28),  .A(w_7_28), .B(data_operandA[8] & data_operandB[20]), .Cin(c_8_27));
full_adder add_w_8_29(.S(w_8_29), .Cout(c_8_29),  .A(w_7_29), .B(data_operandA[8] & data_operandB[21]), .Cin(c_8_28));
full_adder add_w_8_30(.S(w_8_30), .Cout(c_8_30),  .A(w_7_30), .B(data_operandA[8] & data_operandB[22]), .Cin(c_8_29));
full_adder add_w_8_31(.S(w_8_31), .Cout(c_8_31),  .A(w_7_31), .B(data_operandA[8] & data_operandB[23]), .Cin(c_8_30));
full_adder add_w_8_32(.S(w_8_32), .Cout(c_8_32),  .A(w_7_32), .B(data_operandA[8] & data_operandB[24]), .Cin(c_8_31));
full_adder add_w_8_33(.S(w_8_33), .Cout(c_8_33),  .A(w_7_33), .B(data_operandA[8] & data_operandB[25]), .Cin(c_8_32));
full_adder add_w_8_34(.S(w_8_34), .Cout(c_8_34),  .A(w_7_34), .B(data_operandA[8] & data_operandB[26]), .Cin(c_8_33));
full_adder add_w_8_35(.S(w_8_35), .Cout(c_8_35),  .A(w_7_35), .B(data_operandA[8] & data_operandB[27]), .Cin(c_8_34));
full_adder add_w_8_36(.S(w_8_36), .Cout(c_8_36),  .A(w_7_36), .B(data_operandA[8] & data_operandB[28]), .Cin(c_8_35));
full_adder add_w_8_37(.S(w_8_37), .Cout(c_8_37),  .A(w_7_37), .B(data_operandA[8] & data_operandB[29]), .Cin(c_8_36));
full_adder add_w_8_38(.S(w_8_38), .Cout(c_8_38),  .A(w_7_38), .B(data_operandA[8] & data_operandB[30]), .Cin(c_8_37));
full_adder add_w_8_39(.S(w_8_39), .Cout(w_8_40),  .A(w_7_39), .B( !(data_operandA[8] & data_operandB[31])), .Cin(c_8_38));



// these are my wires that have the result of each full adder
wire w_9_41, w_9_9, w_9_10, w_9_11, w_9_12, w_9_13, w_9_14, w_9_15, w_9_16, w_9_17, w_9_18, w_9_19, w_9_20, w_9_21, w_9_22, w_9_23, w_9_24, w_9_25, w_9_26, w_9_27, w_9_28, w_9_29, w_9_30, w_9_31, w_9_32, w_9_33, w_9_34, w_9_35, w_9_36, w_9_37, w_9_38, w_9_39, w_9_40;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_9_9, c_9_10, c_9_11, c_9_12, c_9_13, c_9_14, c_9_15, c_9_16, c_9_17, c_9_18, c_9_19, c_9_20, c_9_21, c_9_22, c_9_23, c_9_24, c_9_25, c_9_26, c_9_27, c_9_28, c_9_29, c_9_30, c_9_31, c_9_32, c_9_33, c_9_34, c_9_35, c_9_36, c_9_37, c_9_38, c_9_39, c_9_40;

full_adder add_w_9_9(.S(w_9_9), .Cout(c_9_9),  .A(w_8_9), .B(data_operandA[9] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_9_10(.S(w_9_10), .Cout(c_9_10),  .A(w_8_10), .B(data_operandA[9] & data_operandB[1]), .Cin(c_9_9));
full_adder add_w_9_11(.S(w_9_11), .Cout(c_9_11),  .A(w_8_11), .B(data_operandA[9] & data_operandB[2]), .Cin(c_9_10));
full_adder add_w_9_12(.S(w_9_12), .Cout(c_9_12),  .A(w_8_12), .B(data_operandA[9] & data_operandB[3]), .Cin(c_9_11));
full_adder add_w_9_13(.S(w_9_13), .Cout(c_9_13),  .A(w_8_13), .B(data_operandA[9] & data_operandB[4]), .Cin(c_9_12));
full_adder add_w_9_14(.S(w_9_14), .Cout(c_9_14),  .A(w_8_14), .B(data_operandA[9] & data_operandB[5]), .Cin(c_9_13));
full_adder add_w_9_15(.S(w_9_15), .Cout(c_9_15),  .A(w_8_15), .B(data_operandA[9] & data_operandB[6]), .Cin(c_9_14));
full_adder add_w_9_16(.S(w_9_16), .Cout(c_9_16),  .A(w_8_16), .B(data_operandA[9] & data_operandB[7]), .Cin(c_9_15));
full_adder add_w_9_17(.S(w_9_17), .Cout(c_9_17),  .A(w_8_17), .B(data_operandA[9] & data_operandB[8]), .Cin(c_9_16));
full_adder add_w_9_18(.S(w_9_18), .Cout(c_9_18),  .A(w_8_18), .B(data_operandA[9] & data_operandB[9]), .Cin(c_9_17));
full_adder add_w_9_19(.S(w_9_19), .Cout(c_9_19),  .A(w_8_19), .B(data_operandA[9] & data_operandB[10]), .Cin(c_9_18));
full_adder add_w_9_20(.S(w_9_20), .Cout(c_9_20),  .A(w_8_20), .B(data_operandA[9] & data_operandB[11]), .Cin(c_9_19));
full_adder add_w_9_21(.S(w_9_21), .Cout(c_9_21),  .A(w_8_21), .B(data_operandA[9] & data_operandB[12]), .Cin(c_9_20));
full_adder add_w_9_22(.S(w_9_22), .Cout(c_9_22),  .A(w_8_22), .B(data_operandA[9] & data_operandB[13]), .Cin(c_9_21));
full_adder add_w_9_23(.S(w_9_23), .Cout(c_9_23),  .A(w_8_23), .B(data_operandA[9] & data_operandB[14]), .Cin(c_9_22));
full_adder add_w_9_24(.S(w_9_24), .Cout(c_9_24),  .A(w_8_24), .B(data_operandA[9] & data_operandB[15]), .Cin(c_9_23));
full_adder add_w_9_25(.S(w_9_25), .Cout(c_9_25),  .A(w_8_25), .B(data_operandA[9] & data_operandB[16]), .Cin(c_9_24));
full_adder add_w_9_26(.S(w_9_26), .Cout(c_9_26),  .A(w_8_26), .B(data_operandA[9] & data_operandB[17]), .Cin(c_9_25));
full_adder add_w_9_27(.S(w_9_27), .Cout(c_9_27),  .A(w_8_27), .B(data_operandA[9] & data_operandB[18]), .Cin(c_9_26));
full_adder add_w_9_28(.S(w_9_28), .Cout(c_9_28),  .A(w_8_28), .B(data_operandA[9] & data_operandB[19]), .Cin(c_9_27));
full_adder add_w_9_29(.S(w_9_29), .Cout(c_9_29),  .A(w_8_29), .B(data_operandA[9] & data_operandB[20]), .Cin(c_9_28));
full_adder add_w_9_30(.S(w_9_30), .Cout(c_9_30),  .A(w_8_30), .B(data_operandA[9] & data_operandB[21]), .Cin(c_9_29));
full_adder add_w_9_31(.S(w_9_31), .Cout(c_9_31),  .A(w_8_31), .B(data_operandA[9] & data_operandB[22]), .Cin(c_9_30));
full_adder add_w_9_32(.S(w_9_32), .Cout(c_9_32),  .A(w_8_32), .B(data_operandA[9] & data_operandB[23]), .Cin(c_9_31));
full_adder add_w_9_33(.S(w_9_33), .Cout(c_9_33),  .A(w_8_33), .B(data_operandA[9] & data_operandB[24]), .Cin(c_9_32));
full_adder add_w_9_34(.S(w_9_34), .Cout(c_9_34),  .A(w_8_34), .B(data_operandA[9] & data_operandB[25]), .Cin(c_9_33));
full_adder add_w_9_35(.S(w_9_35), .Cout(c_9_35),  .A(w_8_35), .B(data_operandA[9] & data_operandB[26]), .Cin(c_9_34));
full_adder add_w_9_36(.S(w_9_36), .Cout(c_9_36),  .A(w_8_36), .B(data_operandA[9] & data_operandB[27]), .Cin(c_9_35));
full_adder add_w_9_37(.S(w_9_37), .Cout(c_9_37),  .A(w_8_37), .B(data_operandA[9] & data_operandB[28]), .Cin(c_9_36));
full_adder add_w_9_38(.S(w_9_38), .Cout(c_9_38),  .A(w_8_38), .B(data_operandA[9] & data_operandB[29]), .Cin(c_9_37));
full_adder add_w_9_39(.S(w_9_39), .Cout(c_9_39),  .A(w_8_39), .B(data_operandA[9] & data_operandB[30]), .Cin(c_9_38));
full_adder add_w_9_40(.S(w_9_40), .Cout(w_9_41),  .A(w_8_40), .B( !(data_operandA[9] & data_operandB[31])), .Cin(c_9_39));



// these are my wires that have the result of each full adder
wire w_10_42, w_10_10, w_10_11, w_10_12, w_10_13, w_10_14, w_10_15, w_10_16, w_10_17, w_10_18, w_10_19, w_10_20, w_10_21, w_10_22, w_10_23, w_10_24, w_10_25, w_10_26, w_10_27, w_10_28, w_10_29, w_10_30, w_10_31, w_10_32, w_10_33, w_10_34, w_10_35, w_10_36, w_10_37, w_10_38, w_10_39, w_10_40, w_10_41;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_10_10, c_10_11, c_10_12, c_10_13, c_10_14, c_10_15, c_10_16, c_10_17, c_10_18, c_10_19, c_10_20, c_10_21, c_10_22, c_10_23, c_10_24, c_10_25, c_10_26, c_10_27, c_10_28, c_10_29, c_10_30, c_10_31, c_10_32, c_10_33, c_10_34, c_10_35, c_10_36, c_10_37, c_10_38, c_10_39, c_10_40, c_10_41;

full_adder add_w_10_10(.S(w_10_10), .Cout(c_10_10),  .A(w_9_10), .B(data_operandA[10] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_10_11(.S(w_10_11), .Cout(c_10_11),  .A(w_9_11), .B(data_operandA[10] & data_operandB[1]), .Cin(c_10_10));
full_adder add_w_10_12(.S(w_10_12), .Cout(c_10_12),  .A(w_9_12), .B(data_operandA[10] & data_operandB[2]), .Cin(c_10_11));
full_adder add_w_10_13(.S(w_10_13), .Cout(c_10_13),  .A(w_9_13), .B(data_operandA[10] & data_operandB[3]), .Cin(c_10_12));
full_adder add_w_10_14(.S(w_10_14), .Cout(c_10_14),  .A(w_9_14), .B(data_operandA[10] & data_operandB[4]), .Cin(c_10_13));
full_adder add_w_10_15(.S(w_10_15), .Cout(c_10_15),  .A(w_9_15), .B(data_operandA[10] & data_operandB[5]), .Cin(c_10_14));
full_adder add_w_10_16(.S(w_10_16), .Cout(c_10_16),  .A(w_9_16), .B(data_operandA[10] & data_operandB[6]), .Cin(c_10_15));
full_adder add_w_10_17(.S(w_10_17), .Cout(c_10_17),  .A(w_9_17), .B(data_operandA[10] & data_operandB[7]), .Cin(c_10_16));
full_adder add_w_10_18(.S(w_10_18), .Cout(c_10_18),  .A(w_9_18), .B(data_operandA[10] & data_operandB[8]), .Cin(c_10_17));
full_adder add_w_10_19(.S(w_10_19), .Cout(c_10_19),  .A(w_9_19), .B(data_operandA[10] & data_operandB[9]), .Cin(c_10_18));
full_adder add_w_10_20(.S(w_10_20), .Cout(c_10_20),  .A(w_9_20), .B(data_operandA[10] & data_operandB[10]), .Cin(c_10_19));
full_adder add_w_10_21(.S(w_10_21), .Cout(c_10_21),  .A(w_9_21), .B(data_operandA[10] & data_operandB[11]), .Cin(c_10_20));
full_adder add_w_10_22(.S(w_10_22), .Cout(c_10_22),  .A(w_9_22), .B(data_operandA[10] & data_operandB[12]), .Cin(c_10_21));
full_adder add_w_10_23(.S(w_10_23), .Cout(c_10_23),  .A(w_9_23), .B(data_operandA[10] & data_operandB[13]), .Cin(c_10_22));
full_adder add_w_10_24(.S(w_10_24), .Cout(c_10_24),  .A(w_9_24), .B(data_operandA[10] & data_operandB[14]), .Cin(c_10_23));
full_adder add_w_10_25(.S(w_10_25), .Cout(c_10_25),  .A(w_9_25), .B(data_operandA[10] & data_operandB[15]), .Cin(c_10_24));
full_adder add_w_10_26(.S(w_10_26), .Cout(c_10_26),  .A(w_9_26), .B(data_operandA[10] & data_operandB[16]), .Cin(c_10_25));
full_adder add_w_10_27(.S(w_10_27), .Cout(c_10_27),  .A(w_9_27), .B(data_operandA[10] & data_operandB[17]), .Cin(c_10_26));
full_adder add_w_10_28(.S(w_10_28), .Cout(c_10_28),  .A(w_9_28), .B(data_operandA[10] & data_operandB[18]), .Cin(c_10_27));
full_adder add_w_10_29(.S(w_10_29), .Cout(c_10_29),  .A(w_9_29), .B(data_operandA[10] & data_operandB[19]), .Cin(c_10_28));
full_adder add_w_10_30(.S(w_10_30), .Cout(c_10_30),  .A(w_9_30), .B(data_operandA[10] & data_operandB[20]), .Cin(c_10_29));
full_adder add_w_10_31(.S(w_10_31), .Cout(c_10_31),  .A(w_9_31), .B(data_operandA[10] & data_operandB[21]), .Cin(c_10_30));
full_adder add_w_10_32(.S(w_10_32), .Cout(c_10_32),  .A(w_9_32), .B(data_operandA[10] & data_operandB[22]), .Cin(c_10_31));
full_adder add_w_10_33(.S(w_10_33), .Cout(c_10_33),  .A(w_9_33), .B(data_operandA[10] & data_operandB[23]), .Cin(c_10_32));
full_adder add_w_10_34(.S(w_10_34), .Cout(c_10_34),  .A(w_9_34), .B(data_operandA[10] & data_operandB[24]), .Cin(c_10_33));
full_adder add_w_10_35(.S(w_10_35), .Cout(c_10_35),  .A(w_9_35), .B(data_operandA[10] & data_operandB[25]), .Cin(c_10_34));
full_adder add_w_10_36(.S(w_10_36), .Cout(c_10_36),  .A(w_9_36), .B(data_operandA[10] & data_operandB[26]), .Cin(c_10_35));
full_adder add_w_10_37(.S(w_10_37), .Cout(c_10_37),  .A(w_9_37), .B(data_operandA[10] & data_operandB[27]), .Cin(c_10_36));
full_adder add_w_10_38(.S(w_10_38), .Cout(c_10_38),  .A(w_9_38), .B(data_operandA[10] & data_operandB[28]), .Cin(c_10_37));
full_adder add_w_10_39(.S(w_10_39), .Cout(c_10_39),  .A(w_9_39), .B(data_operandA[10] & data_operandB[29]), .Cin(c_10_38));
full_adder add_w_10_40(.S(w_10_40), .Cout(c_10_40),  .A(w_9_40), .B(data_operandA[10] & data_operandB[30]), .Cin(c_10_39));
full_adder add_w_10_41(.S(w_10_41), .Cout(w_10_42),  .A(w_9_41), .B( !(data_operandA[10] & data_operandB[31])), .Cin(c_10_40));



// these are my wires that have the result of each full adder
wire w_11_43, w_11_11, w_11_12, w_11_13, w_11_14, w_11_15, w_11_16, w_11_17, w_11_18, w_11_19, w_11_20, w_11_21, w_11_22, w_11_23, w_11_24, w_11_25, w_11_26, w_11_27, w_11_28, w_11_29, w_11_30, w_11_31, w_11_32, w_11_33, w_11_34, w_11_35, w_11_36, w_11_37, w_11_38, w_11_39, w_11_40, w_11_41, w_11_42;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_11_11, c_11_12, c_11_13, c_11_14, c_11_15, c_11_16, c_11_17, c_11_18, c_11_19, c_11_20, c_11_21, c_11_22, c_11_23, c_11_24, c_11_25, c_11_26, c_11_27, c_11_28, c_11_29, c_11_30, c_11_31, c_11_32, c_11_33, c_11_34, c_11_35, c_11_36, c_11_37, c_11_38, c_11_39, c_11_40, c_11_41, c_11_42;

full_adder add_w_11_11(.S(w_11_11), .Cout(c_11_11),  .A(w_10_11), .B(data_operandA[11] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_11_12(.S(w_11_12), .Cout(c_11_12),  .A(w_10_12), .B(data_operandA[11] & data_operandB[1]), .Cin(c_11_11));
full_adder add_w_11_13(.S(w_11_13), .Cout(c_11_13),  .A(w_10_13), .B(data_operandA[11] & data_operandB[2]), .Cin(c_11_12));
full_adder add_w_11_14(.S(w_11_14), .Cout(c_11_14),  .A(w_10_14), .B(data_operandA[11] & data_operandB[3]), .Cin(c_11_13));
full_adder add_w_11_15(.S(w_11_15), .Cout(c_11_15),  .A(w_10_15), .B(data_operandA[11] & data_operandB[4]), .Cin(c_11_14));
full_adder add_w_11_16(.S(w_11_16), .Cout(c_11_16),  .A(w_10_16), .B(data_operandA[11] & data_operandB[5]), .Cin(c_11_15));
full_adder add_w_11_17(.S(w_11_17), .Cout(c_11_17),  .A(w_10_17), .B(data_operandA[11] & data_operandB[6]), .Cin(c_11_16));
full_adder add_w_11_18(.S(w_11_18), .Cout(c_11_18),  .A(w_10_18), .B(data_operandA[11] & data_operandB[7]), .Cin(c_11_17));
full_adder add_w_11_19(.S(w_11_19), .Cout(c_11_19),  .A(w_10_19), .B(data_operandA[11] & data_operandB[8]), .Cin(c_11_18));
full_adder add_w_11_20(.S(w_11_20), .Cout(c_11_20),  .A(w_10_20), .B(data_operandA[11] & data_operandB[9]), .Cin(c_11_19));
full_adder add_w_11_21(.S(w_11_21), .Cout(c_11_21),  .A(w_10_21), .B(data_operandA[11] & data_operandB[10]), .Cin(c_11_20));
full_adder add_w_11_22(.S(w_11_22), .Cout(c_11_22),  .A(w_10_22), .B(data_operandA[11] & data_operandB[11]), .Cin(c_11_21));
full_adder add_w_11_23(.S(w_11_23), .Cout(c_11_23),  .A(w_10_23), .B(data_operandA[11] & data_operandB[12]), .Cin(c_11_22));
full_adder add_w_11_24(.S(w_11_24), .Cout(c_11_24),  .A(w_10_24), .B(data_operandA[11] & data_operandB[13]), .Cin(c_11_23));
full_adder add_w_11_25(.S(w_11_25), .Cout(c_11_25),  .A(w_10_25), .B(data_operandA[11] & data_operandB[14]), .Cin(c_11_24));
full_adder add_w_11_26(.S(w_11_26), .Cout(c_11_26),  .A(w_10_26), .B(data_operandA[11] & data_operandB[15]), .Cin(c_11_25));
full_adder add_w_11_27(.S(w_11_27), .Cout(c_11_27),  .A(w_10_27), .B(data_operandA[11] & data_operandB[16]), .Cin(c_11_26));
full_adder add_w_11_28(.S(w_11_28), .Cout(c_11_28),  .A(w_10_28), .B(data_operandA[11] & data_operandB[17]), .Cin(c_11_27));
full_adder add_w_11_29(.S(w_11_29), .Cout(c_11_29),  .A(w_10_29), .B(data_operandA[11] & data_operandB[18]), .Cin(c_11_28));
full_adder add_w_11_30(.S(w_11_30), .Cout(c_11_30),  .A(w_10_30), .B(data_operandA[11] & data_operandB[19]), .Cin(c_11_29));
full_adder add_w_11_31(.S(w_11_31), .Cout(c_11_31),  .A(w_10_31), .B(data_operandA[11] & data_operandB[20]), .Cin(c_11_30));
full_adder add_w_11_32(.S(w_11_32), .Cout(c_11_32),  .A(w_10_32), .B(data_operandA[11] & data_operandB[21]), .Cin(c_11_31));
full_adder add_w_11_33(.S(w_11_33), .Cout(c_11_33),  .A(w_10_33), .B(data_operandA[11] & data_operandB[22]), .Cin(c_11_32));
full_adder add_w_11_34(.S(w_11_34), .Cout(c_11_34),  .A(w_10_34), .B(data_operandA[11] & data_operandB[23]), .Cin(c_11_33));
full_adder add_w_11_35(.S(w_11_35), .Cout(c_11_35),  .A(w_10_35), .B(data_operandA[11] & data_operandB[24]), .Cin(c_11_34));
full_adder add_w_11_36(.S(w_11_36), .Cout(c_11_36),  .A(w_10_36), .B(data_operandA[11] & data_operandB[25]), .Cin(c_11_35));
full_adder add_w_11_37(.S(w_11_37), .Cout(c_11_37),  .A(w_10_37), .B(data_operandA[11] & data_operandB[26]), .Cin(c_11_36));
full_adder add_w_11_38(.S(w_11_38), .Cout(c_11_38),  .A(w_10_38), .B(data_operandA[11] & data_operandB[27]), .Cin(c_11_37));
full_adder add_w_11_39(.S(w_11_39), .Cout(c_11_39),  .A(w_10_39), .B(data_operandA[11] & data_operandB[28]), .Cin(c_11_38));
full_adder add_w_11_40(.S(w_11_40), .Cout(c_11_40),  .A(w_10_40), .B(data_operandA[11] & data_operandB[29]), .Cin(c_11_39));
full_adder add_w_11_41(.S(w_11_41), .Cout(c_11_41),  .A(w_10_41), .B(data_operandA[11] & data_operandB[30]), .Cin(c_11_40));
full_adder add_w_11_42(.S(w_11_42), .Cout(w_11_43),  .A(w_10_42), .B( !(data_operandA[11] & data_operandB[31])), .Cin(c_11_41));



// these are my wires that have the result of each full adder
wire w_12_44, w_12_12, w_12_13, w_12_14, w_12_15, w_12_16, w_12_17, w_12_18, w_12_19, w_12_20, w_12_21, w_12_22, w_12_23, w_12_24, w_12_25, w_12_26, w_12_27, w_12_28, w_12_29, w_12_30, w_12_31, w_12_32, w_12_33, w_12_34, w_12_35, w_12_36, w_12_37, w_12_38, w_12_39, w_12_40, w_12_41, w_12_42, w_12_43;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_12_12, c_12_13, c_12_14, c_12_15, c_12_16, c_12_17, c_12_18, c_12_19, c_12_20, c_12_21, c_12_22, c_12_23, c_12_24, c_12_25, c_12_26, c_12_27, c_12_28, c_12_29, c_12_30, c_12_31, c_12_32, c_12_33, c_12_34, c_12_35, c_12_36, c_12_37, c_12_38, c_12_39, c_12_40, c_12_41, c_12_42, c_12_43;

full_adder add_w_12_12(.S(w_12_12), .Cout(c_12_12),  .A(w_11_12), .B(data_operandA[12] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_12_13(.S(w_12_13), .Cout(c_12_13),  .A(w_11_13), .B(data_operandA[12] & data_operandB[1]), .Cin(c_12_12));
full_adder add_w_12_14(.S(w_12_14), .Cout(c_12_14),  .A(w_11_14), .B(data_operandA[12] & data_operandB[2]), .Cin(c_12_13));
full_adder add_w_12_15(.S(w_12_15), .Cout(c_12_15),  .A(w_11_15), .B(data_operandA[12] & data_operandB[3]), .Cin(c_12_14));
full_adder add_w_12_16(.S(w_12_16), .Cout(c_12_16),  .A(w_11_16), .B(data_operandA[12] & data_operandB[4]), .Cin(c_12_15));
full_adder add_w_12_17(.S(w_12_17), .Cout(c_12_17),  .A(w_11_17), .B(data_operandA[12] & data_operandB[5]), .Cin(c_12_16));
full_adder add_w_12_18(.S(w_12_18), .Cout(c_12_18),  .A(w_11_18), .B(data_operandA[12] & data_operandB[6]), .Cin(c_12_17));
full_adder add_w_12_19(.S(w_12_19), .Cout(c_12_19),  .A(w_11_19), .B(data_operandA[12] & data_operandB[7]), .Cin(c_12_18));
full_adder add_w_12_20(.S(w_12_20), .Cout(c_12_20),  .A(w_11_20), .B(data_operandA[12] & data_operandB[8]), .Cin(c_12_19));
full_adder add_w_12_21(.S(w_12_21), .Cout(c_12_21),  .A(w_11_21), .B(data_operandA[12] & data_operandB[9]), .Cin(c_12_20));
full_adder add_w_12_22(.S(w_12_22), .Cout(c_12_22),  .A(w_11_22), .B(data_operandA[12] & data_operandB[10]), .Cin(c_12_21));
full_adder add_w_12_23(.S(w_12_23), .Cout(c_12_23),  .A(w_11_23), .B(data_operandA[12] & data_operandB[11]), .Cin(c_12_22));
full_adder add_w_12_24(.S(w_12_24), .Cout(c_12_24),  .A(w_11_24), .B(data_operandA[12] & data_operandB[12]), .Cin(c_12_23));
full_adder add_w_12_25(.S(w_12_25), .Cout(c_12_25),  .A(w_11_25), .B(data_operandA[12] & data_operandB[13]), .Cin(c_12_24));
full_adder add_w_12_26(.S(w_12_26), .Cout(c_12_26),  .A(w_11_26), .B(data_operandA[12] & data_operandB[14]), .Cin(c_12_25));
full_adder add_w_12_27(.S(w_12_27), .Cout(c_12_27),  .A(w_11_27), .B(data_operandA[12] & data_operandB[15]), .Cin(c_12_26));
full_adder add_w_12_28(.S(w_12_28), .Cout(c_12_28),  .A(w_11_28), .B(data_operandA[12] & data_operandB[16]), .Cin(c_12_27));
full_adder add_w_12_29(.S(w_12_29), .Cout(c_12_29),  .A(w_11_29), .B(data_operandA[12] & data_operandB[17]), .Cin(c_12_28));
full_adder add_w_12_30(.S(w_12_30), .Cout(c_12_30),  .A(w_11_30), .B(data_operandA[12] & data_operandB[18]), .Cin(c_12_29));
full_adder add_w_12_31(.S(w_12_31), .Cout(c_12_31),  .A(w_11_31), .B(data_operandA[12] & data_operandB[19]), .Cin(c_12_30));
full_adder add_w_12_32(.S(w_12_32), .Cout(c_12_32),  .A(w_11_32), .B(data_operandA[12] & data_operandB[20]), .Cin(c_12_31));
full_adder add_w_12_33(.S(w_12_33), .Cout(c_12_33),  .A(w_11_33), .B(data_operandA[12] & data_operandB[21]), .Cin(c_12_32));
full_adder add_w_12_34(.S(w_12_34), .Cout(c_12_34),  .A(w_11_34), .B(data_operandA[12] & data_operandB[22]), .Cin(c_12_33));
full_adder add_w_12_35(.S(w_12_35), .Cout(c_12_35),  .A(w_11_35), .B(data_operandA[12] & data_operandB[23]), .Cin(c_12_34));
full_adder add_w_12_36(.S(w_12_36), .Cout(c_12_36),  .A(w_11_36), .B(data_operandA[12] & data_operandB[24]), .Cin(c_12_35));
full_adder add_w_12_37(.S(w_12_37), .Cout(c_12_37),  .A(w_11_37), .B(data_operandA[12] & data_operandB[25]), .Cin(c_12_36));
full_adder add_w_12_38(.S(w_12_38), .Cout(c_12_38),  .A(w_11_38), .B(data_operandA[12] & data_operandB[26]), .Cin(c_12_37));
full_adder add_w_12_39(.S(w_12_39), .Cout(c_12_39),  .A(w_11_39), .B(data_operandA[12] & data_operandB[27]), .Cin(c_12_38));
full_adder add_w_12_40(.S(w_12_40), .Cout(c_12_40),  .A(w_11_40), .B(data_operandA[12] & data_operandB[28]), .Cin(c_12_39));
full_adder add_w_12_41(.S(w_12_41), .Cout(c_12_41),  .A(w_11_41), .B(data_operandA[12] & data_operandB[29]), .Cin(c_12_40));
full_adder add_w_12_42(.S(w_12_42), .Cout(c_12_42),  .A(w_11_42), .B(data_operandA[12] & data_operandB[30]), .Cin(c_12_41));
full_adder add_w_12_43(.S(w_12_43), .Cout(w_12_44),  .A(w_11_43), .B( !(data_operandA[12] & data_operandB[31])), .Cin(c_12_42));



// these are my wires that have the result of each full adder
wire w_13_45, w_13_13, w_13_14, w_13_15, w_13_16, w_13_17, w_13_18, w_13_19, w_13_20, w_13_21, w_13_22, w_13_23, w_13_24, w_13_25, w_13_26, w_13_27, w_13_28, w_13_29, w_13_30, w_13_31, w_13_32, w_13_33, w_13_34, w_13_35, w_13_36, w_13_37, w_13_38, w_13_39, w_13_40, w_13_41, w_13_42, w_13_43, w_13_44;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_13_13, c_13_14, c_13_15, c_13_16, c_13_17, c_13_18, c_13_19, c_13_20, c_13_21, c_13_22, c_13_23, c_13_24, c_13_25, c_13_26, c_13_27, c_13_28, c_13_29, c_13_30, c_13_31, c_13_32, c_13_33, c_13_34, c_13_35, c_13_36, c_13_37, c_13_38, c_13_39, c_13_40, c_13_41, c_13_42, c_13_43, c_13_44;

full_adder add_w_13_13(.S(w_13_13), .Cout(c_13_13),  .A(w_12_13), .B(data_operandA[13] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_13_14(.S(w_13_14), .Cout(c_13_14),  .A(w_12_14), .B(data_operandA[13] & data_operandB[1]), .Cin(c_13_13));
full_adder add_w_13_15(.S(w_13_15), .Cout(c_13_15),  .A(w_12_15), .B(data_operandA[13] & data_operandB[2]), .Cin(c_13_14));
full_adder add_w_13_16(.S(w_13_16), .Cout(c_13_16),  .A(w_12_16), .B(data_operandA[13] & data_operandB[3]), .Cin(c_13_15));
full_adder add_w_13_17(.S(w_13_17), .Cout(c_13_17),  .A(w_12_17), .B(data_operandA[13] & data_operandB[4]), .Cin(c_13_16));
full_adder add_w_13_18(.S(w_13_18), .Cout(c_13_18),  .A(w_12_18), .B(data_operandA[13] & data_operandB[5]), .Cin(c_13_17));
full_adder add_w_13_19(.S(w_13_19), .Cout(c_13_19),  .A(w_12_19), .B(data_operandA[13] & data_operandB[6]), .Cin(c_13_18));
full_adder add_w_13_20(.S(w_13_20), .Cout(c_13_20),  .A(w_12_20), .B(data_operandA[13] & data_operandB[7]), .Cin(c_13_19));
full_adder add_w_13_21(.S(w_13_21), .Cout(c_13_21),  .A(w_12_21), .B(data_operandA[13] & data_operandB[8]), .Cin(c_13_20));
full_adder add_w_13_22(.S(w_13_22), .Cout(c_13_22),  .A(w_12_22), .B(data_operandA[13] & data_operandB[9]), .Cin(c_13_21));
full_adder add_w_13_23(.S(w_13_23), .Cout(c_13_23),  .A(w_12_23), .B(data_operandA[13] & data_operandB[10]), .Cin(c_13_22));
full_adder add_w_13_24(.S(w_13_24), .Cout(c_13_24),  .A(w_12_24), .B(data_operandA[13] & data_operandB[11]), .Cin(c_13_23));
full_adder add_w_13_25(.S(w_13_25), .Cout(c_13_25),  .A(w_12_25), .B(data_operandA[13] & data_operandB[12]), .Cin(c_13_24));
full_adder add_w_13_26(.S(w_13_26), .Cout(c_13_26),  .A(w_12_26), .B(data_operandA[13] & data_operandB[13]), .Cin(c_13_25));
full_adder add_w_13_27(.S(w_13_27), .Cout(c_13_27),  .A(w_12_27), .B(data_operandA[13] & data_operandB[14]), .Cin(c_13_26));
full_adder add_w_13_28(.S(w_13_28), .Cout(c_13_28),  .A(w_12_28), .B(data_operandA[13] & data_operandB[15]), .Cin(c_13_27));
full_adder add_w_13_29(.S(w_13_29), .Cout(c_13_29),  .A(w_12_29), .B(data_operandA[13] & data_operandB[16]), .Cin(c_13_28));
full_adder add_w_13_30(.S(w_13_30), .Cout(c_13_30),  .A(w_12_30), .B(data_operandA[13] & data_operandB[17]), .Cin(c_13_29));
full_adder add_w_13_31(.S(w_13_31), .Cout(c_13_31),  .A(w_12_31), .B(data_operandA[13] & data_operandB[18]), .Cin(c_13_30));
full_adder add_w_13_32(.S(w_13_32), .Cout(c_13_32),  .A(w_12_32), .B(data_operandA[13] & data_operandB[19]), .Cin(c_13_31));
full_adder add_w_13_33(.S(w_13_33), .Cout(c_13_33),  .A(w_12_33), .B(data_operandA[13] & data_operandB[20]), .Cin(c_13_32));
full_adder add_w_13_34(.S(w_13_34), .Cout(c_13_34),  .A(w_12_34), .B(data_operandA[13] & data_operandB[21]), .Cin(c_13_33));
full_adder add_w_13_35(.S(w_13_35), .Cout(c_13_35),  .A(w_12_35), .B(data_operandA[13] & data_operandB[22]), .Cin(c_13_34));
full_adder add_w_13_36(.S(w_13_36), .Cout(c_13_36),  .A(w_12_36), .B(data_operandA[13] & data_operandB[23]), .Cin(c_13_35));
full_adder add_w_13_37(.S(w_13_37), .Cout(c_13_37),  .A(w_12_37), .B(data_operandA[13] & data_operandB[24]), .Cin(c_13_36));
full_adder add_w_13_38(.S(w_13_38), .Cout(c_13_38),  .A(w_12_38), .B(data_operandA[13] & data_operandB[25]), .Cin(c_13_37));
full_adder add_w_13_39(.S(w_13_39), .Cout(c_13_39),  .A(w_12_39), .B(data_operandA[13] & data_operandB[26]), .Cin(c_13_38));
full_adder add_w_13_40(.S(w_13_40), .Cout(c_13_40),  .A(w_12_40), .B(data_operandA[13] & data_operandB[27]), .Cin(c_13_39));
full_adder add_w_13_41(.S(w_13_41), .Cout(c_13_41),  .A(w_12_41), .B(data_operandA[13] & data_operandB[28]), .Cin(c_13_40));
full_adder add_w_13_42(.S(w_13_42), .Cout(c_13_42),  .A(w_12_42), .B(data_operandA[13] & data_operandB[29]), .Cin(c_13_41));
full_adder add_w_13_43(.S(w_13_43), .Cout(c_13_43),  .A(w_12_43), .B(data_operandA[13] & data_operandB[30]), .Cin(c_13_42));
full_adder add_w_13_44(.S(w_13_44), .Cout(w_13_45),  .A(w_12_44), .B( !(data_operandA[13] & data_operandB[31])), .Cin(c_13_43));



// these are my wires that have the result of each full adder
wire w_14_46, w_14_14, w_14_15, w_14_16, w_14_17, w_14_18, w_14_19, w_14_20, w_14_21, w_14_22, w_14_23, w_14_24, w_14_25, w_14_26, w_14_27, w_14_28, w_14_29, w_14_30, w_14_31, w_14_32, w_14_33, w_14_34, w_14_35, w_14_36, w_14_37, w_14_38, w_14_39, w_14_40, w_14_41, w_14_42, w_14_43, w_14_44, w_14_45;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_14_14, c_14_15, c_14_16, c_14_17, c_14_18, c_14_19, c_14_20, c_14_21, c_14_22, c_14_23, c_14_24, c_14_25, c_14_26, c_14_27, c_14_28, c_14_29, c_14_30, c_14_31, c_14_32, c_14_33, c_14_34, c_14_35, c_14_36, c_14_37, c_14_38, c_14_39, c_14_40, c_14_41, c_14_42, c_14_43, c_14_44, c_14_45;

full_adder add_w_14_14(.S(w_14_14), .Cout(c_14_14),  .A(w_13_14), .B(data_operandA[14] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_14_15(.S(w_14_15), .Cout(c_14_15),  .A(w_13_15), .B(data_operandA[14] & data_operandB[1]), .Cin(c_14_14));
full_adder add_w_14_16(.S(w_14_16), .Cout(c_14_16),  .A(w_13_16), .B(data_operandA[14] & data_operandB[2]), .Cin(c_14_15));
full_adder add_w_14_17(.S(w_14_17), .Cout(c_14_17),  .A(w_13_17), .B(data_operandA[14] & data_operandB[3]), .Cin(c_14_16));
full_adder add_w_14_18(.S(w_14_18), .Cout(c_14_18),  .A(w_13_18), .B(data_operandA[14] & data_operandB[4]), .Cin(c_14_17));
full_adder add_w_14_19(.S(w_14_19), .Cout(c_14_19),  .A(w_13_19), .B(data_operandA[14] & data_operandB[5]), .Cin(c_14_18));
full_adder add_w_14_20(.S(w_14_20), .Cout(c_14_20),  .A(w_13_20), .B(data_operandA[14] & data_operandB[6]), .Cin(c_14_19));
full_adder add_w_14_21(.S(w_14_21), .Cout(c_14_21),  .A(w_13_21), .B(data_operandA[14] & data_operandB[7]), .Cin(c_14_20));
full_adder add_w_14_22(.S(w_14_22), .Cout(c_14_22),  .A(w_13_22), .B(data_operandA[14] & data_operandB[8]), .Cin(c_14_21));
full_adder add_w_14_23(.S(w_14_23), .Cout(c_14_23),  .A(w_13_23), .B(data_operandA[14] & data_operandB[9]), .Cin(c_14_22));
full_adder add_w_14_24(.S(w_14_24), .Cout(c_14_24),  .A(w_13_24), .B(data_operandA[14] & data_operandB[10]), .Cin(c_14_23));
full_adder add_w_14_25(.S(w_14_25), .Cout(c_14_25),  .A(w_13_25), .B(data_operandA[14] & data_operandB[11]), .Cin(c_14_24));
full_adder add_w_14_26(.S(w_14_26), .Cout(c_14_26),  .A(w_13_26), .B(data_operandA[14] & data_operandB[12]), .Cin(c_14_25));
full_adder add_w_14_27(.S(w_14_27), .Cout(c_14_27),  .A(w_13_27), .B(data_operandA[14] & data_operandB[13]), .Cin(c_14_26));
full_adder add_w_14_28(.S(w_14_28), .Cout(c_14_28),  .A(w_13_28), .B(data_operandA[14] & data_operandB[14]), .Cin(c_14_27));
full_adder add_w_14_29(.S(w_14_29), .Cout(c_14_29),  .A(w_13_29), .B(data_operandA[14] & data_operandB[15]), .Cin(c_14_28));
full_adder add_w_14_30(.S(w_14_30), .Cout(c_14_30),  .A(w_13_30), .B(data_operandA[14] & data_operandB[16]), .Cin(c_14_29));
full_adder add_w_14_31(.S(w_14_31), .Cout(c_14_31),  .A(w_13_31), .B(data_operandA[14] & data_operandB[17]), .Cin(c_14_30));
full_adder add_w_14_32(.S(w_14_32), .Cout(c_14_32),  .A(w_13_32), .B(data_operandA[14] & data_operandB[18]), .Cin(c_14_31));
full_adder add_w_14_33(.S(w_14_33), .Cout(c_14_33),  .A(w_13_33), .B(data_operandA[14] & data_operandB[19]), .Cin(c_14_32));
full_adder add_w_14_34(.S(w_14_34), .Cout(c_14_34),  .A(w_13_34), .B(data_operandA[14] & data_operandB[20]), .Cin(c_14_33));
full_adder add_w_14_35(.S(w_14_35), .Cout(c_14_35),  .A(w_13_35), .B(data_operandA[14] & data_operandB[21]), .Cin(c_14_34));
full_adder add_w_14_36(.S(w_14_36), .Cout(c_14_36),  .A(w_13_36), .B(data_operandA[14] & data_operandB[22]), .Cin(c_14_35));
full_adder add_w_14_37(.S(w_14_37), .Cout(c_14_37),  .A(w_13_37), .B(data_operandA[14] & data_operandB[23]), .Cin(c_14_36));
full_adder add_w_14_38(.S(w_14_38), .Cout(c_14_38),  .A(w_13_38), .B(data_operandA[14] & data_operandB[24]), .Cin(c_14_37));
full_adder add_w_14_39(.S(w_14_39), .Cout(c_14_39),  .A(w_13_39), .B(data_operandA[14] & data_operandB[25]), .Cin(c_14_38));
full_adder add_w_14_40(.S(w_14_40), .Cout(c_14_40),  .A(w_13_40), .B(data_operandA[14] & data_operandB[26]), .Cin(c_14_39));
full_adder add_w_14_41(.S(w_14_41), .Cout(c_14_41),  .A(w_13_41), .B(data_operandA[14] & data_operandB[27]), .Cin(c_14_40));
full_adder add_w_14_42(.S(w_14_42), .Cout(c_14_42),  .A(w_13_42), .B(data_operandA[14] & data_operandB[28]), .Cin(c_14_41));
full_adder add_w_14_43(.S(w_14_43), .Cout(c_14_43),  .A(w_13_43), .B(data_operandA[14] & data_operandB[29]), .Cin(c_14_42));
full_adder add_w_14_44(.S(w_14_44), .Cout(c_14_44),  .A(w_13_44), .B(data_operandA[14] & data_operandB[30]), .Cin(c_14_43));
full_adder add_w_14_45(.S(w_14_45), .Cout(w_14_46),  .A(w_13_45), .B( !(data_operandA[14] & data_operandB[31])), .Cin(c_14_44));



// these are my wires that have the result of each full adder
wire w_15_47, w_15_15, w_15_16, w_15_17, w_15_18, w_15_19, w_15_20, w_15_21, w_15_22, w_15_23, w_15_24, w_15_25, w_15_26, w_15_27, w_15_28, w_15_29, w_15_30, w_15_31, w_15_32, w_15_33, w_15_34, w_15_35, w_15_36, w_15_37, w_15_38, w_15_39, w_15_40, w_15_41, w_15_42, w_15_43, w_15_44, w_15_45, w_15_46;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_15_15, c_15_16, c_15_17, c_15_18, c_15_19, c_15_20, c_15_21, c_15_22, c_15_23, c_15_24, c_15_25, c_15_26, c_15_27, c_15_28, c_15_29, c_15_30, c_15_31, c_15_32, c_15_33, c_15_34, c_15_35, c_15_36, c_15_37, c_15_38, c_15_39, c_15_40, c_15_41, c_15_42, c_15_43, c_15_44, c_15_45, c_15_46;

full_adder add_w_15_15(.S(w_15_15), .Cout(c_15_15),  .A(w_14_15), .B(data_operandA[15] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_15_16(.S(w_15_16), .Cout(c_15_16),  .A(w_14_16), .B(data_operandA[15] & data_operandB[1]), .Cin(c_15_15));
full_adder add_w_15_17(.S(w_15_17), .Cout(c_15_17),  .A(w_14_17), .B(data_operandA[15] & data_operandB[2]), .Cin(c_15_16));
full_adder add_w_15_18(.S(w_15_18), .Cout(c_15_18),  .A(w_14_18), .B(data_operandA[15] & data_operandB[3]), .Cin(c_15_17));
full_adder add_w_15_19(.S(w_15_19), .Cout(c_15_19),  .A(w_14_19), .B(data_operandA[15] & data_operandB[4]), .Cin(c_15_18));
full_adder add_w_15_20(.S(w_15_20), .Cout(c_15_20),  .A(w_14_20), .B(data_operandA[15] & data_operandB[5]), .Cin(c_15_19));
full_adder add_w_15_21(.S(w_15_21), .Cout(c_15_21),  .A(w_14_21), .B(data_operandA[15] & data_operandB[6]), .Cin(c_15_20));
full_adder add_w_15_22(.S(w_15_22), .Cout(c_15_22),  .A(w_14_22), .B(data_operandA[15] & data_operandB[7]), .Cin(c_15_21));
full_adder add_w_15_23(.S(w_15_23), .Cout(c_15_23),  .A(w_14_23), .B(data_operandA[15] & data_operandB[8]), .Cin(c_15_22));
full_adder add_w_15_24(.S(w_15_24), .Cout(c_15_24),  .A(w_14_24), .B(data_operandA[15] & data_operandB[9]), .Cin(c_15_23));
full_adder add_w_15_25(.S(w_15_25), .Cout(c_15_25),  .A(w_14_25), .B(data_operandA[15] & data_operandB[10]), .Cin(c_15_24));
full_adder add_w_15_26(.S(w_15_26), .Cout(c_15_26),  .A(w_14_26), .B(data_operandA[15] & data_operandB[11]), .Cin(c_15_25));
full_adder add_w_15_27(.S(w_15_27), .Cout(c_15_27),  .A(w_14_27), .B(data_operandA[15] & data_operandB[12]), .Cin(c_15_26));
full_adder add_w_15_28(.S(w_15_28), .Cout(c_15_28),  .A(w_14_28), .B(data_operandA[15] & data_operandB[13]), .Cin(c_15_27));
full_adder add_w_15_29(.S(w_15_29), .Cout(c_15_29),  .A(w_14_29), .B(data_operandA[15] & data_operandB[14]), .Cin(c_15_28));
full_adder add_w_15_30(.S(w_15_30), .Cout(c_15_30),  .A(w_14_30), .B(data_operandA[15] & data_operandB[15]), .Cin(c_15_29));
full_adder add_w_15_31(.S(w_15_31), .Cout(c_15_31),  .A(w_14_31), .B(data_operandA[15] & data_operandB[16]), .Cin(c_15_30));
full_adder add_w_15_32(.S(w_15_32), .Cout(c_15_32),  .A(w_14_32), .B(data_operandA[15] & data_operandB[17]), .Cin(c_15_31));
full_adder add_w_15_33(.S(w_15_33), .Cout(c_15_33),  .A(w_14_33), .B(data_operandA[15] & data_operandB[18]), .Cin(c_15_32));
full_adder add_w_15_34(.S(w_15_34), .Cout(c_15_34),  .A(w_14_34), .B(data_operandA[15] & data_operandB[19]), .Cin(c_15_33));
full_adder add_w_15_35(.S(w_15_35), .Cout(c_15_35),  .A(w_14_35), .B(data_operandA[15] & data_operandB[20]), .Cin(c_15_34));
full_adder add_w_15_36(.S(w_15_36), .Cout(c_15_36),  .A(w_14_36), .B(data_operandA[15] & data_operandB[21]), .Cin(c_15_35));
full_adder add_w_15_37(.S(w_15_37), .Cout(c_15_37),  .A(w_14_37), .B(data_operandA[15] & data_operandB[22]), .Cin(c_15_36));
full_adder add_w_15_38(.S(w_15_38), .Cout(c_15_38),  .A(w_14_38), .B(data_operandA[15] & data_operandB[23]), .Cin(c_15_37));
full_adder add_w_15_39(.S(w_15_39), .Cout(c_15_39),  .A(w_14_39), .B(data_operandA[15] & data_operandB[24]), .Cin(c_15_38));
full_adder add_w_15_40(.S(w_15_40), .Cout(c_15_40),  .A(w_14_40), .B(data_operandA[15] & data_operandB[25]), .Cin(c_15_39));
full_adder add_w_15_41(.S(w_15_41), .Cout(c_15_41),  .A(w_14_41), .B(data_operandA[15] & data_operandB[26]), .Cin(c_15_40));
full_adder add_w_15_42(.S(w_15_42), .Cout(c_15_42),  .A(w_14_42), .B(data_operandA[15] & data_operandB[27]), .Cin(c_15_41));
full_adder add_w_15_43(.S(w_15_43), .Cout(c_15_43),  .A(w_14_43), .B(data_operandA[15] & data_operandB[28]), .Cin(c_15_42));
full_adder add_w_15_44(.S(w_15_44), .Cout(c_15_44),  .A(w_14_44), .B(data_operandA[15] & data_operandB[29]), .Cin(c_15_43));
full_adder add_w_15_45(.S(w_15_45), .Cout(c_15_45),  .A(w_14_45), .B(data_operandA[15] & data_operandB[30]), .Cin(c_15_44));
full_adder add_w_15_46(.S(w_15_46), .Cout(w_15_47),  .A(w_14_46), .B( !(data_operandA[15] & data_operandB[31])), .Cin(c_15_45));



// these are my wires that have the result of each full adder
wire w_16_48, w_16_16, w_16_17, w_16_18, w_16_19, w_16_20, w_16_21, w_16_22, w_16_23, w_16_24, w_16_25, w_16_26, w_16_27, w_16_28, w_16_29, w_16_30, w_16_31, w_16_32, w_16_33, w_16_34, w_16_35, w_16_36, w_16_37, w_16_38, w_16_39, w_16_40, w_16_41, w_16_42, w_16_43, w_16_44, w_16_45, w_16_46, w_16_47;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_16_16, c_16_17, c_16_18, c_16_19, c_16_20, c_16_21, c_16_22, c_16_23, c_16_24, c_16_25, c_16_26, c_16_27, c_16_28, c_16_29, c_16_30, c_16_31, c_16_32, c_16_33, c_16_34, c_16_35, c_16_36, c_16_37, c_16_38, c_16_39, c_16_40, c_16_41, c_16_42, c_16_43, c_16_44, c_16_45, c_16_46, c_16_47;

full_adder add_w_16_16(.S(w_16_16), .Cout(c_16_16),  .A(w_15_16), .B(data_operandA[16] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_16_17(.S(w_16_17), .Cout(c_16_17),  .A(w_15_17), .B(data_operandA[16] & data_operandB[1]), .Cin(c_16_16));
full_adder add_w_16_18(.S(w_16_18), .Cout(c_16_18),  .A(w_15_18), .B(data_operandA[16] & data_operandB[2]), .Cin(c_16_17));
full_adder add_w_16_19(.S(w_16_19), .Cout(c_16_19),  .A(w_15_19), .B(data_operandA[16] & data_operandB[3]), .Cin(c_16_18));
full_adder add_w_16_20(.S(w_16_20), .Cout(c_16_20),  .A(w_15_20), .B(data_operandA[16] & data_operandB[4]), .Cin(c_16_19));
full_adder add_w_16_21(.S(w_16_21), .Cout(c_16_21),  .A(w_15_21), .B(data_operandA[16] & data_operandB[5]), .Cin(c_16_20));
full_adder add_w_16_22(.S(w_16_22), .Cout(c_16_22),  .A(w_15_22), .B(data_operandA[16] & data_operandB[6]), .Cin(c_16_21));
full_adder add_w_16_23(.S(w_16_23), .Cout(c_16_23),  .A(w_15_23), .B(data_operandA[16] & data_operandB[7]), .Cin(c_16_22));
full_adder add_w_16_24(.S(w_16_24), .Cout(c_16_24),  .A(w_15_24), .B(data_operandA[16] & data_operandB[8]), .Cin(c_16_23));
full_adder add_w_16_25(.S(w_16_25), .Cout(c_16_25),  .A(w_15_25), .B(data_operandA[16] & data_operandB[9]), .Cin(c_16_24));
full_adder add_w_16_26(.S(w_16_26), .Cout(c_16_26),  .A(w_15_26), .B(data_operandA[16] & data_operandB[10]), .Cin(c_16_25));
full_adder add_w_16_27(.S(w_16_27), .Cout(c_16_27),  .A(w_15_27), .B(data_operandA[16] & data_operandB[11]), .Cin(c_16_26));
full_adder add_w_16_28(.S(w_16_28), .Cout(c_16_28),  .A(w_15_28), .B(data_operandA[16] & data_operandB[12]), .Cin(c_16_27));
full_adder add_w_16_29(.S(w_16_29), .Cout(c_16_29),  .A(w_15_29), .B(data_operandA[16] & data_operandB[13]), .Cin(c_16_28));
full_adder add_w_16_30(.S(w_16_30), .Cout(c_16_30),  .A(w_15_30), .B(data_operandA[16] & data_operandB[14]), .Cin(c_16_29));
full_adder add_w_16_31(.S(w_16_31), .Cout(c_16_31),  .A(w_15_31), .B(data_operandA[16] & data_operandB[15]), .Cin(c_16_30));
full_adder add_w_16_32(.S(w_16_32), .Cout(c_16_32),  .A(w_15_32), .B(data_operandA[16] & data_operandB[16]), .Cin(c_16_31));
full_adder add_w_16_33(.S(w_16_33), .Cout(c_16_33),  .A(w_15_33), .B(data_operandA[16] & data_operandB[17]), .Cin(c_16_32));
full_adder add_w_16_34(.S(w_16_34), .Cout(c_16_34),  .A(w_15_34), .B(data_operandA[16] & data_operandB[18]), .Cin(c_16_33));
full_adder add_w_16_35(.S(w_16_35), .Cout(c_16_35),  .A(w_15_35), .B(data_operandA[16] & data_operandB[19]), .Cin(c_16_34));
full_adder add_w_16_36(.S(w_16_36), .Cout(c_16_36),  .A(w_15_36), .B(data_operandA[16] & data_operandB[20]), .Cin(c_16_35));
full_adder add_w_16_37(.S(w_16_37), .Cout(c_16_37),  .A(w_15_37), .B(data_operandA[16] & data_operandB[21]), .Cin(c_16_36));
full_adder add_w_16_38(.S(w_16_38), .Cout(c_16_38),  .A(w_15_38), .B(data_operandA[16] & data_operandB[22]), .Cin(c_16_37));
full_adder add_w_16_39(.S(w_16_39), .Cout(c_16_39),  .A(w_15_39), .B(data_operandA[16] & data_operandB[23]), .Cin(c_16_38));
full_adder add_w_16_40(.S(w_16_40), .Cout(c_16_40),  .A(w_15_40), .B(data_operandA[16] & data_operandB[24]), .Cin(c_16_39));
full_adder add_w_16_41(.S(w_16_41), .Cout(c_16_41),  .A(w_15_41), .B(data_operandA[16] & data_operandB[25]), .Cin(c_16_40));
full_adder add_w_16_42(.S(w_16_42), .Cout(c_16_42),  .A(w_15_42), .B(data_operandA[16] & data_operandB[26]), .Cin(c_16_41));
full_adder add_w_16_43(.S(w_16_43), .Cout(c_16_43),  .A(w_15_43), .B(data_operandA[16] & data_operandB[27]), .Cin(c_16_42));
full_adder add_w_16_44(.S(w_16_44), .Cout(c_16_44),  .A(w_15_44), .B(data_operandA[16] & data_operandB[28]), .Cin(c_16_43));
full_adder add_w_16_45(.S(w_16_45), .Cout(c_16_45),  .A(w_15_45), .B(data_operandA[16] & data_operandB[29]), .Cin(c_16_44));
full_adder add_w_16_46(.S(w_16_46), .Cout(c_16_46),  .A(w_15_46), .B(data_operandA[16] & data_operandB[30]), .Cin(c_16_45));
full_adder add_w_16_47(.S(w_16_47), .Cout(w_16_48),  .A(w_15_47), .B( !(data_operandA[16] & data_operandB[31])), .Cin(c_16_46));



// these are my wires that have the result of each full adder
wire w_17_49, w_17_17, w_17_18, w_17_19, w_17_20, w_17_21, w_17_22, w_17_23, w_17_24, w_17_25, w_17_26, w_17_27, w_17_28, w_17_29, w_17_30, w_17_31, w_17_32, w_17_33, w_17_34, w_17_35, w_17_36, w_17_37, w_17_38, w_17_39, w_17_40, w_17_41, w_17_42, w_17_43, w_17_44, w_17_45, w_17_46, w_17_47, w_17_48;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_17_17, c_17_18, c_17_19, c_17_20, c_17_21, c_17_22, c_17_23, c_17_24, c_17_25, c_17_26, c_17_27, c_17_28, c_17_29, c_17_30, c_17_31, c_17_32, c_17_33, c_17_34, c_17_35, c_17_36, c_17_37, c_17_38, c_17_39, c_17_40, c_17_41, c_17_42, c_17_43, c_17_44, c_17_45, c_17_46, c_17_47, c_17_48;

full_adder add_w_17_17(.S(w_17_17), .Cout(c_17_17),  .A(w_16_17), .B(data_operandA[17] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_17_18(.S(w_17_18), .Cout(c_17_18),  .A(w_16_18), .B(data_operandA[17] & data_operandB[1]), .Cin(c_17_17));
full_adder add_w_17_19(.S(w_17_19), .Cout(c_17_19),  .A(w_16_19), .B(data_operandA[17] & data_operandB[2]), .Cin(c_17_18));
full_adder add_w_17_20(.S(w_17_20), .Cout(c_17_20),  .A(w_16_20), .B(data_operandA[17] & data_operandB[3]), .Cin(c_17_19));
full_adder add_w_17_21(.S(w_17_21), .Cout(c_17_21),  .A(w_16_21), .B(data_operandA[17] & data_operandB[4]), .Cin(c_17_20));
full_adder add_w_17_22(.S(w_17_22), .Cout(c_17_22),  .A(w_16_22), .B(data_operandA[17] & data_operandB[5]), .Cin(c_17_21));
full_adder add_w_17_23(.S(w_17_23), .Cout(c_17_23),  .A(w_16_23), .B(data_operandA[17] & data_operandB[6]), .Cin(c_17_22));
full_adder add_w_17_24(.S(w_17_24), .Cout(c_17_24),  .A(w_16_24), .B(data_operandA[17] & data_operandB[7]), .Cin(c_17_23));
full_adder add_w_17_25(.S(w_17_25), .Cout(c_17_25),  .A(w_16_25), .B(data_operandA[17] & data_operandB[8]), .Cin(c_17_24));
full_adder add_w_17_26(.S(w_17_26), .Cout(c_17_26),  .A(w_16_26), .B(data_operandA[17] & data_operandB[9]), .Cin(c_17_25));
full_adder add_w_17_27(.S(w_17_27), .Cout(c_17_27),  .A(w_16_27), .B(data_operandA[17] & data_operandB[10]), .Cin(c_17_26));
full_adder add_w_17_28(.S(w_17_28), .Cout(c_17_28),  .A(w_16_28), .B(data_operandA[17] & data_operandB[11]), .Cin(c_17_27));
full_adder add_w_17_29(.S(w_17_29), .Cout(c_17_29),  .A(w_16_29), .B(data_operandA[17] & data_operandB[12]), .Cin(c_17_28));
full_adder add_w_17_30(.S(w_17_30), .Cout(c_17_30),  .A(w_16_30), .B(data_operandA[17] & data_operandB[13]), .Cin(c_17_29));
full_adder add_w_17_31(.S(w_17_31), .Cout(c_17_31),  .A(w_16_31), .B(data_operandA[17] & data_operandB[14]), .Cin(c_17_30));
full_adder add_w_17_32(.S(w_17_32), .Cout(c_17_32),  .A(w_16_32), .B(data_operandA[17] & data_operandB[15]), .Cin(c_17_31));
full_adder add_w_17_33(.S(w_17_33), .Cout(c_17_33),  .A(w_16_33), .B(data_operandA[17] & data_operandB[16]), .Cin(c_17_32));
full_adder add_w_17_34(.S(w_17_34), .Cout(c_17_34),  .A(w_16_34), .B(data_operandA[17] & data_operandB[17]), .Cin(c_17_33));
full_adder add_w_17_35(.S(w_17_35), .Cout(c_17_35),  .A(w_16_35), .B(data_operandA[17] & data_operandB[18]), .Cin(c_17_34));
full_adder add_w_17_36(.S(w_17_36), .Cout(c_17_36),  .A(w_16_36), .B(data_operandA[17] & data_operandB[19]), .Cin(c_17_35));
full_adder add_w_17_37(.S(w_17_37), .Cout(c_17_37),  .A(w_16_37), .B(data_operandA[17] & data_operandB[20]), .Cin(c_17_36));
full_adder add_w_17_38(.S(w_17_38), .Cout(c_17_38),  .A(w_16_38), .B(data_operandA[17] & data_operandB[21]), .Cin(c_17_37));
full_adder add_w_17_39(.S(w_17_39), .Cout(c_17_39),  .A(w_16_39), .B(data_operandA[17] & data_operandB[22]), .Cin(c_17_38));
full_adder add_w_17_40(.S(w_17_40), .Cout(c_17_40),  .A(w_16_40), .B(data_operandA[17] & data_operandB[23]), .Cin(c_17_39));
full_adder add_w_17_41(.S(w_17_41), .Cout(c_17_41),  .A(w_16_41), .B(data_operandA[17] & data_operandB[24]), .Cin(c_17_40));
full_adder add_w_17_42(.S(w_17_42), .Cout(c_17_42),  .A(w_16_42), .B(data_operandA[17] & data_operandB[25]), .Cin(c_17_41));
full_adder add_w_17_43(.S(w_17_43), .Cout(c_17_43),  .A(w_16_43), .B(data_operandA[17] & data_operandB[26]), .Cin(c_17_42));
full_adder add_w_17_44(.S(w_17_44), .Cout(c_17_44),  .A(w_16_44), .B(data_operandA[17] & data_operandB[27]), .Cin(c_17_43));
full_adder add_w_17_45(.S(w_17_45), .Cout(c_17_45),  .A(w_16_45), .B(data_operandA[17] & data_operandB[28]), .Cin(c_17_44));
full_adder add_w_17_46(.S(w_17_46), .Cout(c_17_46),  .A(w_16_46), .B(data_operandA[17] & data_operandB[29]), .Cin(c_17_45));
full_adder add_w_17_47(.S(w_17_47), .Cout(c_17_47),  .A(w_16_47), .B(data_operandA[17] & data_operandB[30]), .Cin(c_17_46));
full_adder add_w_17_48(.S(w_17_48), .Cout(w_17_49),  .A(w_16_48), .B( !(data_operandA[17] & data_operandB[31])), .Cin(c_17_47));



// these are my wires that have the result of each full adder
wire w_18_50, w_18_18, w_18_19, w_18_20, w_18_21, w_18_22, w_18_23, w_18_24, w_18_25, w_18_26, w_18_27, w_18_28, w_18_29, w_18_30, w_18_31, w_18_32, w_18_33, w_18_34, w_18_35, w_18_36, w_18_37, w_18_38, w_18_39, w_18_40, w_18_41, w_18_42, w_18_43, w_18_44, w_18_45, w_18_46, w_18_47, w_18_48, w_18_49;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_18_18, c_18_19, c_18_20, c_18_21, c_18_22, c_18_23, c_18_24, c_18_25, c_18_26, c_18_27, c_18_28, c_18_29, c_18_30, c_18_31, c_18_32, c_18_33, c_18_34, c_18_35, c_18_36, c_18_37, c_18_38, c_18_39, c_18_40, c_18_41, c_18_42, c_18_43, c_18_44, c_18_45, c_18_46, c_18_47, c_18_48, c_18_49;

full_adder add_w_18_18(.S(w_18_18), .Cout(c_18_18),  .A(w_17_18), .B(data_operandA[18] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_18_19(.S(w_18_19), .Cout(c_18_19),  .A(w_17_19), .B(data_operandA[18] & data_operandB[1]), .Cin(c_18_18));
full_adder add_w_18_20(.S(w_18_20), .Cout(c_18_20),  .A(w_17_20), .B(data_operandA[18] & data_operandB[2]), .Cin(c_18_19));
full_adder add_w_18_21(.S(w_18_21), .Cout(c_18_21),  .A(w_17_21), .B(data_operandA[18] & data_operandB[3]), .Cin(c_18_20));
full_adder add_w_18_22(.S(w_18_22), .Cout(c_18_22),  .A(w_17_22), .B(data_operandA[18] & data_operandB[4]), .Cin(c_18_21));
full_adder add_w_18_23(.S(w_18_23), .Cout(c_18_23),  .A(w_17_23), .B(data_operandA[18] & data_operandB[5]), .Cin(c_18_22));
full_adder add_w_18_24(.S(w_18_24), .Cout(c_18_24),  .A(w_17_24), .B(data_operandA[18] & data_operandB[6]), .Cin(c_18_23));
full_adder add_w_18_25(.S(w_18_25), .Cout(c_18_25),  .A(w_17_25), .B(data_operandA[18] & data_operandB[7]), .Cin(c_18_24));
full_adder add_w_18_26(.S(w_18_26), .Cout(c_18_26),  .A(w_17_26), .B(data_operandA[18] & data_operandB[8]), .Cin(c_18_25));
full_adder add_w_18_27(.S(w_18_27), .Cout(c_18_27),  .A(w_17_27), .B(data_operandA[18] & data_operandB[9]), .Cin(c_18_26));
full_adder add_w_18_28(.S(w_18_28), .Cout(c_18_28),  .A(w_17_28), .B(data_operandA[18] & data_operandB[10]), .Cin(c_18_27));
full_adder add_w_18_29(.S(w_18_29), .Cout(c_18_29),  .A(w_17_29), .B(data_operandA[18] & data_operandB[11]), .Cin(c_18_28));
full_adder add_w_18_30(.S(w_18_30), .Cout(c_18_30),  .A(w_17_30), .B(data_operandA[18] & data_operandB[12]), .Cin(c_18_29));
full_adder add_w_18_31(.S(w_18_31), .Cout(c_18_31),  .A(w_17_31), .B(data_operandA[18] & data_operandB[13]), .Cin(c_18_30));
full_adder add_w_18_32(.S(w_18_32), .Cout(c_18_32),  .A(w_17_32), .B(data_operandA[18] & data_operandB[14]), .Cin(c_18_31));
full_adder add_w_18_33(.S(w_18_33), .Cout(c_18_33),  .A(w_17_33), .B(data_operandA[18] & data_operandB[15]), .Cin(c_18_32));
full_adder add_w_18_34(.S(w_18_34), .Cout(c_18_34),  .A(w_17_34), .B(data_operandA[18] & data_operandB[16]), .Cin(c_18_33));
full_adder add_w_18_35(.S(w_18_35), .Cout(c_18_35),  .A(w_17_35), .B(data_operandA[18] & data_operandB[17]), .Cin(c_18_34));
full_adder add_w_18_36(.S(w_18_36), .Cout(c_18_36),  .A(w_17_36), .B(data_operandA[18] & data_operandB[18]), .Cin(c_18_35));
full_adder add_w_18_37(.S(w_18_37), .Cout(c_18_37),  .A(w_17_37), .B(data_operandA[18] & data_operandB[19]), .Cin(c_18_36));
full_adder add_w_18_38(.S(w_18_38), .Cout(c_18_38),  .A(w_17_38), .B(data_operandA[18] & data_operandB[20]), .Cin(c_18_37));
full_adder add_w_18_39(.S(w_18_39), .Cout(c_18_39),  .A(w_17_39), .B(data_operandA[18] & data_operandB[21]), .Cin(c_18_38));
full_adder add_w_18_40(.S(w_18_40), .Cout(c_18_40),  .A(w_17_40), .B(data_operandA[18] & data_operandB[22]), .Cin(c_18_39));
full_adder add_w_18_41(.S(w_18_41), .Cout(c_18_41),  .A(w_17_41), .B(data_operandA[18] & data_operandB[23]), .Cin(c_18_40));
full_adder add_w_18_42(.S(w_18_42), .Cout(c_18_42),  .A(w_17_42), .B(data_operandA[18] & data_operandB[24]), .Cin(c_18_41));
full_adder add_w_18_43(.S(w_18_43), .Cout(c_18_43),  .A(w_17_43), .B(data_operandA[18] & data_operandB[25]), .Cin(c_18_42));
full_adder add_w_18_44(.S(w_18_44), .Cout(c_18_44),  .A(w_17_44), .B(data_operandA[18] & data_operandB[26]), .Cin(c_18_43));
full_adder add_w_18_45(.S(w_18_45), .Cout(c_18_45),  .A(w_17_45), .B(data_operandA[18] & data_operandB[27]), .Cin(c_18_44));
full_adder add_w_18_46(.S(w_18_46), .Cout(c_18_46),  .A(w_17_46), .B(data_operandA[18] & data_operandB[28]), .Cin(c_18_45));
full_adder add_w_18_47(.S(w_18_47), .Cout(c_18_47),  .A(w_17_47), .B(data_operandA[18] & data_operandB[29]), .Cin(c_18_46));
full_adder add_w_18_48(.S(w_18_48), .Cout(c_18_48),  .A(w_17_48), .B(data_operandA[18] & data_operandB[30]), .Cin(c_18_47));
full_adder add_w_18_49(.S(w_18_49), .Cout(w_18_50),  .A(w_17_49), .B( !(data_operandA[18] & data_operandB[31])), .Cin(c_18_48));



// these are my wires that have the result of each full adder
wire w_19_51, w_19_19, w_19_20, w_19_21, w_19_22, w_19_23, w_19_24, w_19_25, w_19_26, w_19_27, w_19_28, w_19_29, w_19_30, w_19_31, w_19_32, w_19_33, w_19_34, w_19_35, w_19_36, w_19_37, w_19_38, w_19_39, w_19_40, w_19_41, w_19_42, w_19_43, w_19_44, w_19_45, w_19_46, w_19_47, w_19_48, w_19_49, w_19_50;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_19_19, c_19_20, c_19_21, c_19_22, c_19_23, c_19_24, c_19_25, c_19_26, c_19_27, c_19_28, c_19_29, c_19_30, c_19_31, c_19_32, c_19_33, c_19_34, c_19_35, c_19_36, c_19_37, c_19_38, c_19_39, c_19_40, c_19_41, c_19_42, c_19_43, c_19_44, c_19_45, c_19_46, c_19_47, c_19_48, c_19_49, c_19_50;

full_adder add_w_19_19(.S(w_19_19), .Cout(c_19_19),  .A(w_18_19), .B(data_operandA[19] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_19_20(.S(w_19_20), .Cout(c_19_20),  .A(w_18_20), .B(data_operandA[19] & data_operandB[1]), .Cin(c_19_19));
full_adder add_w_19_21(.S(w_19_21), .Cout(c_19_21),  .A(w_18_21), .B(data_operandA[19] & data_operandB[2]), .Cin(c_19_20));
full_adder add_w_19_22(.S(w_19_22), .Cout(c_19_22),  .A(w_18_22), .B(data_operandA[19] & data_operandB[3]), .Cin(c_19_21));
full_adder add_w_19_23(.S(w_19_23), .Cout(c_19_23),  .A(w_18_23), .B(data_operandA[19] & data_operandB[4]), .Cin(c_19_22));
full_adder add_w_19_24(.S(w_19_24), .Cout(c_19_24),  .A(w_18_24), .B(data_operandA[19] & data_operandB[5]), .Cin(c_19_23));
full_adder add_w_19_25(.S(w_19_25), .Cout(c_19_25),  .A(w_18_25), .B(data_operandA[19] & data_operandB[6]), .Cin(c_19_24));
full_adder add_w_19_26(.S(w_19_26), .Cout(c_19_26),  .A(w_18_26), .B(data_operandA[19] & data_operandB[7]), .Cin(c_19_25));
full_adder add_w_19_27(.S(w_19_27), .Cout(c_19_27),  .A(w_18_27), .B(data_operandA[19] & data_operandB[8]), .Cin(c_19_26));
full_adder add_w_19_28(.S(w_19_28), .Cout(c_19_28),  .A(w_18_28), .B(data_operandA[19] & data_operandB[9]), .Cin(c_19_27));
full_adder add_w_19_29(.S(w_19_29), .Cout(c_19_29),  .A(w_18_29), .B(data_operandA[19] & data_operandB[10]), .Cin(c_19_28));
full_adder add_w_19_30(.S(w_19_30), .Cout(c_19_30),  .A(w_18_30), .B(data_operandA[19] & data_operandB[11]), .Cin(c_19_29));
full_adder add_w_19_31(.S(w_19_31), .Cout(c_19_31),  .A(w_18_31), .B(data_operandA[19] & data_operandB[12]), .Cin(c_19_30));
full_adder add_w_19_32(.S(w_19_32), .Cout(c_19_32),  .A(w_18_32), .B(data_operandA[19] & data_operandB[13]), .Cin(c_19_31));
full_adder add_w_19_33(.S(w_19_33), .Cout(c_19_33),  .A(w_18_33), .B(data_operandA[19] & data_operandB[14]), .Cin(c_19_32));
full_adder add_w_19_34(.S(w_19_34), .Cout(c_19_34),  .A(w_18_34), .B(data_operandA[19] & data_operandB[15]), .Cin(c_19_33));
full_adder add_w_19_35(.S(w_19_35), .Cout(c_19_35),  .A(w_18_35), .B(data_operandA[19] & data_operandB[16]), .Cin(c_19_34));
full_adder add_w_19_36(.S(w_19_36), .Cout(c_19_36),  .A(w_18_36), .B(data_operandA[19] & data_operandB[17]), .Cin(c_19_35));
full_adder add_w_19_37(.S(w_19_37), .Cout(c_19_37),  .A(w_18_37), .B(data_operandA[19] & data_operandB[18]), .Cin(c_19_36));
full_adder add_w_19_38(.S(w_19_38), .Cout(c_19_38),  .A(w_18_38), .B(data_operandA[19] & data_operandB[19]), .Cin(c_19_37));
full_adder add_w_19_39(.S(w_19_39), .Cout(c_19_39),  .A(w_18_39), .B(data_operandA[19] & data_operandB[20]), .Cin(c_19_38));
full_adder add_w_19_40(.S(w_19_40), .Cout(c_19_40),  .A(w_18_40), .B(data_operandA[19] & data_operandB[21]), .Cin(c_19_39));
full_adder add_w_19_41(.S(w_19_41), .Cout(c_19_41),  .A(w_18_41), .B(data_operandA[19] & data_operandB[22]), .Cin(c_19_40));
full_adder add_w_19_42(.S(w_19_42), .Cout(c_19_42),  .A(w_18_42), .B(data_operandA[19] & data_operandB[23]), .Cin(c_19_41));
full_adder add_w_19_43(.S(w_19_43), .Cout(c_19_43),  .A(w_18_43), .B(data_operandA[19] & data_operandB[24]), .Cin(c_19_42));
full_adder add_w_19_44(.S(w_19_44), .Cout(c_19_44),  .A(w_18_44), .B(data_operandA[19] & data_operandB[25]), .Cin(c_19_43));
full_adder add_w_19_45(.S(w_19_45), .Cout(c_19_45),  .A(w_18_45), .B(data_operandA[19] & data_operandB[26]), .Cin(c_19_44));
full_adder add_w_19_46(.S(w_19_46), .Cout(c_19_46),  .A(w_18_46), .B(data_operandA[19] & data_operandB[27]), .Cin(c_19_45));
full_adder add_w_19_47(.S(w_19_47), .Cout(c_19_47),  .A(w_18_47), .B(data_operandA[19] & data_operandB[28]), .Cin(c_19_46));
full_adder add_w_19_48(.S(w_19_48), .Cout(c_19_48),  .A(w_18_48), .B(data_operandA[19] & data_operandB[29]), .Cin(c_19_47));
full_adder add_w_19_49(.S(w_19_49), .Cout(c_19_49),  .A(w_18_49), .B(data_operandA[19] & data_operandB[30]), .Cin(c_19_48));
full_adder add_w_19_50(.S(w_19_50), .Cout(w_19_51),  .A(w_18_50), .B( !(data_operandA[19] & data_operandB[31])), .Cin(c_19_49));



// these are my wires that have the result of each full adder
wire w_20_52, w_20_20, w_20_21, w_20_22, w_20_23, w_20_24, w_20_25, w_20_26, w_20_27, w_20_28, w_20_29, w_20_30, w_20_31, w_20_32, w_20_33, w_20_34, w_20_35, w_20_36, w_20_37, w_20_38, w_20_39, w_20_40, w_20_41, w_20_42, w_20_43, w_20_44, w_20_45, w_20_46, w_20_47, w_20_48, w_20_49, w_20_50, w_20_51;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_20_20, c_20_21, c_20_22, c_20_23, c_20_24, c_20_25, c_20_26, c_20_27, c_20_28, c_20_29, c_20_30, c_20_31, c_20_32, c_20_33, c_20_34, c_20_35, c_20_36, c_20_37, c_20_38, c_20_39, c_20_40, c_20_41, c_20_42, c_20_43, c_20_44, c_20_45, c_20_46, c_20_47, c_20_48, c_20_49, c_20_50, c_20_51;

full_adder add_w_20_20(.S(w_20_20), .Cout(c_20_20),  .A(w_19_20), .B(data_operandA[20] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_20_21(.S(w_20_21), .Cout(c_20_21),  .A(w_19_21), .B(data_operandA[20] & data_operandB[1]), .Cin(c_20_20));
full_adder add_w_20_22(.S(w_20_22), .Cout(c_20_22),  .A(w_19_22), .B(data_operandA[20] & data_operandB[2]), .Cin(c_20_21));
full_adder add_w_20_23(.S(w_20_23), .Cout(c_20_23),  .A(w_19_23), .B(data_operandA[20] & data_operandB[3]), .Cin(c_20_22));
full_adder add_w_20_24(.S(w_20_24), .Cout(c_20_24),  .A(w_19_24), .B(data_operandA[20] & data_operandB[4]), .Cin(c_20_23));
full_adder add_w_20_25(.S(w_20_25), .Cout(c_20_25),  .A(w_19_25), .B(data_operandA[20] & data_operandB[5]), .Cin(c_20_24));
full_adder add_w_20_26(.S(w_20_26), .Cout(c_20_26),  .A(w_19_26), .B(data_operandA[20] & data_operandB[6]), .Cin(c_20_25));
full_adder add_w_20_27(.S(w_20_27), .Cout(c_20_27),  .A(w_19_27), .B(data_operandA[20] & data_operandB[7]), .Cin(c_20_26));
full_adder add_w_20_28(.S(w_20_28), .Cout(c_20_28),  .A(w_19_28), .B(data_operandA[20] & data_operandB[8]), .Cin(c_20_27));
full_adder add_w_20_29(.S(w_20_29), .Cout(c_20_29),  .A(w_19_29), .B(data_operandA[20] & data_operandB[9]), .Cin(c_20_28));
full_adder add_w_20_30(.S(w_20_30), .Cout(c_20_30),  .A(w_19_30), .B(data_operandA[20] & data_operandB[10]), .Cin(c_20_29));
full_adder add_w_20_31(.S(w_20_31), .Cout(c_20_31),  .A(w_19_31), .B(data_operandA[20] & data_operandB[11]), .Cin(c_20_30));
full_adder add_w_20_32(.S(w_20_32), .Cout(c_20_32),  .A(w_19_32), .B(data_operandA[20] & data_operandB[12]), .Cin(c_20_31));
full_adder add_w_20_33(.S(w_20_33), .Cout(c_20_33),  .A(w_19_33), .B(data_operandA[20] & data_operandB[13]), .Cin(c_20_32));
full_adder add_w_20_34(.S(w_20_34), .Cout(c_20_34),  .A(w_19_34), .B(data_operandA[20] & data_operandB[14]), .Cin(c_20_33));
full_adder add_w_20_35(.S(w_20_35), .Cout(c_20_35),  .A(w_19_35), .B(data_operandA[20] & data_operandB[15]), .Cin(c_20_34));
full_adder add_w_20_36(.S(w_20_36), .Cout(c_20_36),  .A(w_19_36), .B(data_operandA[20] & data_operandB[16]), .Cin(c_20_35));
full_adder add_w_20_37(.S(w_20_37), .Cout(c_20_37),  .A(w_19_37), .B(data_operandA[20] & data_operandB[17]), .Cin(c_20_36));
full_adder add_w_20_38(.S(w_20_38), .Cout(c_20_38),  .A(w_19_38), .B(data_operandA[20] & data_operandB[18]), .Cin(c_20_37));
full_adder add_w_20_39(.S(w_20_39), .Cout(c_20_39),  .A(w_19_39), .B(data_operandA[20] & data_operandB[19]), .Cin(c_20_38));
full_adder add_w_20_40(.S(w_20_40), .Cout(c_20_40),  .A(w_19_40), .B(data_operandA[20] & data_operandB[20]), .Cin(c_20_39));
full_adder add_w_20_41(.S(w_20_41), .Cout(c_20_41),  .A(w_19_41), .B(data_operandA[20] & data_operandB[21]), .Cin(c_20_40));
full_adder add_w_20_42(.S(w_20_42), .Cout(c_20_42),  .A(w_19_42), .B(data_operandA[20] & data_operandB[22]), .Cin(c_20_41));
full_adder add_w_20_43(.S(w_20_43), .Cout(c_20_43),  .A(w_19_43), .B(data_operandA[20] & data_operandB[23]), .Cin(c_20_42));
full_adder add_w_20_44(.S(w_20_44), .Cout(c_20_44),  .A(w_19_44), .B(data_operandA[20] & data_operandB[24]), .Cin(c_20_43));
full_adder add_w_20_45(.S(w_20_45), .Cout(c_20_45),  .A(w_19_45), .B(data_operandA[20] & data_operandB[25]), .Cin(c_20_44));
full_adder add_w_20_46(.S(w_20_46), .Cout(c_20_46),  .A(w_19_46), .B(data_operandA[20] & data_operandB[26]), .Cin(c_20_45));
full_adder add_w_20_47(.S(w_20_47), .Cout(c_20_47),  .A(w_19_47), .B(data_operandA[20] & data_operandB[27]), .Cin(c_20_46));
full_adder add_w_20_48(.S(w_20_48), .Cout(c_20_48),  .A(w_19_48), .B(data_operandA[20] & data_operandB[28]), .Cin(c_20_47));
full_adder add_w_20_49(.S(w_20_49), .Cout(c_20_49),  .A(w_19_49), .B(data_operandA[20] & data_operandB[29]), .Cin(c_20_48));
full_adder add_w_20_50(.S(w_20_50), .Cout(c_20_50),  .A(w_19_50), .B(data_operandA[20] & data_operandB[30]), .Cin(c_20_49));
full_adder add_w_20_51(.S(w_20_51), .Cout(w_20_52),  .A(w_19_51), .B( !(data_operandA[20] & data_operandB[31])), .Cin(c_20_50));



// these are my wires that have the result of each full adder
wire w_21_53, w_21_21, w_21_22, w_21_23, w_21_24, w_21_25, w_21_26, w_21_27, w_21_28, w_21_29, w_21_30, w_21_31, w_21_32, w_21_33, w_21_34, w_21_35, w_21_36, w_21_37, w_21_38, w_21_39, w_21_40, w_21_41, w_21_42, w_21_43, w_21_44, w_21_45, w_21_46, w_21_47, w_21_48, w_21_49, w_21_50, w_21_51, w_21_52;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_21_21, c_21_22, c_21_23, c_21_24, c_21_25, c_21_26, c_21_27, c_21_28, c_21_29, c_21_30, c_21_31, c_21_32, c_21_33, c_21_34, c_21_35, c_21_36, c_21_37, c_21_38, c_21_39, c_21_40, c_21_41, c_21_42, c_21_43, c_21_44, c_21_45, c_21_46, c_21_47, c_21_48, c_21_49, c_21_50, c_21_51, c_21_52;

full_adder add_w_21_21(.S(w_21_21), .Cout(c_21_21),  .A(w_20_21), .B(data_operandA[21] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_21_22(.S(w_21_22), .Cout(c_21_22),  .A(w_20_22), .B(data_operandA[21] & data_operandB[1]), .Cin(c_21_21));
full_adder add_w_21_23(.S(w_21_23), .Cout(c_21_23),  .A(w_20_23), .B(data_operandA[21] & data_operandB[2]), .Cin(c_21_22));
full_adder add_w_21_24(.S(w_21_24), .Cout(c_21_24),  .A(w_20_24), .B(data_operandA[21] & data_operandB[3]), .Cin(c_21_23));
full_adder add_w_21_25(.S(w_21_25), .Cout(c_21_25),  .A(w_20_25), .B(data_operandA[21] & data_operandB[4]), .Cin(c_21_24));
full_adder add_w_21_26(.S(w_21_26), .Cout(c_21_26),  .A(w_20_26), .B(data_operandA[21] & data_operandB[5]), .Cin(c_21_25));
full_adder add_w_21_27(.S(w_21_27), .Cout(c_21_27),  .A(w_20_27), .B(data_operandA[21] & data_operandB[6]), .Cin(c_21_26));
full_adder add_w_21_28(.S(w_21_28), .Cout(c_21_28),  .A(w_20_28), .B(data_operandA[21] & data_operandB[7]), .Cin(c_21_27));
full_adder add_w_21_29(.S(w_21_29), .Cout(c_21_29),  .A(w_20_29), .B(data_operandA[21] & data_operandB[8]), .Cin(c_21_28));
full_adder add_w_21_30(.S(w_21_30), .Cout(c_21_30),  .A(w_20_30), .B(data_operandA[21] & data_operandB[9]), .Cin(c_21_29));
full_adder add_w_21_31(.S(w_21_31), .Cout(c_21_31),  .A(w_20_31), .B(data_operandA[21] & data_operandB[10]), .Cin(c_21_30));
full_adder add_w_21_32(.S(w_21_32), .Cout(c_21_32),  .A(w_20_32), .B(data_operandA[21] & data_operandB[11]), .Cin(c_21_31));
full_adder add_w_21_33(.S(w_21_33), .Cout(c_21_33),  .A(w_20_33), .B(data_operandA[21] & data_operandB[12]), .Cin(c_21_32));
full_adder add_w_21_34(.S(w_21_34), .Cout(c_21_34),  .A(w_20_34), .B(data_operandA[21] & data_operandB[13]), .Cin(c_21_33));
full_adder add_w_21_35(.S(w_21_35), .Cout(c_21_35),  .A(w_20_35), .B(data_operandA[21] & data_operandB[14]), .Cin(c_21_34));
full_adder add_w_21_36(.S(w_21_36), .Cout(c_21_36),  .A(w_20_36), .B(data_operandA[21] & data_operandB[15]), .Cin(c_21_35));
full_adder add_w_21_37(.S(w_21_37), .Cout(c_21_37),  .A(w_20_37), .B(data_operandA[21] & data_operandB[16]), .Cin(c_21_36));
full_adder add_w_21_38(.S(w_21_38), .Cout(c_21_38),  .A(w_20_38), .B(data_operandA[21] & data_operandB[17]), .Cin(c_21_37));
full_adder add_w_21_39(.S(w_21_39), .Cout(c_21_39),  .A(w_20_39), .B(data_operandA[21] & data_operandB[18]), .Cin(c_21_38));
full_adder add_w_21_40(.S(w_21_40), .Cout(c_21_40),  .A(w_20_40), .B(data_operandA[21] & data_operandB[19]), .Cin(c_21_39));
full_adder add_w_21_41(.S(w_21_41), .Cout(c_21_41),  .A(w_20_41), .B(data_operandA[21] & data_operandB[20]), .Cin(c_21_40));
full_adder add_w_21_42(.S(w_21_42), .Cout(c_21_42),  .A(w_20_42), .B(data_operandA[21] & data_operandB[21]), .Cin(c_21_41));
full_adder add_w_21_43(.S(w_21_43), .Cout(c_21_43),  .A(w_20_43), .B(data_operandA[21] & data_operandB[22]), .Cin(c_21_42));
full_adder add_w_21_44(.S(w_21_44), .Cout(c_21_44),  .A(w_20_44), .B(data_operandA[21] & data_operandB[23]), .Cin(c_21_43));
full_adder add_w_21_45(.S(w_21_45), .Cout(c_21_45),  .A(w_20_45), .B(data_operandA[21] & data_operandB[24]), .Cin(c_21_44));
full_adder add_w_21_46(.S(w_21_46), .Cout(c_21_46),  .A(w_20_46), .B(data_operandA[21] & data_operandB[25]), .Cin(c_21_45));
full_adder add_w_21_47(.S(w_21_47), .Cout(c_21_47),  .A(w_20_47), .B(data_operandA[21] & data_operandB[26]), .Cin(c_21_46));
full_adder add_w_21_48(.S(w_21_48), .Cout(c_21_48),  .A(w_20_48), .B(data_operandA[21] & data_operandB[27]), .Cin(c_21_47));
full_adder add_w_21_49(.S(w_21_49), .Cout(c_21_49),  .A(w_20_49), .B(data_operandA[21] & data_operandB[28]), .Cin(c_21_48));
full_adder add_w_21_50(.S(w_21_50), .Cout(c_21_50),  .A(w_20_50), .B(data_operandA[21] & data_operandB[29]), .Cin(c_21_49));
full_adder add_w_21_51(.S(w_21_51), .Cout(c_21_51),  .A(w_20_51), .B(data_operandA[21] & data_operandB[30]), .Cin(c_21_50));
full_adder add_w_21_52(.S(w_21_52), .Cout(w_21_53),  .A(w_20_52), .B( !(data_operandA[21] & data_operandB[31])), .Cin(c_21_51));



// these are my wires that have the result of each full adder
wire w_22_54, w_22_22, w_22_23, w_22_24, w_22_25, w_22_26, w_22_27, w_22_28, w_22_29, w_22_30, w_22_31, w_22_32, w_22_33, w_22_34, w_22_35, w_22_36, w_22_37, w_22_38, w_22_39, w_22_40, w_22_41, w_22_42, w_22_43, w_22_44, w_22_45, w_22_46, w_22_47, w_22_48, w_22_49, w_22_50, w_22_51, w_22_52, w_22_53;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_22_22, c_22_23, c_22_24, c_22_25, c_22_26, c_22_27, c_22_28, c_22_29, c_22_30, c_22_31, c_22_32, c_22_33, c_22_34, c_22_35, c_22_36, c_22_37, c_22_38, c_22_39, c_22_40, c_22_41, c_22_42, c_22_43, c_22_44, c_22_45, c_22_46, c_22_47, c_22_48, c_22_49, c_22_50, c_22_51, c_22_52, c_22_53;

full_adder add_w_22_22(.S(w_22_22), .Cout(c_22_22),  .A(w_21_22), .B(data_operandA[22] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_22_23(.S(w_22_23), .Cout(c_22_23),  .A(w_21_23), .B(data_operandA[22] & data_operandB[1]), .Cin(c_22_22));
full_adder add_w_22_24(.S(w_22_24), .Cout(c_22_24),  .A(w_21_24), .B(data_operandA[22] & data_operandB[2]), .Cin(c_22_23));
full_adder add_w_22_25(.S(w_22_25), .Cout(c_22_25),  .A(w_21_25), .B(data_operandA[22] & data_operandB[3]), .Cin(c_22_24));
full_adder add_w_22_26(.S(w_22_26), .Cout(c_22_26),  .A(w_21_26), .B(data_operandA[22] & data_operandB[4]), .Cin(c_22_25));
full_adder add_w_22_27(.S(w_22_27), .Cout(c_22_27),  .A(w_21_27), .B(data_operandA[22] & data_operandB[5]), .Cin(c_22_26));
full_adder add_w_22_28(.S(w_22_28), .Cout(c_22_28),  .A(w_21_28), .B(data_operandA[22] & data_operandB[6]), .Cin(c_22_27));
full_adder add_w_22_29(.S(w_22_29), .Cout(c_22_29),  .A(w_21_29), .B(data_operandA[22] & data_operandB[7]), .Cin(c_22_28));
full_adder add_w_22_30(.S(w_22_30), .Cout(c_22_30),  .A(w_21_30), .B(data_operandA[22] & data_operandB[8]), .Cin(c_22_29));
full_adder add_w_22_31(.S(w_22_31), .Cout(c_22_31),  .A(w_21_31), .B(data_operandA[22] & data_operandB[9]), .Cin(c_22_30));
full_adder add_w_22_32(.S(w_22_32), .Cout(c_22_32),  .A(w_21_32), .B(data_operandA[22] & data_operandB[10]), .Cin(c_22_31));
full_adder add_w_22_33(.S(w_22_33), .Cout(c_22_33),  .A(w_21_33), .B(data_operandA[22] & data_operandB[11]), .Cin(c_22_32));
full_adder add_w_22_34(.S(w_22_34), .Cout(c_22_34),  .A(w_21_34), .B(data_operandA[22] & data_operandB[12]), .Cin(c_22_33));
full_adder add_w_22_35(.S(w_22_35), .Cout(c_22_35),  .A(w_21_35), .B(data_operandA[22] & data_operandB[13]), .Cin(c_22_34));
full_adder add_w_22_36(.S(w_22_36), .Cout(c_22_36),  .A(w_21_36), .B(data_operandA[22] & data_operandB[14]), .Cin(c_22_35));
full_adder add_w_22_37(.S(w_22_37), .Cout(c_22_37),  .A(w_21_37), .B(data_operandA[22] & data_operandB[15]), .Cin(c_22_36));
full_adder add_w_22_38(.S(w_22_38), .Cout(c_22_38),  .A(w_21_38), .B(data_operandA[22] & data_operandB[16]), .Cin(c_22_37));
full_adder add_w_22_39(.S(w_22_39), .Cout(c_22_39),  .A(w_21_39), .B(data_operandA[22] & data_operandB[17]), .Cin(c_22_38));
full_adder add_w_22_40(.S(w_22_40), .Cout(c_22_40),  .A(w_21_40), .B(data_operandA[22] & data_operandB[18]), .Cin(c_22_39));
full_adder add_w_22_41(.S(w_22_41), .Cout(c_22_41),  .A(w_21_41), .B(data_operandA[22] & data_operandB[19]), .Cin(c_22_40));
full_adder add_w_22_42(.S(w_22_42), .Cout(c_22_42),  .A(w_21_42), .B(data_operandA[22] & data_operandB[20]), .Cin(c_22_41));
full_adder add_w_22_43(.S(w_22_43), .Cout(c_22_43),  .A(w_21_43), .B(data_operandA[22] & data_operandB[21]), .Cin(c_22_42));
full_adder add_w_22_44(.S(w_22_44), .Cout(c_22_44),  .A(w_21_44), .B(data_operandA[22] & data_operandB[22]), .Cin(c_22_43));
full_adder add_w_22_45(.S(w_22_45), .Cout(c_22_45),  .A(w_21_45), .B(data_operandA[22] & data_operandB[23]), .Cin(c_22_44));
full_adder add_w_22_46(.S(w_22_46), .Cout(c_22_46),  .A(w_21_46), .B(data_operandA[22] & data_operandB[24]), .Cin(c_22_45));
full_adder add_w_22_47(.S(w_22_47), .Cout(c_22_47),  .A(w_21_47), .B(data_operandA[22] & data_operandB[25]), .Cin(c_22_46));
full_adder add_w_22_48(.S(w_22_48), .Cout(c_22_48),  .A(w_21_48), .B(data_operandA[22] & data_operandB[26]), .Cin(c_22_47));
full_adder add_w_22_49(.S(w_22_49), .Cout(c_22_49),  .A(w_21_49), .B(data_operandA[22] & data_operandB[27]), .Cin(c_22_48));
full_adder add_w_22_50(.S(w_22_50), .Cout(c_22_50),  .A(w_21_50), .B(data_operandA[22] & data_operandB[28]), .Cin(c_22_49));
full_adder add_w_22_51(.S(w_22_51), .Cout(c_22_51),  .A(w_21_51), .B(data_operandA[22] & data_operandB[29]), .Cin(c_22_50));
full_adder add_w_22_52(.S(w_22_52), .Cout(c_22_52),  .A(w_21_52), .B(data_operandA[22] & data_operandB[30]), .Cin(c_22_51));
full_adder add_w_22_53(.S(w_22_53), .Cout(w_22_54),  .A(w_21_53), .B( !(data_operandA[22] & data_operandB[31])), .Cin(c_22_52));



// these are my wires that have the result of each full adder
wire w_23_55, w_23_23, w_23_24, w_23_25, w_23_26, w_23_27, w_23_28, w_23_29, w_23_30, w_23_31, w_23_32, w_23_33, w_23_34, w_23_35, w_23_36, w_23_37, w_23_38, w_23_39, w_23_40, w_23_41, w_23_42, w_23_43, w_23_44, w_23_45, w_23_46, w_23_47, w_23_48, w_23_49, w_23_50, w_23_51, w_23_52, w_23_53, w_23_54;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_23_23, c_23_24, c_23_25, c_23_26, c_23_27, c_23_28, c_23_29, c_23_30, c_23_31, c_23_32, c_23_33, c_23_34, c_23_35, c_23_36, c_23_37, c_23_38, c_23_39, c_23_40, c_23_41, c_23_42, c_23_43, c_23_44, c_23_45, c_23_46, c_23_47, c_23_48, c_23_49, c_23_50, c_23_51, c_23_52, c_23_53, c_23_54;

full_adder add_w_23_23(.S(w_23_23), .Cout(c_23_23),  .A(w_22_23), .B(data_operandA[23] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_23_24(.S(w_23_24), .Cout(c_23_24),  .A(w_22_24), .B(data_operandA[23] & data_operandB[1]), .Cin(c_23_23));
full_adder add_w_23_25(.S(w_23_25), .Cout(c_23_25),  .A(w_22_25), .B(data_operandA[23] & data_operandB[2]), .Cin(c_23_24));
full_adder add_w_23_26(.S(w_23_26), .Cout(c_23_26),  .A(w_22_26), .B(data_operandA[23] & data_operandB[3]), .Cin(c_23_25));
full_adder add_w_23_27(.S(w_23_27), .Cout(c_23_27),  .A(w_22_27), .B(data_operandA[23] & data_operandB[4]), .Cin(c_23_26));
full_adder add_w_23_28(.S(w_23_28), .Cout(c_23_28),  .A(w_22_28), .B(data_operandA[23] & data_operandB[5]), .Cin(c_23_27));
full_adder add_w_23_29(.S(w_23_29), .Cout(c_23_29),  .A(w_22_29), .B(data_operandA[23] & data_operandB[6]), .Cin(c_23_28));
full_adder add_w_23_30(.S(w_23_30), .Cout(c_23_30),  .A(w_22_30), .B(data_operandA[23] & data_operandB[7]), .Cin(c_23_29));
full_adder add_w_23_31(.S(w_23_31), .Cout(c_23_31),  .A(w_22_31), .B(data_operandA[23] & data_operandB[8]), .Cin(c_23_30));
full_adder add_w_23_32(.S(w_23_32), .Cout(c_23_32),  .A(w_22_32), .B(data_operandA[23] & data_operandB[9]), .Cin(c_23_31));
full_adder add_w_23_33(.S(w_23_33), .Cout(c_23_33),  .A(w_22_33), .B(data_operandA[23] & data_operandB[10]), .Cin(c_23_32));
full_adder add_w_23_34(.S(w_23_34), .Cout(c_23_34),  .A(w_22_34), .B(data_operandA[23] & data_operandB[11]), .Cin(c_23_33));
full_adder add_w_23_35(.S(w_23_35), .Cout(c_23_35),  .A(w_22_35), .B(data_operandA[23] & data_operandB[12]), .Cin(c_23_34));
full_adder add_w_23_36(.S(w_23_36), .Cout(c_23_36),  .A(w_22_36), .B(data_operandA[23] & data_operandB[13]), .Cin(c_23_35));
full_adder add_w_23_37(.S(w_23_37), .Cout(c_23_37),  .A(w_22_37), .B(data_operandA[23] & data_operandB[14]), .Cin(c_23_36));
full_adder add_w_23_38(.S(w_23_38), .Cout(c_23_38),  .A(w_22_38), .B(data_operandA[23] & data_operandB[15]), .Cin(c_23_37));
full_adder add_w_23_39(.S(w_23_39), .Cout(c_23_39),  .A(w_22_39), .B(data_operandA[23] & data_operandB[16]), .Cin(c_23_38));
full_adder add_w_23_40(.S(w_23_40), .Cout(c_23_40),  .A(w_22_40), .B(data_operandA[23] & data_operandB[17]), .Cin(c_23_39));
full_adder add_w_23_41(.S(w_23_41), .Cout(c_23_41),  .A(w_22_41), .B(data_operandA[23] & data_operandB[18]), .Cin(c_23_40));
full_adder add_w_23_42(.S(w_23_42), .Cout(c_23_42),  .A(w_22_42), .B(data_operandA[23] & data_operandB[19]), .Cin(c_23_41));
full_adder add_w_23_43(.S(w_23_43), .Cout(c_23_43),  .A(w_22_43), .B(data_operandA[23] & data_operandB[20]), .Cin(c_23_42));
full_adder add_w_23_44(.S(w_23_44), .Cout(c_23_44),  .A(w_22_44), .B(data_operandA[23] & data_operandB[21]), .Cin(c_23_43));
full_adder add_w_23_45(.S(w_23_45), .Cout(c_23_45),  .A(w_22_45), .B(data_operandA[23] & data_operandB[22]), .Cin(c_23_44));
full_adder add_w_23_46(.S(w_23_46), .Cout(c_23_46),  .A(w_22_46), .B(data_operandA[23] & data_operandB[23]), .Cin(c_23_45));
full_adder add_w_23_47(.S(w_23_47), .Cout(c_23_47),  .A(w_22_47), .B(data_operandA[23] & data_operandB[24]), .Cin(c_23_46));
full_adder add_w_23_48(.S(w_23_48), .Cout(c_23_48),  .A(w_22_48), .B(data_operandA[23] & data_operandB[25]), .Cin(c_23_47));
full_adder add_w_23_49(.S(w_23_49), .Cout(c_23_49),  .A(w_22_49), .B(data_operandA[23] & data_operandB[26]), .Cin(c_23_48));
full_adder add_w_23_50(.S(w_23_50), .Cout(c_23_50),  .A(w_22_50), .B(data_operandA[23] & data_operandB[27]), .Cin(c_23_49));
full_adder add_w_23_51(.S(w_23_51), .Cout(c_23_51),  .A(w_22_51), .B(data_operandA[23] & data_operandB[28]), .Cin(c_23_50));
full_adder add_w_23_52(.S(w_23_52), .Cout(c_23_52),  .A(w_22_52), .B(data_operandA[23] & data_operandB[29]), .Cin(c_23_51));
full_adder add_w_23_53(.S(w_23_53), .Cout(c_23_53),  .A(w_22_53), .B(data_operandA[23] & data_operandB[30]), .Cin(c_23_52));
full_adder add_w_23_54(.S(w_23_54), .Cout(w_23_55),  .A(w_22_54), .B( !(data_operandA[23] & data_operandB[31])), .Cin(c_23_53));



// these are my wires that have the result of each full adder
wire w_24_56, w_24_24, w_24_25, w_24_26, w_24_27, w_24_28, w_24_29, w_24_30, w_24_31, w_24_32, w_24_33, w_24_34, w_24_35, w_24_36, w_24_37, w_24_38, w_24_39, w_24_40, w_24_41, w_24_42, w_24_43, w_24_44, w_24_45, w_24_46, w_24_47, w_24_48, w_24_49, w_24_50, w_24_51, w_24_52, w_24_53, w_24_54, w_24_55;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_24_24, c_24_25, c_24_26, c_24_27, c_24_28, c_24_29, c_24_30, c_24_31, c_24_32, c_24_33, c_24_34, c_24_35, c_24_36, c_24_37, c_24_38, c_24_39, c_24_40, c_24_41, c_24_42, c_24_43, c_24_44, c_24_45, c_24_46, c_24_47, c_24_48, c_24_49, c_24_50, c_24_51, c_24_52, c_24_53, c_24_54, c_24_55;

full_adder add_w_24_24(.S(w_24_24), .Cout(c_24_24),  .A(w_23_24), .B(data_operandA[24] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_24_25(.S(w_24_25), .Cout(c_24_25),  .A(w_23_25), .B(data_operandA[24] & data_operandB[1]), .Cin(c_24_24));
full_adder add_w_24_26(.S(w_24_26), .Cout(c_24_26),  .A(w_23_26), .B(data_operandA[24] & data_operandB[2]), .Cin(c_24_25));
full_adder add_w_24_27(.S(w_24_27), .Cout(c_24_27),  .A(w_23_27), .B(data_operandA[24] & data_operandB[3]), .Cin(c_24_26));
full_adder add_w_24_28(.S(w_24_28), .Cout(c_24_28),  .A(w_23_28), .B(data_operandA[24] & data_operandB[4]), .Cin(c_24_27));
full_adder add_w_24_29(.S(w_24_29), .Cout(c_24_29),  .A(w_23_29), .B(data_operandA[24] & data_operandB[5]), .Cin(c_24_28));
full_adder add_w_24_30(.S(w_24_30), .Cout(c_24_30),  .A(w_23_30), .B(data_operandA[24] & data_operandB[6]), .Cin(c_24_29));
full_adder add_w_24_31(.S(w_24_31), .Cout(c_24_31),  .A(w_23_31), .B(data_operandA[24] & data_operandB[7]), .Cin(c_24_30));
full_adder add_w_24_32(.S(w_24_32), .Cout(c_24_32),  .A(w_23_32), .B(data_operandA[24] & data_operandB[8]), .Cin(c_24_31));
full_adder add_w_24_33(.S(w_24_33), .Cout(c_24_33),  .A(w_23_33), .B(data_operandA[24] & data_operandB[9]), .Cin(c_24_32));
full_adder add_w_24_34(.S(w_24_34), .Cout(c_24_34),  .A(w_23_34), .B(data_operandA[24] & data_operandB[10]), .Cin(c_24_33));
full_adder add_w_24_35(.S(w_24_35), .Cout(c_24_35),  .A(w_23_35), .B(data_operandA[24] & data_operandB[11]), .Cin(c_24_34));
full_adder add_w_24_36(.S(w_24_36), .Cout(c_24_36),  .A(w_23_36), .B(data_operandA[24] & data_operandB[12]), .Cin(c_24_35));
full_adder add_w_24_37(.S(w_24_37), .Cout(c_24_37),  .A(w_23_37), .B(data_operandA[24] & data_operandB[13]), .Cin(c_24_36));
full_adder add_w_24_38(.S(w_24_38), .Cout(c_24_38),  .A(w_23_38), .B(data_operandA[24] & data_operandB[14]), .Cin(c_24_37));
full_adder add_w_24_39(.S(w_24_39), .Cout(c_24_39),  .A(w_23_39), .B(data_operandA[24] & data_operandB[15]), .Cin(c_24_38));
full_adder add_w_24_40(.S(w_24_40), .Cout(c_24_40),  .A(w_23_40), .B(data_operandA[24] & data_operandB[16]), .Cin(c_24_39));
full_adder add_w_24_41(.S(w_24_41), .Cout(c_24_41),  .A(w_23_41), .B(data_operandA[24] & data_operandB[17]), .Cin(c_24_40));
full_adder add_w_24_42(.S(w_24_42), .Cout(c_24_42),  .A(w_23_42), .B(data_operandA[24] & data_operandB[18]), .Cin(c_24_41));
full_adder add_w_24_43(.S(w_24_43), .Cout(c_24_43),  .A(w_23_43), .B(data_operandA[24] & data_operandB[19]), .Cin(c_24_42));
full_adder add_w_24_44(.S(w_24_44), .Cout(c_24_44),  .A(w_23_44), .B(data_operandA[24] & data_operandB[20]), .Cin(c_24_43));
full_adder add_w_24_45(.S(w_24_45), .Cout(c_24_45),  .A(w_23_45), .B(data_operandA[24] & data_operandB[21]), .Cin(c_24_44));
full_adder add_w_24_46(.S(w_24_46), .Cout(c_24_46),  .A(w_23_46), .B(data_operandA[24] & data_operandB[22]), .Cin(c_24_45));
full_adder add_w_24_47(.S(w_24_47), .Cout(c_24_47),  .A(w_23_47), .B(data_operandA[24] & data_operandB[23]), .Cin(c_24_46));
full_adder add_w_24_48(.S(w_24_48), .Cout(c_24_48),  .A(w_23_48), .B(data_operandA[24] & data_operandB[24]), .Cin(c_24_47));
full_adder add_w_24_49(.S(w_24_49), .Cout(c_24_49),  .A(w_23_49), .B(data_operandA[24] & data_operandB[25]), .Cin(c_24_48));
full_adder add_w_24_50(.S(w_24_50), .Cout(c_24_50),  .A(w_23_50), .B(data_operandA[24] & data_operandB[26]), .Cin(c_24_49));
full_adder add_w_24_51(.S(w_24_51), .Cout(c_24_51),  .A(w_23_51), .B(data_operandA[24] & data_operandB[27]), .Cin(c_24_50));
full_adder add_w_24_52(.S(w_24_52), .Cout(c_24_52),  .A(w_23_52), .B(data_operandA[24] & data_operandB[28]), .Cin(c_24_51));
full_adder add_w_24_53(.S(w_24_53), .Cout(c_24_53),  .A(w_23_53), .B(data_operandA[24] & data_operandB[29]), .Cin(c_24_52));
full_adder add_w_24_54(.S(w_24_54), .Cout(c_24_54),  .A(w_23_54), .B(data_operandA[24] & data_operandB[30]), .Cin(c_24_53));
full_adder add_w_24_55(.S(w_24_55), .Cout(w_24_56),  .A(w_23_55), .B( !(data_operandA[24] & data_operandB[31])), .Cin(c_24_54));



// these are my wires that have the result of each full adder
wire w_25_57, w_25_25, w_25_26, w_25_27, w_25_28, w_25_29, w_25_30, w_25_31, w_25_32, w_25_33, w_25_34, w_25_35, w_25_36, w_25_37, w_25_38, w_25_39, w_25_40, w_25_41, w_25_42, w_25_43, w_25_44, w_25_45, w_25_46, w_25_47, w_25_48, w_25_49, w_25_50, w_25_51, w_25_52, w_25_53, w_25_54, w_25_55, w_25_56;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_25_25, c_25_26, c_25_27, c_25_28, c_25_29, c_25_30, c_25_31, c_25_32, c_25_33, c_25_34, c_25_35, c_25_36, c_25_37, c_25_38, c_25_39, c_25_40, c_25_41, c_25_42, c_25_43, c_25_44, c_25_45, c_25_46, c_25_47, c_25_48, c_25_49, c_25_50, c_25_51, c_25_52, c_25_53, c_25_54, c_25_55, c_25_56;

full_adder add_w_25_25(.S(w_25_25), .Cout(c_25_25),  .A(w_24_25), .B(data_operandA[25] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_25_26(.S(w_25_26), .Cout(c_25_26),  .A(w_24_26), .B(data_operandA[25] & data_operandB[1]), .Cin(c_25_25));
full_adder add_w_25_27(.S(w_25_27), .Cout(c_25_27),  .A(w_24_27), .B(data_operandA[25] & data_operandB[2]), .Cin(c_25_26));
full_adder add_w_25_28(.S(w_25_28), .Cout(c_25_28),  .A(w_24_28), .B(data_operandA[25] & data_operandB[3]), .Cin(c_25_27));
full_adder add_w_25_29(.S(w_25_29), .Cout(c_25_29),  .A(w_24_29), .B(data_operandA[25] & data_operandB[4]), .Cin(c_25_28));
full_adder add_w_25_30(.S(w_25_30), .Cout(c_25_30),  .A(w_24_30), .B(data_operandA[25] & data_operandB[5]), .Cin(c_25_29));
full_adder add_w_25_31(.S(w_25_31), .Cout(c_25_31),  .A(w_24_31), .B(data_operandA[25] & data_operandB[6]), .Cin(c_25_30));
full_adder add_w_25_32(.S(w_25_32), .Cout(c_25_32),  .A(w_24_32), .B(data_operandA[25] & data_operandB[7]), .Cin(c_25_31));
full_adder add_w_25_33(.S(w_25_33), .Cout(c_25_33),  .A(w_24_33), .B(data_operandA[25] & data_operandB[8]), .Cin(c_25_32));
full_adder add_w_25_34(.S(w_25_34), .Cout(c_25_34),  .A(w_24_34), .B(data_operandA[25] & data_operandB[9]), .Cin(c_25_33));
full_adder add_w_25_35(.S(w_25_35), .Cout(c_25_35),  .A(w_24_35), .B(data_operandA[25] & data_operandB[10]), .Cin(c_25_34));
full_adder add_w_25_36(.S(w_25_36), .Cout(c_25_36),  .A(w_24_36), .B(data_operandA[25] & data_operandB[11]), .Cin(c_25_35));
full_adder add_w_25_37(.S(w_25_37), .Cout(c_25_37),  .A(w_24_37), .B(data_operandA[25] & data_operandB[12]), .Cin(c_25_36));
full_adder add_w_25_38(.S(w_25_38), .Cout(c_25_38),  .A(w_24_38), .B(data_operandA[25] & data_operandB[13]), .Cin(c_25_37));
full_adder add_w_25_39(.S(w_25_39), .Cout(c_25_39),  .A(w_24_39), .B(data_operandA[25] & data_operandB[14]), .Cin(c_25_38));
full_adder add_w_25_40(.S(w_25_40), .Cout(c_25_40),  .A(w_24_40), .B(data_operandA[25] & data_operandB[15]), .Cin(c_25_39));
full_adder add_w_25_41(.S(w_25_41), .Cout(c_25_41),  .A(w_24_41), .B(data_operandA[25] & data_operandB[16]), .Cin(c_25_40));
full_adder add_w_25_42(.S(w_25_42), .Cout(c_25_42),  .A(w_24_42), .B(data_operandA[25] & data_operandB[17]), .Cin(c_25_41));
full_adder add_w_25_43(.S(w_25_43), .Cout(c_25_43),  .A(w_24_43), .B(data_operandA[25] & data_operandB[18]), .Cin(c_25_42));
full_adder add_w_25_44(.S(w_25_44), .Cout(c_25_44),  .A(w_24_44), .B(data_operandA[25] & data_operandB[19]), .Cin(c_25_43));
full_adder add_w_25_45(.S(w_25_45), .Cout(c_25_45),  .A(w_24_45), .B(data_operandA[25] & data_operandB[20]), .Cin(c_25_44));
full_adder add_w_25_46(.S(w_25_46), .Cout(c_25_46),  .A(w_24_46), .B(data_operandA[25] & data_operandB[21]), .Cin(c_25_45));
full_adder add_w_25_47(.S(w_25_47), .Cout(c_25_47),  .A(w_24_47), .B(data_operandA[25] & data_operandB[22]), .Cin(c_25_46));
full_adder add_w_25_48(.S(w_25_48), .Cout(c_25_48),  .A(w_24_48), .B(data_operandA[25] & data_operandB[23]), .Cin(c_25_47));
full_adder add_w_25_49(.S(w_25_49), .Cout(c_25_49),  .A(w_24_49), .B(data_operandA[25] & data_operandB[24]), .Cin(c_25_48));
full_adder add_w_25_50(.S(w_25_50), .Cout(c_25_50),  .A(w_24_50), .B(data_operandA[25] & data_operandB[25]), .Cin(c_25_49));
full_adder add_w_25_51(.S(w_25_51), .Cout(c_25_51),  .A(w_24_51), .B(data_operandA[25] & data_operandB[26]), .Cin(c_25_50));
full_adder add_w_25_52(.S(w_25_52), .Cout(c_25_52),  .A(w_24_52), .B(data_operandA[25] & data_operandB[27]), .Cin(c_25_51));
full_adder add_w_25_53(.S(w_25_53), .Cout(c_25_53),  .A(w_24_53), .B(data_operandA[25] & data_operandB[28]), .Cin(c_25_52));
full_adder add_w_25_54(.S(w_25_54), .Cout(c_25_54),  .A(w_24_54), .B(data_operandA[25] & data_operandB[29]), .Cin(c_25_53));
full_adder add_w_25_55(.S(w_25_55), .Cout(c_25_55),  .A(w_24_55), .B(data_operandA[25] & data_operandB[30]), .Cin(c_25_54));
full_adder add_w_25_56(.S(w_25_56), .Cout(w_25_57),  .A(w_24_56), .B( !(data_operandA[25] & data_operandB[31])), .Cin(c_25_55));



// these are my wires that have the result of each full adder
wire w_26_58, w_26_26, w_26_27, w_26_28, w_26_29, w_26_30, w_26_31, w_26_32, w_26_33, w_26_34, w_26_35, w_26_36, w_26_37, w_26_38, w_26_39, w_26_40, w_26_41, w_26_42, w_26_43, w_26_44, w_26_45, w_26_46, w_26_47, w_26_48, w_26_49, w_26_50, w_26_51, w_26_52, w_26_53, w_26_54, w_26_55, w_26_56, w_26_57;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_26_26, c_26_27, c_26_28, c_26_29, c_26_30, c_26_31, c_26_32, c_26_33, c_26_34, c_26_35, c_26_36, c_26_37, c_26_38, c_26_39, c_26_40, c_26_41, c_26_42, c_26_43, c_26_44, c_26_45, c_26_46, c_26_47, c_26_48, c_26_49, c_26_50, c_26_51, c_26_52, c_26_53, c_26_54, c_26_55, c_26_56, c_26_57;

full_adder add_w_26_26(.S(w_26_26), .Cout(c_26_26),  .A(w_25_26), .B(data_operandA[26] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_26_27(.S(w_26_27), .Cout(c_26_27),  .A(w_25_27), .B(data_operandA[26] & data_operandB[1]), .Cin(c_26_26));
full_adder add_w_26_28(.S(w_26_28), .Cout(c_26_28),  .A(w_25_28), .B(data_operandA[26] & data_operandB[2]), .Cin(c_26_27));
full_adder add_w_26_29(.S(w_26_29), .Cout(c_26_29),  .A(w_25_29), .B(data_operandA[26] & data_operandB[3]), .Cin(c_26_28));
full_adder add_w_26_30(.S(w_26_30), .Cout(c_26_30),  .A(w_25_30), .B(data_operandA[26] & data_operandB[4]), .Cin(c_26_29));
full_adder add_w_26_31(.S(w_26_31), .Cout(c_26_31),  .A(w_25_31), .B(data_operandA[26] & data_operandB[5]), .Cin(c_26_30));
full_adder add_w_26_32(.S(w_26_32), .Cout(c_26_32),  .A(w_25_32), .B(data_operandA[26] & data_operandB[6]), .Cin(c_26_31));
full_adder add_w_26_33(.S(w_26_33), .Cout(c_26_33),  .A(w_25_33), .B(data_operandA[26] & data_operandB[7]), .Cin(c_26_32));
full_adder add_w_26_34(.S(w_26_34), .Cout(c_26_34),  .A(w_25_34), .B(data_operandA[26] & data_operandB[8]), .Cin(c_26_33));
full_adder add_w_26_35(.S(w_26_35), .Cout(c_26_35),  .A(w_25_35), .B(data_operandA[26] & data_operandB[9]), .Cin(c_26_34));
full_adder add_w_26_36(.S(w_26_36), .Cout(c_26_36),  .A(w_25_36), .B(data_operandA[26] & data_operandB[10]), .Cin(c_26_35));
full_adder add_w_26_37(.S(w_26_37), .Cout(c_26_37),  .A(w_25_37), .B(data_operandA[26] & data_operandB[11]), .Cin(c_26_36));
full_adder add_w_26_38(.S(w_26_38), .Cout(c_26_38),  .A(w_25_38), .B(data_operandA[26] & data_operandB[12]), .Cin(c_26_37));
full_adder add_w_26_39(.S(w_26_39), .Cout(c_26_39),  .A(w_25_39), .B(data_operandA[26] & data_operandB[13]), .Cin(c_26_38));
full_adder add_w_26_40(.S(w_26_40), .Cout(c_26_40),  .A(w_25_40), .B(data_operandA[26] & data_operandB[14]), .Cin(c_26_39));
full_adder add_w_26_41(.S(w_26_41), .Cout(c_26_41),  .A(w_25_41), .B(data_operandA[26] & data_operandB[15]), .Cin(c_26_40));
full_adder add_w_26_42(.S(w_26_42), .Cout(c_26_42),  .A(w_25_42), .B(data_operandA[26] & data_operandB[16]), .Cin(c_26_41));
full_adder add_w_26_43(.S(w_26_43), .Cout(c_26_43),  .A(w_25_43), .B(data_operandA[26] & data_operandB[17]), .Cin(c_26_42));
full_adder add_w_26_44(.S(w_26_44), .Cout(c_26_44),  .A(w_25_44), .B(data_operandA[26] & data_operandB[18]), .Cin(c_26_43));
full_adder add_w_26_45(.S(w_26_45), .Cout(c_26_45),  .A(w_25_45), .B(data_operandA[26] & data_operandB[19]), .Cin(c_26_44));
full_adder add_w_26_46(.S(w_26_46), .Cout(c_26_46),  .A(w_25_46), .B(data_operandA[26] & data_operandB[20]), .Cin(c_26_45));
full_adder add_w_26_47(.S(w_26_47), .Cout(c_26_47),  .A(w_25_47), .B(data_operandA[26] & data_operandB[21]), .Cin(c_26_46));
full_adder add_w_26_48(.S(w_26_48), .Cout(c_26_48),  .A(w_25_48), .B(data_operandA[26] & data_operandB[22]), .Cin(c_26_47));
full_adder add_w_26_49(.S(w_26_49), .Cout(c_26_49),  .A(w_25_49), .B(data_operandA[26] & data_operandB[23]), .Cin(c_26_48));
full_adder add_w_26_50(.S(w_26_50), .Cout(c_26_50),  .A(w_25_50), .B(data_operandA[26] & data_operandB[24]), .Cin(c_26_49));
full_adder add_w_26_51(.S(w_26_51), .Cout(c_26_51),  .A(w_25_51), .B(data_operandA[26] & data_operandB[25]), .Cin(c_26_50));
full_adder add_w_26_52(.S(w_26_52), .Cout(c_26_52),  .A(w_25_52), .B(data_operandA[26] & data_operandB[26]), .Cin(c_26_51));
full_adder add_w_26_53(.S(w_26_53), .Cout(c_26_53),  .A(w_25_53), .B(data_operandA[26] & data_operandB[27]), .Cin(c_26_52));
full_adder add_w_26_54(.S(w_26_54), .Cout(c_26_54),  .A(w_25_54), .B(data_operandA[26] & data_operandB[28]), .Cin(c_26_53));
full_adder add_w_26_55(.S(w_26_55), .Cout(c_26_55),  .A(w_25_55), .B(data_operandA[26] & data_operandB[29]), .Cin(c_26_54));
full_adder add_w_26_56(.S(w_26_56), .Cout(c_26_56),  .A(w_25_56), .B(data_operandA[26] & data_operandB[30]), .Cin(c_26_55));
full_adder add_w_26_57(.S(w_26_57), .Cout(w_26_58),  .A(w_25_57), .B( !(data_operandA[26] & data_operandB[31])), .Cin(c_26_56));



// these are my wires that have the result of each full adder
wire w_27_59, w_27_27, w_27_28, w_27_29, w_27_30, w_27_31, w_27_32, w_27_33, w_27_34, w_27_35, w_27_36, w_27_37, w_27_38, w_27_39, w_27_40, w_27_41, w_27_42, w_27_43, w_27_44, w_27_45, w_27_46, w_27_47, w_27_48, w_27_49, w_27_50, w_27_51, w_27_52, w_27_53, w_27_54, w_27_55, w_27_56, w_27_57, w_27_58;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_27_27, c_27_28, c_27_29, c_27_30, c_27_31, c_27_32, c_27_33, c_27_34, c_27_35, c_27_36, c_27_37, c_27_38, c_27_39, c_27_40, c_27_41, c_27_42, c_27_43, c_27_44, c_27_45, c_27_46, c_27_47, c_27_48, c_27_49, c_27_50, c_27_51, c_27_52, c_27_53, c_27_54, c_27_55, c_27_56, c_27_57, c_27_58;

full_adder add_w_27_27(.S(w_27_27), .Cout(c_27_27),  .A(w_26_27), .B(data_operandA[27] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_27_28(.S(w_27_28), .Cout(c_27_28),  .A(w_26_28), .B(data_operandA[27] & data_operandB[1]), .Cin(c_27_27));
full_adder add_w_27_29(.S(w_27_29), .Cout(c_27_29),  .A(w_26_29), .B(data_operandA[27] & data_operandB[2]), .Cin(c_27_28));
full_adder add_w_27_30(.S(w_27_30), .Cout(c_27_30),  .A(w_26_30), .B(data_operandA[27] & data_operandB[3]), .Cin(c_27_29));
full_adder add_w_27_31(.S(w_27_31), .Cout(c_27_31),  .A(w_26_31), .B(data_operandA[27] & data_operandB[4]), .Cin(c_27_30));
full_adder add_w_27_32(.S(w_27_32), .Cout(c_27_32),  .A(w_26_32), .B(data_operandA[27] & data_operandB[5]), .Cin(c_27_31));
full_adder add_w_27_33(.S(w_27_33), .Cout(c_27_33),  .A(w_26_33), .B(data_operandA[27] & data_operandB[6]), .Cin(c_27_32));
full_adder add_w_27_34(.S(w_27_34), .Cout(c_27_34),  .A(w_26_34), .B(data_operandA[27] & data_operandB[7]), .Cin(c_27_33));
full_adder add_w_27_35(.S(w_27_35), .Cout(c_27_35),  .A(w_26_35), .B(data_operandA[27] & data_operandB[8]), .Cin(c_27_34));
full_adder add_w_27_36(.S(w_27_36), .Cout(c_27_36),  .A(w_26_36), .B(data_operandA[27] & data_operandB[9]), .Cin(c_27_35));
full_adder add_w_27_37(.S(w_27_37), .Cout(c_27_37),  .A(w_26_37), .B(data_operandA[27] & data_operandB[10]), .Cin(c_27_36));
full_adder add_w_27_38(.S(w_27_38), .Cout(c_27_38),  .A(w_26_38), .B(data_operandA[27] & data_operandB[11]), .Cin(c_27_37));
full_adder add_w_27_39(.S(w_27_39), .Cout(c_27_39),  .A(w_26_39), .B(data_operandA[27] & data_operandB[12]), .Cin(c_27_38));
full_adder add_w_27_40(.S(w_27_40), .Cout(c_27_40),  .A(w_26_40), .B(data_operandA[27] & data_operandB[13]), .Cin(c_27_39));
full_adder add_w_27_41(.S(w_27_41), .Cout(c_27_41),  .A(w_26_41), .B(data_operandA[27] & data_operandB[14]), .Cin(c_27_40));
full_adder add_w_27_42(.S(w_27_42), .Cout(c_27_42),  .A(w_26_42), .B(data_operandA[27] & data_operandB[15]), .Cin(c_27_41));
full_adder add_w_27_43(.S(w_27_43), .Cout(c_27_43),  .A(w_26_43), .B(data_operandA[27] & data_operandB[16]), .Cin(c_27_42));
full_adder add_w_27_44(.S(w_27_44), .Cout(c_27_44),  .A(w_26_44), .B(data_operandA[27] & data_operandB[17]), .Cin(c_27_43));
full_adder add_w_27_45(.S(w_27_45), .Cout(c_27_45),  .A(w_26_45), .B(data_operandA[27] & data_operandB[18]), .Cin(c_27_44));
full_adder add_w_27_46(.S(w_27_46), .Cout(c_27_46),  .A(w_26_46), .B(data_operandA[27] & data_operandB[19]), .Cin(c_27_45));
full_adder add_w_27_47(.S(w_27_47), .Cout(c_27_47),  .A(w_26_47), .B(data_operandA[27] & data_operandB[20]), .Cin(c_27_46));
full_adder add_w_27_48(.S(w_27_48), .Cout(c_27_48),  .A(w_26_48), .B(data_operandA[27] & data_operandB[21]), .Cin(c_27_47));
full_adder add_w_27_49(.S(w_27_49), .Cout(c_27_49),  .A(w_26_49), .B(data_operandA[27] & data_operandB[22]), .Cin(c_27_48));
full_adder add_w_27_50(.S(w_27_50), .Cout(c_27_50),  .A(w_26_50), .B(data_operandA[27] & data_operandB[23]), .Cin(c_27_49));
full_adder add_w_27_51(.S(w_27_51), .Cout(c_27_51),  .A(w_26_51), .B(data_operandA[27] & data_operandB[24]), .Cin(c_27_50));
full_adder add_w_27_52(.S(w_27_52), .Cout(c_27_52),  .A(w_26_52), .B(data_operandA[27] & data_operandB[25]), .Cin(c_27_51));
full_adder add_w_27_53(.S(w_27_53), .Cout(c_27_53),  .A(w_26_53), .B(data_operandA[27] & data_operandB[26]), .Cin(c_27_52));
full_adder add_w_27_54(.S(w_27_54), .Cout(c_27_54),  .A(w_26_54), .B(data_operandA[27] & data_operandB[27]), .Cin(c_27_53));
full_adder add_w_27_55(.S(w_27_55), .Cout(c_27_55),  .A(w_26_55), .B(data_operandA[27] & data_operandB[28]), .Cin(c_27_54));
full_adder add_w_27_56(.S(w_27_56), .Cout(c_27_56),  .A(w_26_56), .B(data_operandA[27] & data_operandB[29]), .Cin(c_27_55));
full_adder add_w_27_57(.S(w_27_57), .Cout(c_27_57),  .A(w_26_57), .B(data_operandA[27] & data_operandB[30]), .Cin(c_27_56));
full_adder add_w_27_58(.S(w_27_58), .Cout(w_27_59),  .A(w_26_58), .B( !(data_operandA[27] & data_operandB[31])), .Cin(c_27_57));



// these are my wires that have the result of each full adder
wire w_28_60, w_28_28, w_28_29, w_28_30, w_28_31, w_28_32, w_28_33, w_28_34, w_28_35, w_28_36, w_28_37, w_28_38, w_28_39, w_28_40, w_28_41, w_28_42, w_28_43, w_28_44, w_28_45, w_28_46, w_28_47, w_28_48, w_28_49, w_28_50, w_28_51, w_28_52, w_28_53, w_28_54, w_28_55, w_28_56, w_28_57, w_28_58, w_28_59;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_28_28, c_28_29, c_28_30, c_28_31, c_28_32, c_28_33, c_28_34, c_28_35, c_28_36, c_28_37, c_28_38, c_28_39, c_28_40, c_28_41, c_28_42, c_28_43, c_28_44, c_28_45, c_28_46, c_28_47, c_28_48, c_28_49, c_28_50, c_28_51, c_28_52, c_28_53, c_28_54, c_28_55, c_28_56, c_28_57, c_28_58, c_28_59;

full_adder add_w_28_28(.S(w_28_28), .Cout(c_28_28),  .A(w_27_28), .B(data_operandA[28] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_28_29(.S(w_28_29), .Cout(c_28_29),  .A(w_27_29), .B(data_operandA[28] & data_operandB[1]), .Cin(c_28_28));
full_adder add_w_28_30(.S(w_28_30), .Cout(c_28_30),  .A(w_27_30), .B(data_operandA[28] & data_operandB[2]), .Cin(c_28_29));
full_adder add_w_28_31(.S(w_28_31), .Cout(c_28_31),  .A(w_27_31), .B(data_operandA[28] & data_operandB[3]), .Cin(c_28_30));
full_adder add_w_28_32(.S(w_28_32), .Cout(c_28_32),  .A(w_27_32), .B(data_operandA[28] & data_operandB[4]), .Cin(c_28_31));
full_adder add_w_28_33(.S(w_28_33), .Cout(c_28_33),  .A(w_27_33), .B(data_operandA[28] & data_operandB[5]), .Cin(c_28_32));
full_adder add_w_28_34(.S(w_28_34), .Cout(c_28_34),  .A(w_27_34), .B(data_operandA[28] & data_operandB[6]), .Cin(c_28_33));
full_adder add_w_28_35(.S(w_28_35), .Cout(c_28_35),  .A(w_27_35), .B(data_operandA[28] & data_operandB[7]), .Cin(c_28_34));
full_adder add_w_28_36(.S(w_28_36), .Cout(c_28_36),  .A(w_27_36), .B(data_operandA[28] & data_operandB[8]), .Cin(c_28_35));
full_adder add_w_28_37(.S(w_28_37), .Cout(c_28_37),  .A(w_27_37), .B(data_operandA[28] & data_operandB[9]), .Cin(c_28_36));
full_adder add_w_28_38(.S(w_28_38), .Cout(c_28_38),  .A(w_27_38), .B(data_operandA[28] & data_operandB[10]), .Cin(c_28_37));
full_adder add_w_28_39(.S(w_28_39), .Cout(c_28_39),  .A(w_27_39), .B(data_operandA[28] & data_operandB[11]), .Cin(c_28_38));
full_adder add_w_28_40(.S(w_28_40), .Cout(c_28_40),  .A(w_27_40), .B(data_operandA[28] & data_operandB[12]), .Cin(c_28_39));
full_adder add_w_28_41(.S(w_28_41), .Cout(c_28_41),  .A(w_27_41), .B(data_operandA[28] & data_operandB[13]), .Cin(c_28_40));
full_adder add_w_28_42(.S(w_28_42), .Cout(c_28_42),  .A(w_27_42), .B(data_operandA[28] & data_operandB[14]), .Cin(c_28_41));
full_adder add_w_28_43(.S(w_28_43), .Cout(c_28_43),  .A(w_27_43), .B(data_operandA[28] & data_operandB[15]), .Cin(c_28_42));
full_adder add_w_28_44(.S(w_28_44), .Cout(c_28_44),  .A(w_27_44), .B(data_operandA[28] & data_operandB[16]), .Cin(c_28_43));
full_adder add_w_28_45(.S(w_28_45), .Cout(c_28_45),  .A(w_27_45), .B(data_operandA[28] & data_operandB[17]), .Cin(c_28_44));
full_adder add_w_28_46(.S(w_28_46), .Cout(c_28_46),  .A(w_27_46), .B(data_operandA[28] & data_operandB[18]), .Cin(c_28_45));
full_adder add_w_28_47(.S(w_28_47), .Cout(c_28_47),  .A(w_27_47), .B(data_operandA[28] & data_operandB[19]), .Cin(c_28_46));
full_adder add_w_28_48(.S(w_28_48), .Cout(c_28_48),  .A(w_27_48), .B(data_operandA[28] & data_operandB[20]), .Cin(c_28_47));
full_adder add_w_28_49(.S(w_28_49), .Cout(c_28_49),  .A(w_27_49), .B(data_operandA[28] & data_operandB[21]), .Cin(c_28_48));
full_adder add_w_28_50(.S(w_28_50), .Cout(c_28_50),  .A(w_27_50), .B(data_operandA[28] & data_operandB[22]), .Cin(c_28_49));
full_adder add_w_28_51(.S(w_28_51), .Cout(c_28_51),  .A(w_27_51), .B(data_operandA[28] & data_operandB[23]), .Cin(c_28_50));
full_adder add_w_28_52(.S(w_28_52), .Cout(c_28_52),  .A(w_27_52), .B(data_operandA[28] & data_operandB[24]), .Cin(c_28_51));
full_adder add_w_28_53(.S(w_28_53), .Cout(c_28_53),  .A(w_27_53), .B(data_operandA[28] & data_operandB[25]), .Cin(c_28_52));
full_adder add_w_28_54(.S(w_28_54), .Cout(c_28_54),  .A(w_27_54), .B(data_operandA[28] & data_operandB[26]), .Cin(c_28_53));
full_adder add_w_28_55(.S(w_28_55), .Cout(c_28_55),  .A(w_27_55), .B(data_operandA[28] & data_operandB[27]), .Cin(c_28_54));
full_adder add_w_28_56(.S(w_28_56), .Cout(c_28_56),  .A(w_27_56), .B(data_operandA[28] & data_operandB[28]), .Cin(c_28_55));
full_adder add_w_28_57(.S(w_28_57), .Cout(c_28_57),  .A(w_27_57), .B(data_operandA[28] & data_operandB[29]), .Cin(c_28_56));
full_adder add_w_28_58(.S(w_28_58), .Cout(c_28_58),  .A(w_27_58), .B(data_operandA[28] & data_operandB[30]), .Cin(c_28_57));
full_adder add_w_28_59(.S(w_28_59), .Cout(w_28_60),  .A(w_27_59), .B( !(data_operandA[28] & data_operandB[31])), .Cin(c_28_58));



// these are my wires that have the result of each full adder
wire w_29_61, w_29_29, w_29_30, w_29_31, w_29_32, w_29_33, w_29_34, w_29_35, w_29_36, w_29_37, w_29_38, w_29_39, w_29_40, w_29_41, w_29_42, w_29_43, w_29_44, w_29_45, w_29_46, w_29_47, w_29_48, w_29_49, w_29_50, w_29_51, w_29_52, w_29_53, w_29_54, w_29_55, w_29_56, w_29_57, w_29_58, w_29_59, w_29_60;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_29_29, c_29_30, c_29_31, c_29_32, c_29_33, c_29_34, c_29_35, c_29_36, c_29_37, c_29_38, c_29_39, c_29_40, c_29_41, c_29_42, c_29_43, c_29_44, c_29_45, c_29_46, c_29_47, c_29_48, c_29_49, c_29_50, c_29_51, c_29_52, c_29_53, c_29_54, c_29_55, c_29_56, c_29_57, c_29_58, c_29_59, c_29_60;

full_adder add_w_29_29(.S(w_29_29), .Cout(c_29_29),  .A(w_28_29), .B(data_operandA[29] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_29_30(.S(w_29_30), .Cout(c_29_30),  .A(w_28_30), .B(data_operandA[29] & data_operandB[1]), .Cin(c_29_29));
full_adder add_w_29_31(.S(w_29_31), .Cout(c_29_31),  .A(w_28_31), .B(data_operandA[29] & data_operandB[2]), .Cin(c_29_30));
full_adder add_w_29_32(.S(w_29_32), .Cout(c_29_32),  .A(w_28_32), .B(data_operandA[29] & data_operandB[3]), .Cin(c_29_31));
full_adder add_w_29_33(.S(w_29_33), .Cout(c_29_33),  .A(w_28_33), .B(data_operandA[29] & data_operandB[4]), .Cin(c_29_32));
full_adder add_w_29_34(.S(w_29_34), .Cout(c_29_34),  .A(w_28_34), .B(data_operandA[29] & data_operandB[5]), .Cin(c_29_33));
full_adder add_w_29_35(.S(w_29_35), .Cout(c_29_35),  .A(w_28_35), .B(data_operandA[29] & data_operandB[6]), .Cin(c_29_34));
full_adder add_w_29_36(.S(w_29_36), .Cout(c_29_36),  .A(w_28_36), .B(data_operandA[29] & data_operandB[7]), .Cin(c_29_35));
full_adder add_w_29_37(.S(w_29_37), .Cout(c_29_37),  .A(w_28_37), .B(data_operandA[29] & data_operandB[8]), .Cin(c_29_36));
full_adder add_w_29_38(.S(w_29_38), .Cout(c_29_38),  .A(w_28_38), .B(data_operandA[29] & data_operandB[9]), .Cin(c_29_37));
full_adder add_w_29_39(.S(w_29_39), .Cout(c_29_39),  .A(w_28_39), .B(data_operandA[29] & data_operandB[10]), .Cin(c_29_38));
full_adder add_w_29_40(.S(w_29_40), .Cout(c_29_40),  .A(w_28_40), .B(data_operandA[29] & data_operandB[11]), .Cin(c_29_39));
full_adder add_w_29_41(.S(w_29_41), .Cout(c_29_41),  .A(w_28_41), .B(data_operandA[29] & data_operandB[12]), .Cin(c_29_40));
full_adder add_w_29_42(.S(w_29_42), .Cout(c_29_42),  .A(w_28_42), .B(data_operandA[29] & data_operandB[13]), .Cin(c_29_41));
full_adder add_w_29_43(.S(w_29_43), .Cout(c_29_43),  .A(w_28_43), .B(data_operandA[29] & data_operandB[14]), .Cin(c_29_42));
full_adder add_w_29_44(.S(w_29_44), .Cout(c_29_44),  .A(w_28_44), .B(data_operandA[29] & data_operandB[15]), .Cin(c_29_43));
full_adder add_w_29_45(.S(w_29_45), .Cout(c_29_45),  .A(w_28_45), .B(data_operandA[29] & data_operandB[16]), .Cin(c_29_44));
full_adder add_w_29_46(.S(w_29_46), .Cout(c_29_46),  .A(w_28_46), .B(data_operandA[29] & data_operandB[17]), .Cin(c_29_45));
full_adder add_w_29_47(.S(w_29_47), .Cout(c_29_47),  .A(w_28_47), .B(data_operandA[29] & data_operandB[18]), .Cin(c_29_46));
full_adder add_w_29_48(.S(w_29_48), .Cout(c_29_48),  .A(w_28_48), .B(data_operandA[29] & data_operandB[19]), .Cin(c_29_47));
full_adder add_w_29_49(.S(w_29_49), .Cout(c_29_49),  .A(w_28_49), .B(data_operandA[29] & data_operandB[20]), .Cin(c_29_48));
full_adder add_w_29_50(.S(w_29_50), .Cout(c_29_50),  .A(w_28_50), .B(data_operandA[29] & data_operandB[21]), .Cin(c_29_49));
full_adder add_w_29_51(.S(w_29_51), .Cout(c_29_51),  .A(w_28_51), .B(data_operandA[29] & data_operandB[22]), .Cin(c_29_50));
full_adder add_w_29_52(.S(w_29_52), .Cout(c_29_52),  .A(w_28_52), .B(data_operandA[29] & data_operandB[23]), .Cin(c_29_51));
full_adder add_w_29_53(.S(w_29_53), .Cout(c_29_53),  .A(w_28_53), .B(data_operandA[29] & data_operandB[24]), .Cin(c_29_52));
full_adder add_w_29_54(.S(w_29_54), .Cout(c_29_54),  .A(w_28_54), .B(data_operandA[29] & data_operandB[25]), .Cin(c_29_53));
full_adder add_w_29_55(.S(w_29_55), .Cout(c_29_55),  .A(w_28_55), .B(data_operandA[29] & data_operandB[26]), .Cin(c_29_54));
full_adder add_w_29_56(.S(w_29_56), .Cout(c_29_56),  .A(w_28_56), .B(data_operandA[29] & data_operandB[27]), .Cin(c_29_55));
full_adder add_w_29_57(.S(w_29_57), .Cout(c_29_57),  .A(w_28_57), .B(data_operandA[29] & data_operandB[28]), .Cin(c_29_56));
full_adder add_w_29_58(.S(w_29_58), .Cout(c_29_58),  .A(w_28_58), .B(data_operandA[29] & data_operandB[29]), .Cin(c_29_57));
full_adder add_w_29_59(.S(w_29_59), .Cout(c_29_59),  .A(w_28_59), .B(data_operandA[29] & data_operandB[30]), .Cin(c_29_58));
full_adder add_w_29_60(.S(w_29_60), .Cout(w_29_61),  .A(w_28_60), .B( !(data_operandA[29] & data_operandB[31])), .Cin(c_29_59));



// these are my wires that have the result of each full adder
wire w_30_62, w_30_30, w_30_31, w_30_32, w_30_33, w_30_34, w_30_35, w_30_36, w_30_37, w_30_38, w_30_39, w_30_40, w_30_41, w_30_42, w_30_43, w_30_44, w_30_45, w_30_46, w_30_47, w_30_48, w_30_49, w_30_50, w_30_51, w_30_52, w_30_53, w_30_54, w_30_55, w_30_56, w_30_57, w_30_58, w_30_59, w_30_60, w_30_61;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_30_30, c_30_31, c_30_32, c_30_33, c_30_34, c_30_35, c_30_36, c_30_37, c_30_38, c_30_39, c_30_40, c_30_41, c_30_42, c_30_43, c_30_44, c_30_45, c_30_46, c_30_47, c_30_48, c_30_49, c_30_50, c_30_51, c_30_52, c_30_53, c_30_54, c_30_55, c_30_56, c_30_57, c_30_58, c_30_59, c_30_60, c_30_61;

full_adder add_w_30_30(.S(w_30_30), .Cout(c_30_30),  .A(w_29_30), .B(data_operandA[30] & data_operandB[0]), .Cin(1'b0));
full_adder add_w_30_31(.S(w_30_31), .Cout(c_30_31),  .A(w_29_31), .B(data_operandA[30] & data_operandB[1]), .Cin(c_30_30));
full_adder add_w_30_32(.S(w_30_32), .Cout(c_30_32),  .A(w_29_32), .B(data_operandA[30] & data_operandB[2]), .Cin(c_30_31));
full_adder add_w_30_33(.S(w_30_33), .Cout(c_30_33),  .A(w_29_33), .B(data_operandA[30] & data_operandB[3]), .Cin(c_30_32));
full_adder add_w_30_34(.S(w_30_34), .Cout(c_30_34),  .A(w_29_34), .B(data_operandA[30] & data_operandB[4]), .Cin(c_30_33));
full_adder add_w_30_35(.S(w_30_35), .Cout(c_30_35),  .A(w_29_35), .B(data_operandA[30] & data_operandB[5]), .Cin(c_30_34));
full_adder add_w_30_36(.S(w_30_36), .Cout(c_30_36),  .A(w_29_36), .B(data_operandA[30] & data_operandB[6]), .Cin(c_30_35));
full_adder add_w_30_37(.S(w_30_37), .Cout(c_30_37),  .A(w_29_37), .B(data_operandA[30] & data_operandB[7]), .Cin(c_30_36));
full_adder add_w_30_38(.S(w_30_38), .Cout(c_30_38),  .A(w_29_38), .B(data_operandA[30] & data_operandB[8]), .Cin(c_30_37));
full_adder add_w_30_39(.S(w_30_39), .Cout(c_30_39),  .A(w_29_39), .B(data_operandA[30] & data_operandB[9]), .Cin(c_30_38));
full_adder add_w_30_40(.S(w_30_40), .Cout(c_30_40),  .A(w_29_40), .B(data_operandA[30] & data_operandB[10]), .Cin(c_30_39));
full_adder add_w_30_41(.S(w_30_41), .Cout(c_30_41),  .A(w_29_41), .B(data_operandA[30] & data_operandB[11]), .Cin(c_30_40));
full_adder add_w_30_42(.S(w_30_42), .Cout(c_30_42),  .A(w_29_42), .B(data_operandA[30] & data_operandB[12]), .Cin(c_30_41));
full_adder add_w_30_43(.S(w_30_43), .Cout(c_30_43),  .A(w_29_43), .B(data_operandA[30] & data_operandB[13]), .Cin(c_30_42));
full_adder add_w_30_44(.S(w_30_44), .Cout(c_30_44),  .A(w_29_44), .B(data_operandA[30] & data_operandB[14]), .Cin(c_30_43));
full_adder add_w_30_45(.S(w_30_45), .Cout(c_30_45),  .A(w_29_45), .B(data_operandA[30] & data_operandB[15]), .Cin(c_30_44));
full_adder add_w_30_46(.S(w_30_46), .Cout(c_30_46),  .A(w_29_46), .B(data_operandA[30] & data_operandB[16]), .Cin(c_30_45));
full_adder add_w_30_47(.S(w_30_47), .Cout(c_30_47),  .A(w_29_47), .B(data_operandA[30] & data_operandB[17]), .Cin(c_30_46));
full_adder add_w_30_48(.S(w_30_48), .Cout(c_30_48),  .A(w_29_48), .B(data_operandA[30] & data_operandB[18]), .Cin(c_30_47));
full_adder add_w_30_49(.S(w_30_49), .Cout(c_30_49),  .A(w_29_49), .B(data_operandA[30] & data_operandB[19]), .Cin(c_30_48));
full_adder add_w_30_50(.S(w_30_50), .Cout(c_30_50),  .A(w_29_50), .B(data_operandA[30] & data_operandB[20]), .Cin(c_30_49));
full_adder add_w_30_51(.S(w_30_51), .Cout(c_30_51),  .A(w_29_51), .B(data_operandA[30] & data_operandB[21]), .Cin(c_30_50));
full_adder add_w_30_52(.S(w_30_52), .Cout(c_30_52),  .A(w_29_52), .B(data_operandA[30] & data_operandB[22]), .Cin(c_30_51));
full_adder add_w_30_53(.S(w_30_53), .Cout(c_30_53),  .A(w_29_53), .B(data_operandA[30] & data_operandB[23]), .Cin(c_30_52));
full_adder add_w_30_54(.S(w_30_54), .Cout(c_30_54),  .A(w_29_54), .B(data_operandA[30] & data_operandB[24]), .Cin(c_30_53));
full_adder add_w_30_55(.S(w_30_55), .Cout(c_30_55),  .A(w_29_55), .B(data_operandA[30] & data_operandB[25]), .Cin(c_30_54));
full_adder add_w_30_56(.S(w_30_56), .Cout(c_30_56),  .A(w_29_56), .B(data_operandA[30] & data_operandB[26]), .Cin(c_30_55));
full_adder add_w_30_57(.S(w_30_57), .Cout(c_30_57),  .A(w_29_57), .B(data_operandA[30] & data_operandB[27]), .Cin(c_30_56));
full_adder add_w_30_58(.S(w_30_58), .Cout(c_30_58),  .A(w_29_58), .B(data_operandA[30] & data_operandB[28]), .Cin(c_30_57));
full_adder add_w_30_59(.S(w_30_59), .Cout(c_30_59),  .A(w_29_59), .B(data_operandA[30] & data_operandB[29]), .Cin(c_30_58));
full_adder add_w_30_60(.S(w_30_60), .Cout(c_30_60),  .A(w_29_60), .B(data_operandA[30] & data_operandB[30]), .Cin(c_30_59));
full_adder add_w_30_61(.S(w_30_61), .Cout(w_30_62),  .A(w_29_61), .B( !(data_operandA[30] & data_operandB[31])), .Cin(c_30_60));



// these are my wires that have the result of each full adder
wire w_31_63, w_31_31, w_31_32, w_31_33, w_31_34, w_31_35, w_31_36, w_31_37, w_31_38, w_31_39, w_31_40, w_31_41, w_31_42, w_31_43, w_31_44, w_31_45, w_31_46, w_31_47, w_31_48, w_31_49, w_31_50, w_31_51, w_31_52, w_31_53, w_31_54, w_31_55, w_31_56, w_31_57, w_31_58, w_31_59, w_31_60, w_31_61, w_31_62;

// these are my carry outs (I know I don't need these many but it made the python code easier)
wire c_31_31, c_31_32, c_31_33, c_31_34, c_31_35, c_31_36, c_31_37, c_31_38, c_31_39, c_31_40, c_31_41, c_31_42, c_31_43, c_31_44, c_31_45, c_31_46, c_31_47, c_31_48, c_31_49, c_31_50, c_31_51, c_31_52, c_31_53, c_31_54, c_31_55, c_31_56, c_31_57, c_31_58, c_31_59, c_31_60, c_31_61, c_31_62;

full_adder add_31(.S(w_31_31), .Cout(c_31_31),  .A(w_30_31), .B(!(data_operandA[31] & data_operandB[0])), .Cin(1'b0));
full_adder add_32(.S(w_31_32), .Cout(c_31_32),  .A(w_30_32), .B( !(data_operandA[31] & data_operandB[1])), .Cin(c_31_31));
full_adder add_33(.S(w_31_33), .Cout(c_31_33),  .A(w_30_33), .B( !(data_operandA[31] & data_operandB[2])), .Cin(c_31_32));
full_adder add_34(.S(w_31_34), .Cout(c_31_34),  .A(w_30_34), .B( !(data_operandA[31] & data_operandB[3])), .Cin(c_31_33));
full_adder add_35(.S(w_31_35), .Cout(c_31_35),  .A(w_30_35), .B( !(data_operandA[31] & data_operandB[4])), .Cin(c_31_34));
full_adder add_36(.S(w_31_36), .Cout(c_31_36),  .A(w_30_36), .B( !(data_operandA[31] & data_operandB[5])), .Cin(c_31_35));
full_adder add_37(.S(w_31_37), .Cout(c_31_37),  .A(w_30_37), .B( !(data_operandA[31] & data_operandB[6])), .Cin(c_31_36));
full_adder add_38(.S(w_31_38), .Cout(c_31_38),  .A(w_30_38), .B( !(data_operandA[31] & data_operandB[7])), .Cin(c_31_37));
full_adder add_39(.S(w_31_39), .Cout(c_31_39),  .A(w_30_39), .B( !(data_operandA[31] & data_operandB[8])), .Cin(c_31_38));
full_adder add_40(.S(w_31_40), .Cout(c_31_40),  .A(w_30_40), .B( !(data_operandA[31] & data_operandB[9])), .Cin(c_31_39));
full_adder add_41(.S(w_31_41), .Cout(c_31_41),  .A(w_30_41), .B( !(data_operandA[31] & data_operandB[10])), .Cin(c_31_40));
full_adder add_42(.S(w_31_42), .Cout(c_31_42),  .A(w_30_42), .B( !(data_operandA[31] & data_operandB[11])), .Cin(c_31_41));
full_adder add_43(.S(w_31_43), .Cout(c_31_43),  .A(w_30_43), .B( !(data_operandA[31] & data_operandB[12])), .Cin(c_31_42));
full_adder add_44(.S(w_31_44), .Cout(c_31_44),  .A(w_30_44), .B( !(data_operandA[31] & data_operandB[13])), .Cin(c_31_43));
full_adder add_45(.S(w_31_45), .Cout(c_31_45),  .A(w_30_45), .B( !(data_operandA[31] & data_operandB[14])), .Cin(c_31_44));
full_adder add_46(.S(w_31_46), .Cout(c_31_46),  .A(w_30_46), .B( !(data_operandA[31] & data_operandB[15])), .Cin(c_31_45));
full_adder add_47(.S(w_31_47), .Cout(c_31_47),  .A(w_30_47), .B( !(data_operandA[31] & data_operandB[16])), .Cin(c_31_46));
full_adder add_48(.S(w_31_48), .Cout(c_31_48),  .A(w_30_48), .B( !(data_operandA[31] & data_operandB[17])), .Cin(c_31_47));
full_adder add_49(.S(w_31_49), .Cout(c_31_49),  .A(w_30_49), .B( !(data_operandA[31] & data_operandB[18])), .Cin(c_31_48));
full_adder add_50(.S(w_31_50), .Cout(c_31_50),  .A(w_30_50), .B( !(data_operandA[31] & data_operandB[19])), .Cin(c_31_49));
full_adder add_51(.S(w_31_51), .Cout(c_31_51),  .A(w_30_51), .B( !(data_operandA[31] & data_operandB[20])), .Cin(c_31_50));
full_adder add_52(.S(w_31_52), .Cout(c_31_52),  .A(w_30_52), .B( !(data_operandA[31] & data_operandB[21])), .Cin(c_31_51));
full_adder add_53(.S(w_31_53), .Cout(c_31_53),  .A(w_30_53), .B( !(data_operandA[31] & data_operandB[22])), .Cin(c_31_52));
full_adder add_54(.S(w_31_54), .Cout(c_31_54),  .A(w_30_54), .B( !(data_operandA[31] & data_operandB[23])), .Cin(c_31_53));
full_adder add_55(.S(w_31_55), .Cout(c_31_55),  .A(w_30_55), .B( !(data_operandA[31] & data_operandB[24])), .Cin(c_31_54));
full_adder add_56(.S(w_31_56), .Cout(c_31_56),  .A(w_30_56), .B( !(data_operandA[31] & data_operandB[25])), .Cin(c_31_55));
full_adder add_57(.S(w_31_57), .Cout(c_31_57),  .A(w_30_57), .B( !(data_operandA[31] & data_operandB[26])), .Cin(c_31_56));
full_adder add_58(.S(w_31_58), .Cout(c_31_58),  .A(w_30_58), .B( !(data_operandA[31] & data_operandB[27])), .Cin(c_31_57));
full_adder add_59(.S(w_31_59), .Cout(c_31_59),  .A(w_30_59), .B( !(data_operandA[31] & data_operandB[28])), .Cin(c_31_58));
full_adder add_60(.S(w_31_60), .Cout(c_31_60),  .A(w_30_60), .B( !(data_operandA[31] & data_operandB[29])), .Cin(c_31_59));
full_adder add_61(.S(w_31_61), .Cout(c_31_61),  .A(w_30_61), .B( !(data_operandA[31] & data_operandB[30])), .Cin(c_31_60));
full_adder add_62(.S(w_31_62), .Cout(w_31_63),  .A(w_30_62), .B((data_operandA[31] & data_operandB[31])), .Cin(c_31_61));



wire throwaway;
assign data_result[0] = w_0_0;
assign data_result[1] = w_1_1;
assign data_result[2] = w_2_2;
assign data_result[3] = w_3_3;
assign data_result[4] = w_4_4;
assign data_result[5] = w_5_5;
assign data_result[6] = w_6_6;
assign data_result[7] = w_7_7;
assign data_result[8] = w_8_8;
assign data_result[9] = w_9_9;
assign data_result[10] = w_10_10;
assign data_result[11] = w_11_11;
assign data_result[12] = w_12_12;
assign data_result[13] = w_13_13;
assign data_result[14] = w_14_14;
assign data_result[15] = w_15_15;
assign data_result[16] = w_16_16;
assign data_result[17] = w_17_17;
assign data_result[18] = w_18_18;
assign data_result[19] = w_19_19;
assign data_result[20] = w_20_20;
assign data_result[21] = w_21_21;
assign data_result[22] = w_22_22;
assign data_result[23] = w_23_23;
assign data_result[24] = w_24_24;
assign data_result[25] = w_25_25;
assign data_result[26] = w_26_26;
assign data_result[27] = w_27_27;
assign data_result[28] = w_28_28;
assign data_result[29] = w_29_29;
assign data_result[30] = w_30_30;
assign data_result[31] = w_31_31;
assign data_result[32] = w_31_32;
assign data_result[33] = w_31_33;
assign data_result[34] = w_31_34;
assign data_result[35] = w_31_35;
assign data_result[36] = w_31_36;
assign data_result[37] = w_31_37;
assign data_result[38] = w_31_38;
assign data_result[39] = w_31_39;
assign data_result[40] = w_31_40;
assign data_result[41] = w_31_41;
assign data_result[42] = w_31_42;
assign data_result[43] = w_31_43;
assign data_result[44] = w_31_44;
assign data_result[45] = w_31_45;
assign data_result[46] = w_31_46;
assign data_result[47] = w_31_47;
assign data_result[48] = w_31_48;
assign data_result[49] = w_31_49;
assign data_result[50] = w_31_50;
assign data_result[51] = w_31_51;
assign data_result[52] = w_31_52;
assign data_result[53] = w_31_53;
assign data_result[54] = w_31_54;
assign data_result[55] = w_31_55;
assign data_result[56] = w_31_56;
assign data_result[57] = w_31_57;
assign data_result[58] = w_31_58;
assign data_result[59] = w_31_59;
assign data_result[60] = w_31_60;
assign data_result[61] = w_31_61;
assign data_result[62] = w_31_62;
assign data_result[62] = w_31_62;

full_adder add_final_bit(.S(data_result[63]), .Cout(throwaway),  .A(1'b1), .B(1'b0), .Cin(w_31_63));

//data_exception

wire andOverflow, orOverflow;

assign andOverflow = &data_result[63:31];

assign orOverflow = |data_result[63:31];

assign data_exception = (!andOverflow) & (orOverflow);

endmodule