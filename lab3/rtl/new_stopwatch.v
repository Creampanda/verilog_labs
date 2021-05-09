module new_stopwatch(
  input        clk100_i,
  input        rstn_i,
  input        start_stop_i,
  output [6:0] hex0_o,
  output [6:0] hex1_o,
  output [6:0] hex2_o,
  output [6:0] hex3_o
);


reg         device_running      = 1'b0;
wire        btn_start_was_pressed;


//Running device

always @( posedge clk100_i )
begin
  if ( btn_start_was_pressed )
    device_running <= ~device_running;
end

// Counter 
localparam PULSE_WIDTH = 4;
localparam PULSE_MAX = 4'd9;

reg [PULSE_WIDTH - 1:0] pulse_counter = 0;


button_sync bs1(
  .clk100_i        ( clk100_i               ),
  .btn_i           ( start_stop_i           ),
  .btn_was_pressed ( btn_start_was_pressed  )
);



wire  hundredths_of_second_passed = ( pulse_counter == PULSE_MAX );


always @( posedge clk100_i or negedge rstn_i ) begin
  if ( !rstn_i ) 
  begin
    pulse_counter <= 0;
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
wire  second_passed;
wire  ten_seconds_passed;
wire  hundred_seconds_passed;
wire  [3:0]  hund_counter;
wire  [3:0]  tth_counter;
wire  [3:0]  sec_counter;
wire  [3:0]  ten_counter;

s_counter hundredths_counter(
  .clk100_i             (clk100_i),
  .rstn_i               (rstn_i),
  .smallest_part_passed (hundredths_of_second_passed),
  .hex_o                (hex0_o),
  .biggest_part_passed  (tenths_of_second_passed),
  .counter_o (hund_counter)
);

s_counter tenths_counter(
  .clk100_i             (clk100_i),
  .rstn_i               (rstn_i),
  .smallest_part_passed (tenths_of_second_passed),
  .hex_o                (hex1_o),
  .biggest_part_passed  (second_passed),
  .counter_o (tth_counter)
);

s_counter seconds_counter(
  .clk100_i             (clk100_i),
  .rstn_i               (rstn_i),
  .smallest_part_passed (second_passed),
  .hex_o                (hex2_o),
  .biggest_part_passed  (ten_seconds_passed),
  .counter_o (sec_counter)
);

s_counter ten_seconds_counter(
  .clk100_i             (clk100_i),
  .rstn_i               (rstn_i),
  .smallest_part_passed (ten_seconds_passed),
  .hex_o                (hex3_o),
  .biggest_part_passed  (hundred_seconds_passed),
  .counter_o (ten_counter)
);

endmodule
