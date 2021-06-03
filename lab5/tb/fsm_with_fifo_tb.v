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



module fsm_with_fifo_tb(

  );

localparam CLK_FREQ_MHZ = 100;
localparam CLK_SEMIPERIOD = (1000/CLK_FREQ_MHZ/2);

reg       clk100_i;
reg       rstn_i;
reg       btn_i;
wire      full_o;
wire [7:0]    transmit_lane_o;

fsm_with_fifo dut(
  .clk100_i (clk100_i),
  .rstn_i (rstn_i),
  .btn_i (btn_i),
  .full_o (full_o),
  .transmit_lane_o (transmit_lane_o)
);


initial begin
  rstn_i = 1'b0;
  #20
  rstn_i = 1'b1;
  #20
  btn_i = 1'b1;
  #20
  btn_i = 1'b0;
  #20
  btn_i = 1'b1;
  #20
  btn_i = 1'b0;
  #20
  btn_i = 1'b1;
  #20
  btn_i = 1'b0;
  #20
  btn_i = 1'b1;
  #20
  btn_i = 1'b0;
  #20
  btn_i = 1'b1;
  #20
  btn_i = 1'b0;
  #20
  btn_i = 1'b1;
  #20
  btn_i = 1'b0;
  #20
  btn_i = 1'b1;
  #20
  btn_i = 1'b0;
  #20
  btn_i = 1'b1;
  #20
  btn_i = 1'b0;
  #20
  btn_i = 1'b1;
  #20
  btn_i = 1'b0;
  #20
  btn_i = 1'b1;
  #20
  btn_i = 1'b0;


end

initial begin
  clk100_i = 1'b0;
  forever #CLK_SEMIPERIOD clk100_i = ~clk100_i;  
end




endmodule
