// 8-bit look ahead adder to add 
module CLA_L1_block (carryBits, g, p, cIn);
    input[7:0] g, p;
    input cIn;
    output[7:0] carryBits;

    //c0
    assign carryBits[0] = cIn;

    //c1 = g0 + p0c0
    wire a0;
    and a0_and(a0, p[0], cIn);
    or c1_or(carryBits[1], g[0], a0);

    //c2 = g1 + p1c1
    //c2 = g1 + p1g0 + p1p0c0
    wire a, b;
    and a_and(a, p[1], g[0]);
    and b_and(b, p[1], p[0], cIn);
    or c2_or(carryBits[2], g[1], a, b);

    //c3 = g2 + p2c2
    //c3 = g2 + p2g1 + p2p1g0 + p2p1p0c0
    wire c, d, e;
    and c_and(c, p[2], g[1]);
    and d_and(d, p[2], p[1], g[0]);
    and e_and(e, p[2], p[1], p[0], cIn);
    or c3_or(carryBits[3], g[2], c, d, e);


    //c4 = g3 + p3c3
    //c4 = g3 + p3g2 + p3p2g1 + p3p2p1g0 + p3p2p1p0c0
    wire f, g1, h, i;
    and f_and(f, p[3], g[2]);
    and g_and(g1, p[3], p[2], g[1]);
    and h_and(h, p[3], p[2], p[1], g[0]);
    and i_and(i, p[3], p[2], p[1], p[0], cIn);
    or c4_or(carryBits[4], g[3], f, g1, h, i);

    //c5 = g4 + p4c4
    //c5 = g4 + p4g3 + p4p3g2 + p4p3p2g1 + p4p3p2p1g0 + p4p3p2p1p0c0
    wire j, k, l, m, n;
    and j_and(j, p[4], g[3]);
    and k_and(k, p[4], p[3], g[2]);
    and l_and(l, p[4], p[3], p[2], g[1]);
    and m_and(m, p[4], p[3], p[2], p[1], g[0]);
    and n_and(n, p[4], p[3], p[2], p[1], p[0], cIn);
    or c5_or(carryBits[5], g[4], j, k, l, m, n);

    //c6 = g5 + p5c5
    //c6 = g5 + p5g4 + p5p4g3 + p5p4p3g2 + p5p4p3p2g1 + p5p4p3p2p1g0 + p5p4p3p2p1p0c0
    wire o, p1, q, r, s, t;
    and t_and(t, p[5], g[4]);
    and o_and(o, p[5], p[4], g[3]);
    and p_and(p1, p[5], p[4], p[3], g[2]);
    and q_and(q, p[5], p[4], p[3], p[2], g[1]);
    and r_and(r, p[5], p[4], p[3], p[2], p[1], g[0]);
    and s_and(s, p[5], p[4], p[3], p[2], p[1], p[0], cIn);
    or c6_or(carryBits[6], g[5], o, p1, q, r, s, t);


    //c7 = g6 + p6c6
    //c7 = g6 + p6g5 + p6p5g4 + p6p5p4g3 + p6p5p4p3g2 + p6p5p4p3p2g1 + p6p5p4p3p2p1g0 + p6p5p4p3p2p1p0c0
    wire u, v, w, hex, y, zed, omeg;
    and u_and(u, p[6], g[5]);
    and v_and(v, p[6], p[5], g[4]);
    and w_and(w, p[6], p[5], p[4], g[3]);
    and hex_and(hex, p[6], p[5], p[4], p[3], g[2]);
    and y_and(y, p[6], p[5], p[4], p[3], p[2], g[1]);
    and zed_and(zed, p[6], p[5], p[4], p[3], p[2], p[1], g[0]);
    and omeg_and(omeg, p[6], p[5], p[4], p[3], p[2], p[1], p[0], cIn);
    or c7_or(carryBits[7], g[6], u, v, w, hex, y, zed, omeg);

endmodule