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



module fsm_tb(

  );

localparam CLK_FREQ_MHZ = 100;
localparam CLK_SEMIPERIOD = (1000/CLK_FREQ_MHZ/2);

reg clk100_i;
reg  [3:0] abcd;
reg rstn_i;
wire [1:0] current_state;

finite_state_machine DUT(
.clk100_i (clk100_i),
.abcd (abcd),
.rstn_i (rstn_i),
.current_state (current_state)
);

localparam A = 4'b1000;
localparam B = 4'b0100;
localparam C = 4'b0010;
localparam D = 4'b0001;

initial begin
  rstn_i = 1'b0;
  #20
  rstn_i = 1'b1;
  #50
  abcd = A;
  #50
  abcd = C;
  #50
  abcd = B;
  #50
  abcd = C;
  #50
  abcd = B;
  #200
  abcd = A;
end


initial begin
  clk100_i = 1'b0;
  forever #CLK_SEMIPERIOD clk100_i = ~clk100_i;  
end

endmodule
