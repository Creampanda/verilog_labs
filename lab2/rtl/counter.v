/*
10)        ������� �� key[2] ������ ��������� � ��������� ��������.

6)	����������� ��� ��������. ���� ������������� ������ �����������. �������� ��������� �� hex0 hex1.
 sw[11] = 0 ��������� ������� � �����������. Sw[11] = 1 ��������� ������� � �����������.

*/

module counter(
  input                clk100_i,
  input                rstn_i,
  input       [11:0]   sw_i,
  input       [2:0]    key_i,
  output      [9:0]    ledr_o,
  output reg  [6:0]    hex1_o,
  output reg  [6:0]    hex0_o
);

reg  [7:0]  counter_up;
reg  [7:0]  counter_down;
reg  [9:0]  register_data;
reg  [1:0]  btn0_sync;
reg  [1:0]  btn2_sync;
wire        btn0_pressed;
wire        btn2_pressed;

assign ledr_o = register_data;

always @( posedge clk100_i or negedge key_i[1] ) begin
  if ( ~key_i[1] )
    btn0_sync[1:0] <= 2'b0;
  else begin
    btn0_sync[0]   <= ~key_i[0];
    btn0_sync[1]   <= btn0_sync[0];
  end
end

assign btn0_pressed = ~btn0_sync[1] & btn0_sync[0];


always @( posedge clk100_i or negedge key_i[1] ) begin
  if ( ~key_i[1] )
    btn2_sync[1:0] <= 2'b0;
  else begin
    btn2_sync[0]   <= ~key_i[2];
    btn2_sync[1]   <= btn2_sync[0];
  end
end

assign btn2_pressed = ~btn2_sync[1] & btn2_sync[0];


always @( posedge clk100_i or negedge key_i[1] ) begin
  if ( ~key_i[1] )
  begin
    counter_up    <= 8'b0;
    counter_down  <= 8'b0;
    register_data <= 10'b0;
  end
  else if ( btn0_pressed )
  begin
    register_data <= sw_i[9:0];
    counter_down  <= counter_down - 1;
    counter_up    <= counter_up + 1;
  end
  else if ( btn2_pressed )
  begin
    counter_down <= 8'b0;
    counter_up   <= 8'b0;
  end
end

always@( * ) begin
  if ( sw_i[11] )
  begin
    case ( counter_down[3:0] )      
      4'd0  : hex0_o = 7'b100_0000;
      4'd1  : hex0_o = 7'b111_1001;
      4'd2  : hex0_o = 7'b010_0100;
      4'd3  : hex0_o = 7'b011_0000;
      4'd4  : hex0_o = 7'b001_1001;
      4'd5  : hex0_o = 7'b001_0010;
      4'd6  : hex0_o = 7'b000_0010;
      4'd7  : hex0_o = 7'b111_1000;
      4'd8  : hex0_o = 7'b000_0000;
      4'd9  : hex0_o = 7'b001_0000;
      4'd10 : hex0_o = 7'b000_1000;
      4'd11 : hex0_o = 7'b000_0011;
      4'd12 : hex0_o = 7'b100_0110;
      4'd13 : hex0_o = 7'b010_0001;
      4'd14 : hex0_o = 7'b000_0110;
      4'd15 : hex0_o = 7'b000_1110;
    endcase
    
    case ( counter_down[7:4] )        
      4'd0  : hex1_o = 7'b100_0000;
      4'd1  : hex1_o = 7'b111_1001;
      4'd2  : hex1_o = 7'b010_0100;
      4'd3  : hex1_o = 7'b011_0000;
      4'd4  : hex1_o = 7'b001_1001;
      4'd5  : hex1_o = 7'b001_0010;
      4'd6  : hex1_o = 7'b000_0010;
      4'd7  : hex1_o = 7'b111_1000;
      4'd8  : hex1_o = 7'b000_0000;
      4'd9  : hex1_o = 7'b001_0000;
      4'd10 : hex1_o = 7'b000_1000;
      4'd11 : hex1_o = 7'b000_0011;
      4'd12 : hex1_o = 7'b100_0110;
      4'd13 : hex1_o = 7'b010_0001;
      4'd14 : hex1_o = 7'b000_0110;
      4'd15 : hex1_o = 7'b000_1110;
    endcase
  end
  else  begin
    case ( counter_up[3:0] )      
      4'd0  : hex0_o = 7'b100_0000;
      4'd1  : hex0_o = 7'b111_1001;
      4'd2  : hex0_o = 7'b010_0100;
      4'd3  : hex0_o = 7'b011_0000;
      4'd4  : hex0_o = 7'b001_1001;
      4'd5  : hex0_o = 7'b001_0010;
      4'd6  : hex0_o = 7'b000_0010;
      4'd7  : hex0_o = 7'b111_1000;
      4'd8  : hex0_o = 7'b000_0000;
      4'd9  : hex0_o = 7'b001_0000;
      4'd10 : hex0_o = 7'b000_1000;
      4'd11 : hex0_o = 7'b000_0011;
      4'd12 : hex0_o = 7'b100_0110;
      4'd13 : hex0_o = 7'b010_0001;
      4'd14 : hex0_o = 7'b000_0110;
      4'd15 : hex0_o = 7'b000_1110;
    endcase
      
    case ( counter_up[7:4] )        
      4'd0  : hex1_o = 7'b100_0000;
      4'd1  : hex1_o = 7'b111_1001;
      4'd2  : hex1_o = 7'b010_0100;
      4'd3  : hex1_o = 7'b011_0000;
      4'd4  : hex1_o = 7'b001_1001;
      4'd5  : hex1_o = 7'b001_0010;
      4'd6  : hex1_o = 7'b000_0010;
      4'd7  : hex1_o = 7'b111_1000;
      4'd8  : hex1_o = 7'b000_0000;
      4'd9  : hex1_o = 7'b001_0000;
      4'd10 : hex1_o = 7'b000_1000;
      4'd11 : hex1_o = 7'b000_0011;
      4'd12 : hex1_o = 7'b100_0110;
      4'd13 : hex1_o = 7'b010_0001;
      4'd14 : hex1_o = 7'b000_0110;
      4'd15 : hex1_o = 7'b000_1110;
    endcase
  end
end


endmodule

