// Testbench for 1-to-4 Demux
module demux_1to4_tb;
    logic D;
    logic [1:0] S;
    logic En;
    logic [3:0] Y;

    // Instantiate the 1-to-4 Demux
    demux_1to4 uut(.D(D), .S(S), .En(En), .Y(Y));

    initial begin
        $monitor("Time=%0t | D=%b | S=%b | En=%b | Y=%b", $time, D, S, En, Y);

        // Test cases
        D = 1; S = 2'b00; En = 1; #10;
        D = 1; S = 2'b01; En = 1; #10;
        D = 1; S = 2'b10; En = 1; #10;
        D = 1; S = 2'b11; En = 1; #10;

        // Disable test
        D = 1; S = 2'b10; En = 0; #10;

        $finish;
    end
endmodule
