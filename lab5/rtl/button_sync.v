module button_sync (
  input   clk100_i,
  input   btn_i,
  output  btn_was_pressed
);


reg  [2:0] btn_start_sync;

always @( posedge clk100_i )
begin
  btn_start_sync[0] <= ~btn_i;
  btn_start_sync[1] <= btn_start_sync[0];
  btn_start_sync[2] <= btn_start_sync[1];
end
assign btn_was_pressed = ~btn_start_sync[2] & btn_start_sync[1];

endmodule
