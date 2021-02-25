`timescale 1 ps/1 ps
`default_nettype none

`define CLKH 20_000 // 125MHz

module sim_top ();

initial begin
    $dumpfile("sim_top.fst");
    $dumpvars;
end

// Oscillator
reg clk_active = 0;
reg clk = 0;
always #`CLKH if (clk_active) clk = !clk;

initial begin
    # 200e6 // Wait for hypperam power on
    # 0 clk_active = 1;

    // Bound simulation time
    # 50_000_000_000 $fatal(1, "Simulation timed out");
end

top t (
    .clk(clk)
);

endmodule
