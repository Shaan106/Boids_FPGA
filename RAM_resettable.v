module RAM_resettable #(
    parameter DEPTH = 1024,
    parameter ADDR_WIDTH = 10
) (clk,we,write_addr,write_data,read_addr,read_data,reset);

    input clk, we, reset;
    input [ADDR_WIDTH-1:0] write_addr, read_addr;
    input write_data;
    output read_data;
    
    // Control which RAM we're writing to
    reg current_ram = 0;
    
    reg read_data_reg_1;
    reg read_data_reg_2;
    assign read_data = current_ram ? read_data_reg_1 : read_data_reg_2;
    
    localparam 
        TEST_DEPTH = 16,
        TEST_ADDR_WIDTH = 4;
        

    // Two RAMs, one being written/read and one being reset
    reg ram1 [0:DEPTH-1];
    reg ram2 [0:DEPTH-1];
    
//    reg ram1 [0:TEST_DEPTH-1];
//    reg ram2 [0:TEST_DEPTH-1];
    
    wire [TEST_ADDR_WIDTH-1:0] TEST_write_addr, TEST_read_addr;
    assign TEST_write_addr = write_addr[TEST_ADDR_WIDTH-1:0];
    assign TEST_read_addr = read_addr[TEST_ADDR_WIDTH-1:0];

    // Track address we're resetting right now
    reg [ADDR_WIDTH-1:0] reset_addr = 0;
//    reg [TEST_ADDR_WIDTH-1:0] reset_addr = 0;

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
//                ram1[TEST_write_addr] <= write_data;
        end else begin
            ram1[reset_addr] <= 0; // reset unused RAM
            if (we)
                ram2[write_addr] <= write_data;
//                ram2[TEST_write_addr] <= write_data;
        end
        reset_addr <= reset_addr + 1;
    end

    // Read
    always @(posedge clk) begin
        read_data_reg_1 <= ram1[read_addr];
        read_data_reg_2 <= ram2[read_addr];
    end

endmodule