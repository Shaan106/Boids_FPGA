`define VIDEO_WIDTH 640,                                        // Standard VGA Width
`define VIDEO_HEIGHT 480;                                       // Standard VGA Height
`define PIXEL_COUNT `VIDEO_WIDTH*`VIDEO_HEIGHT,                 // Number of pixels on the screen
`define PIXEL_ADDRESS_WIDTH $clog2(`PIXEL_COUNT) + 1,           // Use built in log2 command
`define BITS_PER_COLOR 12, 	  								                  // Nexys A7 uses 12 bits/color
`define PALETTE_COLOR_COUNT 256, 								                // Number of Colors available
`define PALETTE_ADDRESS_WIDTH $clog2(`PALETTE_COLOR_COUNT) + 1; // Use built in log2 Command
`define NUM_BOIDS 32;
`define MARGIN 100 * `PIXEL_SIZE;

`define INT_SIZE 32;
`define BOID_SIZE 4 * INT_SIZE;
`define BPU_SIZE `NUM_BOIDS * `BOID_SIZE;


module BPU(clock, x_loc, y_loc, screenEnd_out, address);

    input clock;
    // 50 MHz clock

    output[9:0] x_loc;  // output location to draw the pixel
    output[8:0] y_loc;

    input screenEnd_out;
    output[`PIXEL_ADDRESS_WIDTH-1:0] address; // TODO: what is this

    reg[9:0] x_reg = 9'd10;
    reg[8:0] y_reg = 8'd10;

    reg[`PIXEL_ADDRESS_WIDTH-1:0] address_reg;

     assign x_loc = x_reg;
     assign y_loc = y_reg;

//    assign x_loc = 9'd10;
//    assign y_loc = 8'd10;

    reg[`BOID_SIZE-1:0] boids;

    always @(posedge screenEnd_out) begin
        x_reg <= x_reg + 1;
        y_reg <= y_reg + 1;
    end


    always @(posedge clock) begin
        
        address_reg <= x_loc + 640 * y_loc; // 640 is the width of the screen, can do this w 2 bit shifts and an add

        // x_reg <= x_reg + 1;
        // y_reg <= y_reg + 1;

//        x_loc <= x_loc + 1;
//        y_loc <= y_loc + 1;
            
        // address_reg = x_loc + 640 * y_loc; // 640 is the width of the screen, can do this w 2 bit shifts and an add
        // *Note* assuming that boids have been initialized to a random position and velocity

        // select active boid

        // get neighbors (bracket) - calculate distance to each boid, compare pairs, pass through min dis + idx, repeat until 16, then retrieve boids

        // fly_center

        // avoid_others

        // match_velocity

        // keep_within_bounds

        // limit_speed

        // update velocity & position
    end

    assign address = address_reg;

    reg dx;
    reg dy;

endmodule

module keep_within_bounds(input boid_x, input boid_y, output bx, output by);
    localparam
    TURN_FACTOR = 0.1
    LEFT_BO
    // if boid_x < margin, new_x = 0

    // if boid_x > 640 - margin, new_x =
    // if boid_y < 0, new_y = 0
    // if boid_y > 480, new_y = 480
endmodule

module limit_speed(input old_dx, input old_dy, output new_dx, output new_dy);
    localparam
    MAX_SPEED = 5
    // if sqrt(old_dx^2 + old_dy^2) > MAX_SPEED, scale down
    wire abs_dx, abs_dy, magnitude, log_magnitude, shift;
    // TODO: all of this is copilot, integrate with the rest of the code
    abs abs_dx(.in(old_dx), .out(abs_dx));
    abs abs_dy(.in(old_dy), .out(abs_dy));
    add add(.a(abs_dx), .b(abs_dy), .out(magnitude));
    log2 log2(.in(magnitude), .out(log_magnitude));
    assign shift = log_magnitude - MAX_SPEED;
    shift_right shift_right(.in(old_dx), .shift(shift), .out(new_dx));
    shift_right shift_right(.in(old_dy), .shift(shift), .out(new_dy));
endmodule

module fly_towards_center(input boid_x, input boid_y, input neighbors, output new_dx, output new_dy);
    localparam
    TURN_FACTOR = 7;
    wire center_x, center_y; // TODO: implement (i don't think we need to use funky avg is there is always power of 2 neighbors)

    // do bracket sum on x / y

    // shift right by log2 of number of neighbors

    assign new_dx = (center_x - boid_x) >> TURN_FACTOR;
    assign new_dy = (center_y - boid_y) >> TURN_FACTOR;
endmodule

module avoid_others(input boid_x, input boid_y, input neighbors, output new_dx, output new_dy)
    localparam
    TURN_FACTOR = 4;
    wire avoid_x, avoid_y; // TODO: implement

    // calculate distance to each neighbor and put into new array (dis = 0, if too far)

    // do bracket sum

    assign new_dx = (boid_x - avoid_x) >> TURN_FACTOR;
    assign new_dy = (boid_y - avoid_y) >> TURN_FACTOR;
endmodule

module match_velocity(input neighbors, output new_dx, output new_dy);
    localparam
    TURN_FACTOR = 2;
    wire avg_dx, avg_dy; // TODO: implement

    // do bracket sum on vx & vy

    // shift right by log2 of number of neighbors

    assign new_dx = (avg_dx - boid_x) >> TURN_FACTOR;
    assign new_dy = (avg_dy - boid_y) >> TURN_FACTOR;
endmodule