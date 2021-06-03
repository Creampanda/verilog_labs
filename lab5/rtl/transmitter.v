module transmitter (
  input               clk100_i,
  input               rstn_i,
  input               start_i,
  input       [7:0]   data_i,
  output              busy,
  output reg  [7:0]   tx
);

reg [3:0] counter = 4'b0000;
reg device_running = 0;

assign busy = device_running;

always @( posedge clk100_i or negedge rstn_i ) begin
  if ( ~rstn_i ) begin
    tx                <= 0;
    counter           <= 0;
    device_running    <= 0;
  end
  else begin
    if ( start_i == 1'b1 && ~device_running ) begin
      counter        <= 1'b1;
      device_running <= 1'b1;
    end
    else if ( device_running && counter == 4'b1111 ) begin
      tx                <= data_i;
      counter           <= 0;
      device_running    <= 0;
    end
    else if ( device_running ) begin
      counter = counter + 1;
    end
  end
end

endmodule
