module regfile (
	clock,
	ctrl_writeEnable, ctrl_reset, ctrl_writeReg,
	ctrl_readRegA, ctrl_readRegB, data_writeReg,
	data_readRegA, data_readRegB,
    
    reg_out23, reg_out24,
    
	reg_out25, reg_out26, reg_out27, reg_out28, reg_out29,
	
	reg_in23, reg_in24, reg_in23_wen, reg_in24_wen
);

	//LOOK AT LOGISIM

	input clock, ctrl_writeEnable, ctrl_reset;
	input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	input [31:0] data_writeReg;

	output [31:0] data_readRegA, data_readRegB;

    output[31:0] reg_out23, reg_out24;
	output[31:0] reg_out25, reg_out26, reg_out27, reg_out28, reg_out29;
	
	input[31:0] reg_in23, reg_in24;
	input reg_in23_wen, reg_in24_wen;

	wire [31:0] decoded_writeReg, decoded_readRegA, decoded_readRegB;


	//decoding the ctrl inputs from 5 bit num to 32 bit one hot
	decoder32 jaimsie(.out(decoded_writeReg), .select(ctrl_writeReg), .enable(1'b1));
	decoder32 joimsie(.out(decoded_readRegA), .select(ctrl_readRegA), .enable(1'b1));
	decoder32 jyimsie(.out(decoded_readRegB), .select(ctrl_readRegB), .enable(1'b1));



	// reg 0 - hardwired to 0
	// returns 0
	wire[31:0] zero_out;
	register zero_reg(.q(zero_out), .d(32'b0), .clk(clock), .en(1'b0), .clr(ctrl_reset));

	//tristate of outputs
	tristate zero_tri1(.in(zero_out), .en(decoded_readRegA[0]), .out(data_readRegA));
	tristate zero_tri2(.in(zero_out), .en(decoded_readRegB[0]), .out(data_readRegB));

	// reg 1 - 25
   	genvar i;
   	generate
        for (i = 1; i <= 22; i = i + 1) begin: loop1

            wire[31:0] reg_out;
			//enables

			wire enableShakespeareMode;

			and andgate(enableShakespeareMode, decoded_writeReg[i], ctrl_writeEnable);

			register one_whole_register(.q(reg_out), .d(data_writeReg), .clk(clock), .en(enableShakespeareMode), .clr(ctrl_reset));

			//tristate of outputs
			tristate one_whole_register_output_number1(.in(reg_out), .en(decoded_readRegA[i]), .out(data_readRegA));
			tristate one_whole_register_output_number2(.in(reg_out), .en(decoded_readRegB[i]), .out(data_readRegB));

        end

   	endgenerate
   	
   	//reg 23 - 24
   	
//   	input[31:0] reg_in23, reg_in24;
//	input reg_in23_wen, reg_in24_wen;
   	
   	wire[31:0] reg_out23;
	
	register one_whole_register23(.q(reg_out23), .d(reg_in23), .clk(clock), .en(reg_in23_wen), .clr(ctrl_reset));
	//tristate of outputs
	tristate one_whole_register_output_number123(.in(reg_out23), .en(decoded_readRegA[23]), .out(data_readRegA));
	tristate one_whole_register_output_number223(.in(reg_out23), .en(decoded_readRegB[23]), .out(data_readRegB));
	
	wire[31:0] reg_out24;
	register one_whole_register24(.q(reg_out24), .d(reg_in24), .clk(clock), .en(reg_in24_wen), .clr(ctrl_reset));
	//tristate of outputs
	tristate one_whole_register_output_number124(.in(reg_out24), .en(decoded_readRegA[24]), .out(data_readRegA));
	tristate one_whole_register_output_number224(.in(reg_out24), .en(decoded_readRegB[24]), .out(data_readRegB));

	//reg 25 - 29
	
	wire[31:0] reg_out25;
	wire enableShakespeareMode25;
	and andgate25(enableShakespeareMode25, decoded_writeReg[25], ctrl_writeEnable);
	register one_whole_register25(.q(reg_out25), .d(data_writeReg), .clk(clock), .en(enableShakespeareMode25), .clr(ctrl_reset));
	//tristate of outputs
	tristate one_whole_register_output_number125(.in(reg_out25), .en(decoded_readRegA[25]), .out(data_readRegA));
	tristate one_whole_register_output_number225(.in(reg_out25), .en(decoded_readRegB[25]), .out(data_readRegB));

	wire[31:0] reg_out26;
	wire enableShakespeareMode26;
	and andgate26(enableShakespeareMode26, decoded_writeReg[26], ctrl_writeEnable);
	register one_whole_register26(.q(reg_out26), .d(data_writeReg), .clk(clock), .en(enableShakespeareMode26), .clr(ctrl_reset));
	//tristate of outputs
	tristate one_whole_register_output_number126(.in(reg_out26), .en(decoded_readRegA[26]), .out(data_readRegA));
	tristate one_whole_register_output_number226(.in(reg_out26), .en(decoded_readRegB[26]), .out(data_readRegB));

	wire[31:0] reg_out27;
	wire enableShakespeareMode27;
	and andgate27(enableShakespeareMode27, decoded_writeReg[27], ctrl_writeEnable);
	register one_whole_register27(.q(reg_out27), .d(data_writeReg), .clk(clock), .en(enableShakespeareMode27), .clr(ctrl_reset));
	//tristate of outputs
	tristate one_whole_register_output_number127(.in(reg_out27), .en(decoded_readRegA[27]), .out(data_readRegA));
	tristate one_whole_register_output_number227(.in(reg_out27), .en(decoded_readRegB[27]), .out(data_readRegB));


	wire[31:0] reg_out28;
	wire enableShakespeareMode28;
	and andgate28(enableShakespeareMode28, decoded_writeReg[28], ctrl_writeEnable);
	register one_whole_register28(.q(reg_out28), .d(data_writeReg), .clk(clock), .en(enableShakespeareMode28), .clr(ctrl_reset));
	//tristate of outputs
	tristate one_whole_register_output_number128(.in(reg_out28), .en(decoded_readRegA[28]), .out(data_readRegA));
	tristate one_whole_register_output_number228(.in(reg_out28), .en(decoded_readRegB[28]), .out(data_readRegB));


	wire[31:0] reg_out29;
	wire enableShakespeareMode29;
	and andgate29(enableShakespeareMode29, decoded_writeReg[29], ctrl_writeEnable);
	register one_whole_register29(.q(reg_out29), .d(data_writeReg), .clk(clock), .en(enableShakespeareMode29), .clr(ctrl_reset));
	//tristate of outputs
	tristate one_whole_register_output_number129(.in(reg_out29), .en(decoded_readRegA[29]), .out(data_readRegA));
	tristate one_whole_register_output_number229(.in(reg_out29), .en(decoded_readRegB[29]), .out(data_readRegB));



	//reg 30 -31
	genvar j;
   	generate
        for (j = 30; j <= 31; j = j + 1) begin: loop2

            wire[31:0] reg_out;

			wire enableShakespeareMode;

			and andgate(enableShakespeareMode, decoded_writeReg[j], ctrl_writeEnable);

			register one_whole_register(.q(reg_out), .d(data_writeReg), .clk(clock), .en(enableShakespeareMode), .clr(ctrl_reset));

			//tristate of outputs
			tristate one_whole_register_output_number1(.in(reg_out), .en(decoded_readRegA[j]), .out(data_readRegA));
			tristate one_whole_register_output_number2(.in(reg_out), .en(decoded_readRegB[j]), .out(data_readRegB));

        end

   	endgenerate

endmodule