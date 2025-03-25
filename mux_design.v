/////////////////////////
// Author Name: Maheshwari Ratthapuram
// Date: 25.03.2025
// Design Name: 4:1 mux using 2:1 mux
// Description:hierarchical design of 4:1 mux using 2:1 mux
////////////////////////

module mux_2to1(input logic A, B, S, output logic Y);
    assign Y = S ? B : A;
endmodule

// 4:1 MUX using 2:1 MUXes
module mux_4to1(
    input logic [3:0] D,
    input logic [1:0] S,
    output logic Y
);
    logic Y0, Y1;
    
    // First stage MUXes
    mux_2to1 mux0(.A(D[0]), .B(D[1]), .S(S[0]), .Y(Y0));
    mux_2to1 mux1(.A(D[2]), .B(D[3]), .S(S[0]), .Y(Y1));
    
    // Second stage MUX
    mux_2to1 mux2(.A(Y0), .B(Y1), .S(S[1]), .Y(Y));
endmodule

