module regfile (
	clock,
	ctrl_writeEnable, ctrl_reset, ctrl_writeReg,
	ctrl_readRegA, ctrl_readRegB, data_writeReg,
	data_readRegA, data_readRegB
);

	//LOOK AT LOGISIM

	input clock, ctrl_writeEnable, ctrl_reset;
	input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	input [31:0] data_writeReg;

	output [31:0] data_readRegA, data_readRegB;

	wire [31:0] decoded_writeReg, decoded_readRegA, decoded_readRegB;


	//decoding the ctrl inputs from 5 bit num to 32 bit one hot
	decoder32 jaimsie(.out(decoded_writeReg), .select(ctrl_writeReg), .enable(1'b1));
	decoder32 joimsie(.out(decoded_readRegA), .select(ctrl_readRegA), .enable(1'b1));
	decoder32 jyimsie(.out(decoded_readRegB), .select(ctrl_readRegB), .enable(1'b1));



	// reg 0 - hardwired to 0
	// returns 0
	wire[31:0] zero_out;
	single_reg zero_reg(.q(zero_out), .d(32'b0), .clk(clock), .en(1'b0), .clr(ctrl_reset));

	//tristate of outputs
	tristate zero_tri1(.in(zero_out), .en(decoded_readRegA[0]), .out(data_readRegA));
	tristate zero_tri2(.in(zero_out), .en(decoded_readRegB[0]), .out(data_readRegB));

	// reg 1 - 31
   genvar i;
   generate
        for (i = 1; i <= 31; i = i + 1) begin: loop1

            wire[31:0] reg_out;
			//enables and shit

			wire enableShakespeareMode;

			and andgate(enableShakespeareMode, decoded_writeReg[i], ctrl_writeEnable);

			single_reg one_whole_register(.q(reg_out), .d(data_writeReg), .clk(clock), .en(enableShakespeareMode), .clr(ctrl_reset));

			//tristate of outputs
			tristate one_whole_register_output_number1(.in(reg_out), .en(decoded_readRegA[i]), .out(data_readRegA));
			tristate one_whole_register_output_number2(.in(reg_out), .en(decoded_readRegB[i]), .out(data_readRegB));

        end

   endgenerate

endmodule
