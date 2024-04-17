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
        reset_addr <= reset_addr + 1;
    end

    // reading from the correct RAM
    assign read_data = (current_ram) ? ram1_dataOut : ram2_dataOut;

    // writing corect data to correct RAM
    assign ram1_dataIn = (current_ram) ? 1'b0 : write_data; // if current ram is 0 then write new boid to ram1
    assign ram2_dataIn = (current_ram) ? write_data : 1'b0; // if current ram is 1 then write new boid to ram2
    // write reset data val if not current ram.

    // read/write address
    wire[ADDR_WIDTH-1:0] ram1_read_addr, ram1_write_addr;
    assign ram1_read_addr = read_addr;
    assign ram1_addr = (ram1_we) ? ram1_write_addr : ram1_read_addr;

    wire[ADDR_WIDTH-1:0] ram2_read_addr, ram2_write_addr;
    assign ram2_read_addr = read_addr;
    assign ram2_addr = (ram2_we) ? ram2_write_addr : ram2_read_addr;


    // write enables

    wire reset_RAM; //which ram is being reset
    assign reset_RAM = ~current_ram; 

    //ram 1 we when
    // reset RAM = 0 or current RAM = 0 and we
    assign ram1_we = (~reset_RAM) | ((~current_ram) & we); 

    // ram 2 we when
    // reset RAM = 1 or current RAM = 1 and we
    assign ram2_we = (reset_RAM) | ((current_ram) & we); 



    // RAM_resettable #(
	// 	.DEPTH(PIXEL_COUNT), //depth = how many pixels on screen.
	// 	.ADDR_WIDTH(PIXEL_ADDRESS_WIDTH) //address_width = how many bits needed to access that many pixels
	// ) Boid_display_mem(
	// 	.clk(clock),
	// 	.we(writing_to_boids_wire),
	// 	.reset(switchRam),

	// 	.write_addr(boid_address_out),
	// 	.read_addr(boid_read_address_wire),

	// 	.write_data(writing_to_boids_wire), //if we is on, then write data = 1
	// 	.read_data(boid_read_data) //read data is a reg - it's a 1 or 0.
	// );
    


    

    // // Read
    // always @(posedge clk) begin
    //     read_data_reg_1 <= ram1[read_addr];
    //     read_data_reg_2 <= ram2[read_addr];
    // end

endmodule