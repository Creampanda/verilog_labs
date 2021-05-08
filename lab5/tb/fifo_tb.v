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



module fifo_tb(

  );

localparam CLK_FREQ_MHZ = 100;
localparam CLK_SEMIPERIOD = (1000/CLK_FREQ_MHZ/2);

reg          clk100_i;
reg          rstn_i;
reg   [7:0]  data_i;
reg          we_i;
reg          re_i;
wire  [7:0]  data_o;
wire         full_o;
wire         empty_o;

fifo DUT (
  .clk100_i (clk100_i),
  .rstn_i   (rstn_i),
  .data_i   (data_i),
  .we_i     (we_i),
  .re_i     (re_i),
  .data_o   (data_o),
  .full_o   (full_o),
  .empty_o  (empty_o)
);

initial begin
  rstn_i = 1'b0;
  we_i = 1'b0;
  re_i = 1'b0;
  data_i = 8'b0;
  #20
  rstn_i = 1'b1;
  #50
  data_i = 8'b1111_1111;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  data_i = 8'b1111_0000;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  re_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  re_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  re_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  re_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  re_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  re_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  we_i = 1'b0;
  data_i = 8'b1111_0111;
  #(1000/CLK_FREQ_MHZ)
  re_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  re_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  re_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  re_i = 1'b0;
  #(1000/CLK_FREQ_MHZ)
  re_i = 1'b1;
  #(1000/CLK_FREQ_MHZ)
  re_i = 1'b0;

  
end

initial begin
  clk100_i = 1'b0;
  forever #CLK_SEMIPERIOD clk100_i = ~clk100_i;  
end

endmodule
