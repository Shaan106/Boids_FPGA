module CLA_L2_block (c8, c16, c24, c32, g, p, cIn);
    input[31:0] g, p;
    input cIn;
    output c8, c16, c24, c32;

    /// ------------------------ SECTION c8 -------------------------------

    //P0 = p7p6p5...p2p1p0
    wire P0;
    and P0_and(P0, p[7], p[6], p[5], p[4], p[3], p[2], p[1], p[0]);

    //G0 = g7 + p7g6 + p7p6g5 +...+ p7p6p5p4p3p2p1g0
    wire G0;
    wire aa, ab, ac, ad, ae, af, ag;
    and aa_and(aa, p[7], g[6]);
    and ab_and(ab, p[7], p[6], g[5]);    
    and ac_and(ac, p[7], p[6], p[5], g[4]);
    and ad_and(ad, p[7], p[6], p[5], p[4], g[3]);
    and ae_and(ae, p[7], p[6], p[5], p[4], p[3], g[2]);
    and af_and(af, p[7], p[6], p[5], p[4], p[3], p[2], g[1]);
    and ag_and(ag, p[7], p[6], p[5], p[4], p[3], p[2], p[1], g[0]);

    or G0_or(G0, g[7], aa, ab, ac, ad, ae, af, ag);

    //c8 = G0 + P0c0
    wire ah;
    and P0c0_and(ah, P0, cIn);
    or c8_or(c8, G0, ah);

    /// ------------------------ SECTION c16 -------------------------------

    //P1 = p15p14p13...p10p9p8
    wire P1;
    and P1_and(P1, p[15], p[14], p[13], p[12], p[11], p[10], p[9], p[8]);

    //G1 = g15 + p15g14 + p15p14g13 +...+ p15p14p13p12p11p10p9g8
    wire G1;
    wire ba, bb, bc, bd, be, bf, bg;
    and ba_and(ba, p[15], g[14]);
    and bb_and(bb, p[15], p[14], g[13]);    
    and bc_and(bc, p[15], p[14], p[13], g[12]);
    and bd_and(bd, p[15], p[14], p[13], p[12], g[11]);
    and be_and(be, p[15], p[14], p[13], p[12], p[11], g[10]);
    and bf_and(bf, p[15], p[14], p[13], p[12], p[11], p[10], g[9]);
    and bg_and(bg, p[15], p[14], p[13], p[12], p[11], p[10], p[9], g[8]);

    or G1_or(G1, g[15], ba, bb, bc, bd, be, bf, bg);

    //c16 = G1 + P1G0 + P1P0c0
    wire bh, bi;
    and bh_and(bh, P1, G0);
    and bi_and(bi, P1, P0, cIn);

    or c16_or(c16, G1, bh, bi);

    /// ------------------------ SECTION c24 -------------------------------

    //P2 = (p15p14p13...p10p9p8) indexes plus 8 -> 23-16
    wire P2;
    and P2_and(P2, p[23], p[22], p[21], p[20], p[19], p[18], p[17], p[16]);

    //G2 = (g15 + p15g14 + p15p14g13 +...+ p15p14p13p12p11p10p9g8) indexes plus 8 -> 23-16
    wire G2;
    wire ca, cb, cc, cd, ce, cf, cg;

    and ca_and(ca, p[23], g[22]);
    and cb_and(cb, p[23], p[22], g[21]);    
    and cc_and(cc, p[23], p[22], p[21], g[20]);
    and cd_and(cd, p[23], p[22], p[21], p[20], g[19]);
    and ce_and(ce, p[23], p[22], p[21], p[20], p[19], g[18]);
    and cf_and(cf, p[23], p[22], p[21], p[20], p[19], p[18], g[17]);
    and cg_and(cg, p[23], p[22], p[21], p[20], p[19], p[18], p[17], g[16]);

    or G2_or(G2, g[23], ca, cb, cc, cd, ce, cf, cg);

    //c24 = G2 + P2G1 + P2P1G0 + P2P1P0c0
    wire ch, ci, cj;
    and ch_and(ch, P2, G1);
    and ci_and(ci, P2, P1, G0);
    and cj_and(cj, P2, P1, P0, cIn);

    or c24_or(c24, G2, ch, ci, cj);
    
    // ------------------------ SECTION c32 -------------------------------

    
    //P3 = (p15p14p13...p10p9p8) indexes plus 8 -> 31-24
    wire P3;
    and P3_and(P3, p[31], p[30], p[29], p[28], p[27], p[26], p[25], p[24]);

    //G3 = (g15 + p15g14 + p15p14g13 +...+ p15p14p13p12p11p10p9g8) indexes plus 8 -> 31-24
    wire G3;
    wire da, db, dc, dd, de, df, dg;

    and da_and(da, p[31], g[30]);
    and db_and(db, p[31], p[30], g[29]);    
    and dc_and(dc, p[31], p[30], p[29], g[28]);
    and dd_and(dd, p[31], p[30], p[29], p[28], g[27]);
    and de_and(de, p[31], p[30], p[29], p[28], p[27], g[26]);
    and df_and(df, p[31], p[30], p[29], p[28], p[27], p[26], g[25]);
    and dg_and(dg, p[31], p[30], p[29], p[28], p[27], p[26], p[25], g[24]);

    or G3_or(G3, g[31], da, db, dc, dd, de, df, dg);

    //c32 = G3 + P3G2 + P3P2G1 + P3P2P1G0 + P3P2P1P0c0
    wire dh, di, dj, dk;
    and dh_and(dh, P3, G2);
    and di_and(di, P3, P2, G1);
    and dj_and(dj, P3, P2, P1, G0);
    and dk_and(dk, P3, P2, P1, P0, cIn);

    or c32_or(c32, G3, dh, di, dj, dk);

endmodule