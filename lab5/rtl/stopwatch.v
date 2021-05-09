module stopwatch(
  input   clk100_i,
  input   rstn_i,
  input   start,
  output  second_passed,
  output reg device_running
);



//Running device

always @( posedge clk100_i )
begin
  if ( start )
    device_running <= 1'b1;
  else if ( second_passed || !rstn_i)
    device_running <= 1'b0;
end

// Counter 
localparam PULSE_WIDTH = 4;
localparam PULSE_MAX = 4'd9;

reg [PULSE_WIDTH - 1:0] pulse_counter = 0;

wire  hundredths_of_second_passed = ( pulse_counter == PULSE_MAX );


always @( posedge clk100_i or negedge rstn_i ) begin
  if ( !rstn_i ) 
  begin
    pulse_counter  <= 0;
  end
  else if ( device_running | hundredths_of_second_passed )
  begin
    if ( hundredths_of_second_passed )
      pulse_counter <= 0;
    else
      pulse_counter <= pulse_counter + 1;
  end
end

wire  tenths_of_second_passed;
wire  [3:0]  hund_counter;
wire  [3:0]  tth_counter;

s_counter hundredths_counter(
  .clk100_i             (clk100_i),
  .rstn_i               (rstn_i),
  .smallest_part_passed (hundredths_of_second_passed),
  .biggest_part_passed  (tenths_of_second_passed),
  .counter_o (hund_counter)
);

s_counter tenths_counter(
  .clk100_i             (clk100_i),
  .rstn_i               (rstn_i),
  .smallest_part_passed (tenths_of_second_passed),
  .biggest_part_passed  (second_passed),
  .counter_o (tth_counter)
);


endmodule
