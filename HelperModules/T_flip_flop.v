module T_flip_flop (
    T, clock, reset, Q, notQ
);
    //input t - toggle, c - clock
    //output q, !q

    input T, clock, reset;
    output Q, notQ;

    // maintains its value, if t = 1 then toggles value

    wire D_out;

    wire D_in;
    assign D_in = ((!T) & D_out) | (T & (!D_out));

    dffe_ref myFavoriteStorageFridge(.q(D_out), .d(D_in), .clk(clock), .en(1'b1), .clr(reset));

    assign Q = D_out;
    assign notQ = !D_out;

endmodule