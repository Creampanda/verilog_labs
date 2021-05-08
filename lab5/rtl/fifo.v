module fifo (
  input        clk100_i,
  input        rstn_i,
  input  [7:0] data_i,
  input        we_i,
  input        re_i,
  output reg [7:0] data_o,
  output       full_o,
  output       empty_o
);
localparam fifo_size =  4; //bits
integer i;

reg [7:0] mem [0 : fifo_size**2 - 1];
reg [fifo_size - 1 : 0] read_address;
reg [fifo_size - 1 : 0] write_address;
reg                    full_reg;

assign empty_o = (write_address == 0);
assign full_o  = full_reg;

always @( posedge clk100_i or negedge rstn_i ) begin
  if ( !rstn_i ) begin
    read_address <= 0;
    write_address <= 0;
    full_reg <= 0;
    for (i = 0; i <= fifo_size**2; i = i + 1)
      mem[i] <= 0;
  end
  else if ( we_i && ~full_reg ) begin
    mem[write_address] <= data_i;
    if (write_address == fifo_size**2 - 1) begin
      full_reg <= 1'b1;
    end
    else write_address <= write_address + 1;
  end
  else if ( re_i && ~empty_o) begin
    data_o <= mem[0];
    for (i = 1; i < fifo_size**2; i = i + 1)
      mem[i-1] <= mem[i];
    write_address <= write_address - 1;
    full_reg <= 1'b0;
  end
end


endmodule
