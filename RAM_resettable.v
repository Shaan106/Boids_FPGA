module RAM_resettable #(
    parameter DEPTH = 1024,
    parameter ADDR_WIDTH = 10
) (clk,we,write_addr,write_data,read_addr,read_data,reset,LED,reset_pause);

    input clk, we, reset;
    input [ADDR_WIDTH-1:0] write_addr, read_addr;
    input write_data;
    output read_data;

    input [15:0] LED;
    input reset_pause;
    
    // Control which RAM we're writing to
    reg current_ram = 0;
    
    // reg read_data_reg_1;
    // reg read_data_reg_2;
    // assign read_data = current_ram ? read_data_reg_1 : read_data_reg_2;

    // Two RAMs, one being written/read and one being reset
    // reg ram1 [0:DEPTH-1];
    // reg ram2 [0:DEPTH-1];

    // ------------ ram1 ------------

    wire ram1_we; //set
    wire [ADDR_WIDTH-1:0] ram1_addr;
    wire ram1_dataIn, ram1_dataOut;
    RAM #(
        .DATA_WIDTH(1),
        .ADDRESS_WIDTH(ADDR_WIDTH),
        .DEPTH(DEPTH)
    ) ram1 (.clk(clk), 
            .wEn(ram1_we), 
            .addr(ram1_addr), 
            .dataIn(ram1_dataIn), 
            .dataOut(ram1_dataOut)
            );

    // ------------ ram2 ------------

    wire ram2_we; //set
    wire [ADDR_WIDTH-1:0] ram2_addr;
    wire ram2_dataIn, ram2_dataOut;
    RAM #(
        .DATA_WIDTH(1),
        .ADDRESS_WIDTH(ADDR_WIDTH),
        .DEPTH(DEPTH)
    ) ram2 (.clk(clk), 
            .wEn(ram2_we), 
            .addr(ram2_addr), 
            .dataIn(ram2_dataIn), 
            .dataOut(ram2_dataOut)
            );

    // setting current ram to the correct current RAM
    // Swap RAMs when reset is high
    // always @(posedge clk) begin
    //     if (reset) begin
    //         current_ram <= ~current_ram;
    //     end
    // end

    always @(posedge reset) begin 
        current_ram <= ~current_ram;
    end

    // Track address we're resetting right now
    reg [ADDR_WIDTH-1:0] reset_addr = 0;
    always @(posedge clk) begin
    
        if (reset_pause) begin
            reset_addr = reset_addr + 1;
        end else begin 
            reset_addr = 0;
        end
    end

    // reading from the correct RAM
    assign read_data = (current_ram) ? ram2_dataOut : ram1_dataOut;

    // writing corect data to correct RAM
    assign ram1_dataIn = (current_ram) ? 1'b0 : write_data; // if current ram is 0 then write new boid to ram1
    assign ram2_dataIn = (current_ram) ? write_data : 1'b0; // if current ram is 1 then write new boid to ram2
    
//    assign ram1_dataIn = write_data;
//    assign ram2_dataIn = write_data;
    
    // write reset data val if not current ram.

    // read/write address
    wire[ADDR_WIDTH-1:0] ram1_read_addr, ram1_write_addr;
    assign ram1_read_addr = read_addr;
    assign ram1_write_addr = (current_ram) ? reset_addr : write_addr; //if reset RAM = 0 then write reset_addr.
    assign ram1_addr = (ram1_we) ? ram1_write_addr : ram1_read_addr;

    wire[ADDR_WIDTH-1:0] ram2_read_addr, ram2_write_addr;
    assign ram2_read_addr = read_addr;
    assign ram2_write_addr = (current_ram) ? write_addr:reset_addr; //if reset RAM = 1 then write addr = reset_addr, ow write_addr
    assign ram2_addr = (ram2_we) ? ram2_write_addr : ram2_read_addr;


    // write enables

    wire reset_RAM; //which ram is being reset
    assign reset_RAM = ~current_ram; 

    //ram 1 we when
    // reset RAM = 0 or current RAM = 0 and we
    assign ram1_we = (~reset_RAM) | ((~current_ram) & we); 

    assign ram2_we = (reset_RAM) | ((current_ram) & we); 
    
//    assign LED[8] = ram1_dataOut;
//    assign LED[9] = ram2_dataOut;

//    assign LED[10] = reset_RAM;
//    assign LED[11] = current_ram;
//    assign LED[12] = we;
//    assign LED[13] = ram1_we;
//    assign LED[14] = ram2_we;


endmodule