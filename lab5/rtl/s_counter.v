module s_counter (
  input         clk100_i,
  input         rstn_i,
  input         smallest_part_passed,
  output        biggest_part_passed,
  output [3:0]  counter_o
);

localparam  COUNTER_MAX = 4'd9;
reg [3:0] counter = 4'd0;

assign  biggest_part_passed =
        ( ( counter == COUNTER_MAX ) & smallest_part_passed );

assign counter_o = counter;

always @( posedge clk100_i or negedge rstn_i ) begin
  if ( !rstn_i )
    counter <= 0;
  else if ( smallest_part_passed ) 
  begin
    if ( biggest_part_passed )
      counter <= 0;
    else
      counter <= counter + 1;
  end
end

endmodule
