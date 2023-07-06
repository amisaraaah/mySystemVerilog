module perf_counters #(
  parameter WIDTH = 4
) (
  input  logic            clk,
  input  logic            reset,
  input  logic            sw_req_i,
  input  logic            cpu_trig_i,
  output logic[WIDTH-1:0] p_count_o
);
  
  // --------------------------------------------------------
  // Internal wire and regs
  // --------------------------------------------------------
  //logic [CNT_W-1:0] count_q;
  //logic [CNT_W-1:0] count;

  //always_ff @(posedge clk or posedge reset)
  //  if (reset)
  //    count_q[CNT_W-1:0] <= {CNT_W{1'b0}};
  //  else
  //   count_q[CNT_W-1:0] <= count;

  //always_comb begin
  //  count[CNT_W-1:0] = sw_req_i ? {{CNT_W-1{1'b0}}, cpu_trig_i} : count_q + {{CNT_W-1{1'b0}}, cpu_trig_i};
  //end

  // -------------------------------------------------------
  // Output assignments
  // --------------------------------------------------------
  //assign p_count_o[CNT_W-1:0] = sw_req_i ? count_q[CNT_W-1:0]: {CNT_W{1'b0}};
  
  logic [WIDTH-1:0] nxt_count;
  logic [WIDTH-1:0] count_q;
  
  // Write your logic here...
  always_ff @ (posedge clk or posedge reset)
    if (reset)
      count_q <= {WIDTH{1'b0}} ;
    else
      count_q <= nxt_count ;
    
  always_comb begin
    //nxt_count = sw_req_i ? cpu_trig_i : {count_q + {31{1'b0}}, cpu_trig_i} ;
    nxt_count = sw_req_i ? {{WIDTH-1{1'b0}}, cpu_trig_i} : count_q + { {WIDTH-1{1'b0}}, cpu_trig_i} ;
  end
  assign p_count_o = {WIDTH{sw_req_i}} & count_q;
  //this also works
  //assign p_count_o[WIDTH-1:0] = sw_req_i ? count_q[WIDTH-1:0] : {WIDTH{1'b0}} ;
  
  
endmodule