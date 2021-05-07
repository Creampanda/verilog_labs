`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.05.2020 14:40:35
// Design Name: 
// Module Name: counter_tb
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


module decoder_tb(

  );

  reg   [9:0]  sw_i;
  wire  [6:0]  hex_o;
  wire  [3:0]  dc1_o;
  wire  [3:0]  dc2_o;
  wire  [3:0]  f_o;

  decoder DUT (
    .sw_i  ( sw_i  ),
    .hex_o ( hex_o ),
    .dc1_o ( dc1_o ),
    .dc2_o ( dc2_o ),
    .f_o   ( f_o   )
  );

    initial begin
      sw_i = 10'b11111_11111;
      #20
      sw_i = 10'b01111_11111;
      #20
      sw_i = 10'b10111_11111;
      #20
      sw_i = 10'b00111_11111;
      #20
      sw_i = 10'b00111_11010;
      #20
      sw_i = 10'b00111_11111;
      #20
      sw_i = 10'b00111_10101;
      #20
      sw_i = 10'b10001_11111;

    end

endmodule
