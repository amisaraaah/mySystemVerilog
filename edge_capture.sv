module edge_capture (
  input   logic        clk,
  input   logic        reset,

  input   logic [31:0] data_i,

  output  logic [31:0] edge_o

);

  // Write your logic here...
  
  logic[31:0] data_q;
  logic[31:0] edge_q;
  logic[31:0] neg_edge;
  
  always_ff @ (posedge clk or posedge reset)
    if (reset) begin
      data_q[31:0] <= 32'b0;
      edge_q[31:0] <= 32'b0;
    end
    else begin
      data_q[31:0] <= data_i[31:0];
      edge_q[31:0] <= edge_o[31:0];
    end
  
  assign neg_edge[31:0] = ~data_i[31:0] & data_q[31:0]; //negedge detection
  assign edge_o[31:0] = neg_edge[31:0] | edge_q[31:0]; //sticky
  
endmodule
