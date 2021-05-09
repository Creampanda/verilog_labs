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



module transmitter_tb(

  );

localparam CLK_FREQ_MHZ = 100;
localparam CLK_SEMIPERIOD = (1000/CLK_FREQ_MHZ/2);

reg clk100_i;
reg rstn_i;
reg start;
reg data;
wire busy;
wire tx;

transmitter dut(
  .clk100_i (clk100_i),
  .rstn_i (rstn_i),
  .start (start),
  .data (data),
  .busy (busy),
  .tx (tx)
);


initial begin
  rstn_i = 1'b1;
  #20
  rstn_i = 1'b0;
  data = 8'b1111_0000;
  #20
  start_i = 1'b1;
  #20
  start_i = 1'b0;
  #500
  data = 8'b1111_0000;
  #20
  start_i = 1'b1;
  #20
  start_i = 1'b0;

end

initial begin
  clk100_i = 1'b0;
  forever #CLK_SEMIPERIOD clk100_i = ~clk100_i;  
end




endmodule
