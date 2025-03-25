// Testbench for 4:1 MUX
module mux_4to1_tb;
    logic [3:0] D;
    logic [1:0] S;
    logic Y;

    // Instantiate the MUX
    mux_4to1 dut(.D(D), .S(S), .Y(Y));

    initial begin
        $monitor("D=%b S=%b | Y=%b", D, S, Y);
        
        // Test different cases
        D = 4'b1010; S = 2'b00; #10;
        D = 4'b1010; S = 2'b01; #10;
        D = 4'b1010; S = 2'b10; #10;
        D = 4'b1010; S = 2'b11; #10;
        
        $finish;
    end
endmodule
