module bypass_controller(opcode_DX, opcode_XM, opcode_MW, ALUregA, ALUregB, XM_rd, MW_rd, DX_rd, FD_rs1, FD_rs2, FD_opcode,
                         RAM_data_bypass, RAM_data_bypass_2 , ALUinA_bypass, ALUinB_bypass, stallSignalB);


input[4:0] opcode_DX, opcode_XM, opcode_MW, ALUregA, ALUregB, XM_rd, MW_rd, DX_rd, FD_rs1, FD_rs2, FD_opcode;

output RAM_data_bypass, RAM_data_bypass_2, stallSignalB;
wire ALUinA_zero_bypass, ALUinB_zero_bypass;
output[1:0] ALUinA_bypass, ALUinB_bypass;


wire[31:0] DX_instruction;
decoder32 DX_decoder(.out(DX_instruction), .select(opcode_DX), .enable(1'b1));

wire ALU_DX, jump_DX, bne_DX, jal_DX, jr_DX, addi_DX, blt_DX, sw_DX, lw_DX, bex_DX, setx_DX;

assign ALU_DX = DX_instruction[0];
assign jump_DX = DX_instruction[1];
assign bne_DX = DX_instruction[2];  
assign jal_DX = DX_instruction[3];
assign jr_DX = DX_instruction[4];
assign addi_DX = DX_instruction[5];
assign blt_DX = DX_instruction[6];
assign sw_DX = DX_instruction[7];
assign lw_DX = DX_instruction[8];
assign bex_DX = DX_instruction[22];
assign setx_DX = DX_instruction[21];


wire[31:0] XM_instruction;
decoder32 XM_decoder(.out(XM_instruction), .select(opcode_XM), .enable(1'b1));

wire ALU_XM, jump_XM, bne_XM, jal_XM, jr_XM, addi_XM, blt_XM, sw_XM, lw_XM, bex_XM, setx_XM;

assign ALU_XM = XM_instruction[0];
assign jump_XM = XM_instruction[1];
assign bne_XM = XM_instruction[2];
assign jal_XM = XM_instruction[3];
assign jr_XM = XM_instruction[4];
assign addi_XM = XM_instruction[5];
assign blt_XM = XM_instruction[6];
assign sw_XM = XM_instruction[7];
assign lw_XM = XM_instruction[8];
assign bex_XM = XM_instruction[22];
assign setx_XM = XM_instruction[21];

wire[31:0] MW_instruction;
decoder32 MW_decoder(.out(MW_instruction), .select(opcode_MW), .enable(1'b1));

wire ALU_MW, jump_MW, bne_MW, jal_MW, jr_MW, addi_MW, blt_MW, sw_MW, lw_MW, bex_MW, setx_MW;

assign ALU_MW = MW_instruction[0];
assign jump_MW = MW_instruction[1];
assign bne_MW = MW_instruction[2];
assign jal_MW = MW_instruction[3];
assign jr_MW = MW_instruction[4];
assign addi_MW = MW_instruction[5];
assign blt_MW = MW_instruction[6];
assign sw_MW = MW_instruction[7];
assign lw_MW = MW_instruction[8];
assign bex_MW = MW_instruction[22];
assign setx_MW = MW_instruction[21];


// ----------- ALUinA_bypass ------------



assign ALUinA_bypass[0] = (((ALUregA === MW_rd) & (ALU_MW | addi_MW | lw_MW)) & !tempBypassHelper1) | ALUinA_zero_bypass;
wire tempBypassHelper1 = (ALUregA === XM_rd) & (ALU_XM | addi_XM | lw_XM);
assign ALUinA_bypass[1] = (((ALUregA === XM_rd) & (ALU_XM | addi_XM | lw_XM))) | ALUinA_zero_bypass;

// ----------- ALUinA special bypasses ------------

assign ALUinA_zero_bypass = ((ALUregA === 5'b0) & (ALUregA === XM_rd) & (ALU_XM | addi_XM | lw_XM)) | ((ALUregA === 5'b0) & (ALUregA === MW_rd) & (ALU_MW | addi_MW | lw_MW));



// ----------- ALUinB_bypass ------------

assign ALUinB_bypass[0] = (((ALUregB === MW_rd) & (ALU_MW | addi_MW | lw_MW | jr_MW)) & !tempBypassHelper2) | ALUinB_zero_bypass;
wire tempBypassHelper2 = (ALUregB === XM_rd) & (ALU_XM | addi_XM | lw_XM | jr_XM);
assign ALUinB_bypass[1] = ((ALUregB === XM_rd) & (ALU_XM | addi_XM | lw_XM | jr_XM)) | ALUinB_zero_bypass;

// ----------- ALUinB_zero_bypass ------------

assign ALUinB_zero_bypass = ((ALUregB === 5'b0) & (ALUregB === XM_rd) & (ALU_XM | addi_XM | lw_XM | jr_XM)) | ((ALUregB === 5'b0) & (ALUregB === MW_rd) & (ALU_MW | addi_MW | lw_MW));

// ----------- RAM_data_bypass ------------

assign RAM_data_bypass = (XM_rd === MW_rd) & (sw_XM);
assign RAM_data_bypass_2 = 1'b0;
// assign RAM_data_bypass_2 = (DX_rd === MW_rd) & (sw_DX);

// ----------- stallSignalB ------------

assign stallSignalB = (lw_DX) & ((DX_rd === FD_rs1) | ((DX_rd === FD_rs2) & (!( (!FD_opcode[4]) & (!FD_opcode[3]) & (FD_opcode[2]) & (FD_opcode[1]) & (FD_opcode[0])) )));
// assign stallSignalB = 1'b0;
// assign stallSignalB = lw_DX;




endmodule