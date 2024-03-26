module pulse_generator (
    input wire clk,       // Clock input
    input wire in_signal, // Input signal
    output wire out_pulse // Output pulse
);

    // Internal signals
    wire q1, q1_bar, q2;
    
    // Instantiating the first D Flip-Flop (captures input signal)

    dffe_ref dff1 (
        .clk(clk),
        .d(in_signal),
        .q(q1),
        .en(1'b1),
        .clr(1'b0)
    );
    
    // Instantiating the second D Flip-Flop (delays the signal by one clock cycle)
    dffe_ref dff2 (
        .clk(clk),
        .d(q1),
        .q(q2),
        .en(1'b1),
        .clr(1'b0)
    );
    
    // AND gate to generate the pulse
    assign out_pulse = q1 & ~q2;

endmodule
