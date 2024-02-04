module RisingEdgeDetector (
  input  logic clk,
  input  logic signal,
  output logic edge
);

  logic signalPrev;

  always_ff @(posedge clk) begin
    signalPrev <= signal;
    edge       <= (signal && !signalPrev);
  end

endmodule
