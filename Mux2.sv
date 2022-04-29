module Mux2 #(parameter W=8) (
  input         Sel,    // machine code
                               // some designs use ALU inputs
  input         [W-1:0] A,
                        B,
  output logic  [W-1:0] out
);


  assign out = Sel ? A : B;
endmodule