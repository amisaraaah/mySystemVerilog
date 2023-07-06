// 0 → 1 → 1 → 1 → 2 → 2 → 3 → 4 → 5 → 7 → 9 → 12 → 16 → 21 → 28 → 37 → 
module seq_generator (
  input   logic        clk,
  input   logic        reset,

  output  logic [31:0] seq_o
);

  // --------------------------------------------------------
  // Internal wire and regs
  // --------------------------------------------------------
  logic [31:0] seq_t1;
  logic [31:0] seq_t2;
  logic [31:0] seq_t3;

  logic [31:0] seq_nxt;

  always_ff @(posedge clk or posedge reset)
    if (reset) begin
      seq_t1 <= 32'h1;
      seq_t2 <= 32'h1;
      seq_t3 <= 32'h0;
    end else begin
      seq_t1 <= seq_nxt[31:0];
      seq_t2 <= seq_t1[31:0];
      seq_t3 <= seq_t2[31:0];
    end

  assign seq_nxt[31:0] = {seq_t3[31:0]} + {seq_t2[31:0]};

  // -------------------------------------------------------
  // Output assignments
  // --------------------------------------------------------
  assign seq_o = seq_t3;

endmodule
