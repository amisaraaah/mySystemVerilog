module big_endian_converter #(
  parameter DATA_W = 32
)(
  input   logic              clk,
  input   logic              reset,

  input   logic [DATA_W-1:0] le_data_i,

  output  logic [DATA_W-1:0] be_data_o

);
  
//genvar i;
  // Write your logic here
  for (genvar i =0; i<DATA_W/8; i=i+1) begin
    assign be_data_o [(DATA_W-1)- 8*i -: 8] = le_data_i [8*i +: 8];
  end
endmodule