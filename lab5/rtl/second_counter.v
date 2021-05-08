module second_counter (
  input   clk100_i,
  input   rstn_i,
  input   start_i,
  output  second_passed_o
);


reg         device_running      = 1'b0;
reg  [3:0]  hundredths_counter  = 4'd0;
reg  [3:0]  tenths_counter      = 4'd0;
reg  [3:0]  seconds_counter     = 4'd0;


// Counter 
localparam PULSE_WIDTH = 20;
localparam PULSE_MAX   = 20'd999999;
localparam COUNTER_MAX = 4'd9;

reg [PULSE_WIDTH - 1:0] pulse_counter = 20'd0;



wire  hundredths_of_second_passed = ( pulse_counter == PULSE_MAX );
wire  tenths_of_second_passed = 
        ( ( hundredths_counter == COUNTER_MAX ) & hundredths_of_second_passed );
wire  second_passed = 
        ( ( tenths_counter == COUNTER_MAX ) & tenths_of_second_passed );

assign second_passed_o = hundredths_of_second_passed;

always @( posedge clk100_i or negedge rstn_i ) begin
  if ( !rstn_i ) 
  begin
    pulse_counter       <= 0;
    hundredths_counter  <= 0;
    tenths_counter      <= 0;
  end
  else if ( start_i )
    device_running = 1'b1;
  else if ( second_passed_o )
    device_running = 1'b0;
  else if ( device_running | hundredths_of_second_passed )
  begin
    if ( hundredths_of_second_passed )
      pulse_counter <= 0;
    else
      pulse_counter <= pulse_counter + 1;
  end
end


//00.01


always @( posedge clk100_i or negedge rstn_i ) begin
  if ( !rstn_i ) 
    hundredths_counter <= 0;
  else if ( hundredths_of_second_passed ) 
  begin
    if ( tenths_of_second_passed )
      hundredths_counter <= 0;
    else
      hundredths_counter <= hundredths_counter + 1;
  end
end


// 00.10


always @( posedge clk100_i or negedge rstn_i ) begin
  if ( !rstn_i ) 
    tenths_counter <= 0;

  else if ( tenths_of_second_passed ) 
  begin
    if ( second_passed )
      tenths_counter <= 0;
    else
      tenths_counter <= tenths_counter + 1;
  end
end


endmodule
