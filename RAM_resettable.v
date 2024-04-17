module RAM_resettable #(
    parameter DEPTH = 1024,
    parameter ADDR_WIDTH = 10
) (clk,we,write_addr,write_data,read_addr,read_data,reset);

    input clk, we, reset;
    input [ADDR_WIDTH-1:0] write_addr, read_addr;
    input write_data;
    output read_data;
    
    reg read_data_reg;
    assign read_data = read_data_reg;

    // Two RAMs, one being written/read and one being reset
    reg[DEPTH-1:0] ram1;
    reg[DEPTH-1:0] ram2;

    // Control which RAM we're writing to
    reg current_ram = 0;
    // Track address we're resetting right now
    reg [ADDR_WIDTH-1:0] reset_addr = 0;

    // Swap RAMs when reset is high
    always @(posedge clk) begin
        if (reset) begin
            current_ram <= ~current_ram;
        end
    end

    // Write / reset
    always @(posedge clk) begin
        if (current_ram) begin
            ram2[reset_addr] <= 0; // reset unused RAM
            if (we)
                ram1[write_addr] <= write_data;
        end else begin
            ram1[reset_addr] <= 0; // reset unused RAM
            if (we)
                ram2[write_addr] <= write_data;
        end
        reset_addr <= reset_addr + 1;
    end

    // Read
    always @(posedge clk) begin
        if (current_ram)
            read_data_reg <= ram1[read_addr];
        else
            read_data_reg <= ram2[read_addr];
    end

endmodule