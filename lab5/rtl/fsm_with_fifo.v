module fsm_with_fifo(
  input       clk100_i,
  input       rstn_i,
  // input [7:0] data_i,
  input       btn_i,
  output      full_o,
  output  [7:0]    transmit_lane_o
);


localparam idle = 2'b00;
localparam load = 2'b01;
localparam transmit = 2'b10;
localparam w8_trans_to_compl =  2'b11;

reg  [1:0] state = 2'b00;
reg  [7:0] counter = 8'b0;
wire       btn_was_pressed;
wire [7:0] data_from_fifo_to_transmitter;
wire       fifo_is_empty;
wire       fifo_re;
wire       transmitter_is_busy;
wire       start_transaction;


//state machine 
always @(posedge clk100_i or negedge rstn_i) begin
  if ( !rstn_i ) begin
    state = 2'b00;
  end
  else begin    
  case (state)
    idle:
      if (fifo_is_empty | transmitter_is_busy)
        state <= idle;
      else 
        state <= load;
    load: state <= transmit;
    transmit: state <= idle;
  endcase
  end
end

assign fifo_re = (state == load);
assign start_transaction = (state == transmit);

always @(posedge clk100_i or negedge rstn_i) begin
  if ( !rstn_i ) begin
    counter <= 8'b0;
  end
  else if ( btn_was_pressed ) begin
    if (counter == 8'b1111_1111) counter <= 0;
    else counter <= counter + 1;
  end

end

button_sync bs1(
  .clk100_i        ( clk100_i               ),
  .btn_i           ( btn_i           ),
  .btn_was_pressed ( btn_was_pressed  )
);

fifo fifo_input_buffer(
  .clk100_i  (clk100_i),
  .rstn_i    (rstn_i),
  .we_i      (btn_was_pressed),
  .re_i      (fifo_re),
  .data_i    (counter),
  .data_o    (data_from_fifo_to_transmitter),
  .empty_o   (fifo_is_empty),
  .full_o    (full_o)
);

 transmitter my_transmitter(
  .clk100_i  (clk100_i),
  .rstn_i    (rstn_i),
  .start_i     (start_transaction),
  .busy      (transmitter_is_busy),
  .data_i      (data_from_fifo_to_transmitter),
  .tx        (transmit_lane_o)
 );
endmodule
