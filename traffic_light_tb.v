module traffic_light_tb;

// Declare inputs as reg, outputs as wire
reg clk, rst;
wire red, yellow, green;

// Instantiate the design
traffic_light uut (
    .clk(clk),
    .rst(rst),
    .red(red),
    .yellow(yellow),
    .green(green)
);

// Clock generation — toggles every 5ns = 10ns period
always #5 clk = ~clk;

initial begin
    // Initialize
    clk = 0;
    rst = 1;
    
    // Apply reset for 10ns
    #10 rst = 0;
    
    // Run simulation for 300ns
    #300;
    
    $display("Simulation Complete!");
    $finish;
end

// Monitor outputs
initial begin
    $monitor("Time=%0t | RST=%b | RED=%b | YELLOW=%b | GREEN=%b",
              $time, rst, red, yellow, green);
end

// Dump waveform
initial begin
    $dumpfile("traffic_light.vcd");
    $dumpvars(0, traffic_light_tb);
end

endmodule