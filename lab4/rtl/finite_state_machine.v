module finite_state_machine(
    input               clk100_i,
    input       [3:0]   abcd,
    input               rstn_i,
    output reg  [1:0]   current_state
);

localparam FIRST_STATE  = 2'b00;
localparam SECOND_STATE = 2'b01;
localparam THIRD_STATE  = 2'b10;
localparam FOURTH_STATE = 2'b11;

wire a,b,c,d;

assign a = abcd[3];
assign b = abcd[2];
assign c = abcd[1];
assign d = abcd[0];

reg [1:0] next_state = 0;
//State machine
always @( * ) begin
    case( current_state )
        FIRST_STATE  :  if ( a )      next_state <= THIRD_STATE;
                        else if ( b ) next_state <= SECOND_STATE;
                        else if ( c ) next_state <= FOURTH_STATE;
        SECOND_STATE :  if ( a )      next_state <= THIRD_STATE;
        THIRD_STATE  :  if ( c )      next_state <= FOURTH_STATE;
        FOURTH_STATE :  if ( b )      next_state <= FIRST_STATE;
        default      :  next_state <= FIRST_STATE;
    endcase
end

always @( posedge clk100_i or negedge rstn_i )
begin
  if( !rstn_i )  
    current_state <= FIRST_STATE;
  else
    current_state <= next_state;
end

endmodule
