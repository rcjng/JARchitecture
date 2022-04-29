module Mux4 #(parameter W=8) (
  input         [1:0] Sel,   // machine code
                               // some designs use ALU inputs
  input         [W-1:0] A,
                        B,
                        C,
                        D,
  output logic  [W-1:0] out
);

  always_comb begin
      case(Sel)
        0 : out = A;
        1 : out = B;
        2 : out = C;
        3 : out = D;
      endcase
  end
endmodule