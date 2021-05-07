
module counter(
  input          clk100_i,
  input          rstn_i,
  input   [9:0]  sw_i,
  input   [1:0]  key_i,
  output  [9:0]  ledr_o,
  output  [6:0]  hex1_o,
  output  [6:0]  hex0_o
);


reg  [7:0]  counter;
reg  [9:0]  register_data;
reg         sw_event;
wire        synced_btn;
wire        synced_event;

assign ledr_o = register_data;

decoder d1 (
  .counter_i ( counter[3:0] ),
  .hex_o     ( hex0_o       )
);

decoder d2 (
  .counter_i ( counter[7:4] ),
  .hex_o     ( hex1_o       )
);

button_sync bs1(
  .clk100_i        ( clk100_i   ),
  .btn_i           ( key_i[0]   ),
  .btn_was_pressed ( synced_btn )
);

button_sync bs2(
  .clk100_i        ( clk100_i     ),
  .btn_i           ( sw_event     ),
  .btn_was_pressed ( synced_event )
);

always @( sw_i ) begin
  if (sw_i[0]^sw_i[1]^sw_i[2]^sw_i[3]
      ^sw_i[4]^sw_i[5]^sw_i[6]^sw_i[7]
      ^sw_i[8]^sw_i[9] == 1'b1) sw_event = 1'b1;
  else sw_event = 1'b0;
end


always @( posedge clk100_i or negedge key_i[1] or negedge rstn_i) begin
  if ( ~key_i[1] || ~rstn_i)
  begin
    counter    <= 8'b0;
    register_data <= 10'b0;
  end
  else begin
    if ( synced_btn )begin
      register_data <= sw_i[9:0];
      if (synced_event) counter <= counter + 1;
    end
  end
end




endmodule

