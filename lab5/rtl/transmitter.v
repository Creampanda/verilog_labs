module transmitter (
  input               clk100_i,
  input               rstn_i,
  input               start,
  input       [7:0]   data,
  output              busy,
  output reg  [7:0]   tx
);

wire second_passed;
wire device_running;

stopwatch s1 (
  .clk100_i       (clk100_i),
  .rstn_i         (rstn_i),
  .start          (start),
  .second_passed  (second_passed),
  .device_running (device_running)
);

assign busy = device_running;

always @( posedge clk100_i or negedge rstn_i ) begin
  if ( ~rstn_i ) begin
    tx            <= 8'b0;
  end
  else begin
    if ( second_passed ) begin
      tx   <= data;
    end
  end
end

endmodule
