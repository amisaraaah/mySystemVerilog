module clk_gen (
  input   logic        clk_in,
  input   logic        reset,
  output  logic        clk_v1,
  output  logic        clk_v2
);

  // Write your logic here...
  logic q, d, clk_div;
  
  always_ff @ (posedge clk_in or posedge reset)
    if (reset)
      q <= 1'b0;
    else
      q <= d;
  assign d = ~q;
  assign clk_div = q;
  assign clk_v1 = clk_in & clk_div;
  assign clk_v2 = clk_in ^ clk_v1;
  //assign clk_v2 = clk_in & ~clk_v1;
  
endmodule
