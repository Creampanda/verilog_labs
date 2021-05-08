`timescale 1ns / 10ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.05.2020 11:53:49
// Design Name: 
// Module Name: stopwatch_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module second_counter_tb(

  );

localparam CLK_FREQ_MHZ = 100;
localparam CLK_SEMIPERIOD = (1000/CLK_FREQ_MHZ/2);

reg  clk100_i;
reg  rstn_i;
reg  start_i;
wire second_passed;

second_counter dut (
  .clk100_i       (clk100_i),
  .rstn_i         (rstn_i),
  .start_i        (start_i),
  .second_passed_o  (second_passed)
);

initial begin
  #100
  start_i = 1'b1;
  #100
  start_i = 1'b0;

end

initial begin
  clk100_i = 1'b0;
  forever #CLK_SEMIPERIOD clk100_i = ~clk100_i;  
end

endmodule
