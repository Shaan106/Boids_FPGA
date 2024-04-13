
module BPU(clock, x_loc, y_loc, addr_enable, address);

    input clock;
    // 50 MHz clock

    output[9:0] x_loc;
    output[8:0] y_loc;

    input addr_enable;
    output[11:0] address; 

    reg[9:0] x_reg;
    reg[8:0] y_reg;

    reg[11:0] address_reg;

    // assign x_loc = x_reg;
    // assign y_loc = y_reg;

    assign x_loc = 9'd100;
    assign y_loc = 8'd100;

    always @(posedge clock) begin
        
        address_reg = x_loc + 640 * y_loc; // 640 is the width of the screen
            
    end

    assign address = address_reg;

    reg dx;
    reg dy;

endmodule
