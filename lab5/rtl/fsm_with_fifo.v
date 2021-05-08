module fsm_with_fifo(
  input       clk100_i,
  input       rstn_i,
  input [7:0] data_i,
  input       we_i,
  output      full_o,
  output      transmit_lane_o
);


localparam idle = 2'b00;
localparam load = 2'b01;
localparam transmit = 2'b10;
localparam w8_trans_to_compl =  2'b11;

reg  [1:0] state;
wire [7:0] data_from_fifo_for_transmitter;
wire       fifo_is_empty;
wire       fifo_re;
wire        transmitter_is_busy;
wire        start_transaction;


//state machine 
always @(posedge clk100_i) begin
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

assign fifo_re = (state == load);
assign start_transaction = (state == transmit);

fifo fifo_input_buffer(
  .clk100_i   (clk100_i),
  .rstn_i     (rstn_i),
  .we_i         (we_i),
  .re_i         (fifo_re),
  .data_i     (data),
  .data_o     (data_from_fifo_for_transmitter),
  .empty_o    (fifo_is_empty),
  .full_o     (full_o)
);

transmitter my_transmitter(
  .clk100_i (clk100_i),
  .rstn_i   (rstn_i),
  .start    (start_transaction),
  .busy     (transmitter_is_busy),
  .data     (data_from_fifo_for_transmitter),
  .tx       (transmit_lane_o)
);


endmodule
