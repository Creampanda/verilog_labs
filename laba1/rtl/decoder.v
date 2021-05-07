
module decoder(
  input  [9:0] sw_i,
  output reg [6:0] hex_o,
  output [3:0] dc1_o,
  output [3:0] dc2_o,
  output [3:0] f_o
);


// wire dc1_o;
// wire dc2_o;
// wire f_o;
reg  [3:0] dc_dec;
assign dc1_o = (sw_i[3:1] == 3'b101) + (sw_i[2:0] == 3'b101);
assign dc2_o = (sw_i[7:4] ^ 4'b0011);
assign f_o = sw_i[0] || sw_i[1] & sw_i[2] || sw_i[3];



always @( * ) begin
  case ( sw_i[9:8] )
    2'd0  : dc_dec = dc1_o;
    2'd1  : dc_dec = dc2_o;
    2'd2  : dc_dec = f_o;
    2'd3  : dc_dec = sw_i[3:0];
  endcase
  case ( dc_dec )
    4'd0  : hex_o = 7'b100_0000;
    4'd1  : hex_o = 7'b111_1001;
    4'd2  : hex_o = 7'b010_0100;
    4'd3  : hex_o = 7'b011_0000;
    4'd4  : hex_o = 7'b001_1001;
    4'd5  : hex_o = 7'b001_0010;
    4'd6  : hex_o = 7'b000_0010;
    4'd7  : hex_o = 7'b111_1000;
    4'd8  : hex_o = 7'b000_0000;
    4'd9  : hex_o = 7'b001_0000;
    4'd10 : hex_o = 7'b000_1000;
    4'd11 : hex_o = 7'b000_0011;
    4'd12 : hex_o = 7'b100_0110;
    4'd13 : hex_o = 7'b010_0001;
    4'd14 : hex_o = 7'b000_0110;
    4'd15 : hex_o = 7'b000_1110;
  endcase
end


endmodule
