/////////////////////////////////////////////////////////////////////////////////
// Author Name: Maheshwari Ratthapuram
// Date: 25.03.2025
// Design Name: 1:4 demux using 1:2 demux
// Description: design of hierarchical 1:4 demux using 1:2 demux
////////////////////////////////////////////////////////////////////////////////

module demux_1to2(input logic D, input logic S, input logic En, output logic Y0, output logic Y1);
    assign Y0 = (En && ~S) ? D : 0;
    assign Y1 = (En && S) ? D : 0;
endmodule

// Hierarchical 1-to-4 Demux Module
module demux_1to4(input logic D, input logic [1:0] S, input logic En, output logic [3:0] Y);
    logic Y0_internal, Y1_internal;

    // First Stage: 1-to-2 Demux
    demux_1to2 stage1(.D(D), .S(S[1]), .En(En), .Y0(Y0_internal), .Y1(Y1_internal));

    // Second Stage: Two 1-to-2 Demuxes
    demux_1to2 stage2(.D(Y0_internal), .S(S[0]), .En(En), .Y0(Y[0]), .Y1(Y[1]));
    demux_1to2 stage3(.D(Y1_internal), .S(S[0]), .En(En), .Y0(Y[2]), .Y1(Y[3]));
endmodule
