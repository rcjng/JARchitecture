// Module Name:    ALU
// Project Name:   CSE141L
//
// Additional Comments:
//   combinational (unclocked) ALU

// includes package "Definitions"
import Definitions::*;

module ALU #(parameter W=8, Ops=4)(
  input        [W-1:0]   InputA,       // data inputs
                         InputB,
  input        [Ops-1:0] OP,           // ALU opcode, part of microcode
  // input                  SC_in,        // shift or carry in
  output logic [W-1:0]   Out,          // data output
  output logic           Cond   
                         // Zero,         // output = zero flag    !(Out)
  //                        Parity,       // outparity flag        ^(Out)
  //                        Odd           // output odd flag        (Out[0]) 
                         
                         // you may provide additional status flags, if desired
);

// type enum: used for convenient waveform viewing
op_mne op_mnemonic;

always_comb begin
  // No Op = default
  Out = 0;
  Cond = 0;
  // add, sub, load, store, move, and, or, not, xor, shiftl, shiftr, setlt, seteq
  case(OP)
    ADD : Out = InputA + InputB;        // add 
    SUB : Out = InputA + (~InputB) + 1;
    AND : Out = InputA & InputB;        // bitwise AND
    OR  : Out = InputA | InputB;
    NOT : Out = ~InputA;
    XOR : Out = InputA ^ InputB;        // bitwise exclusive OR
    LSH : Out = InputA << InputB;    // shift left, fill in with SC_in
    RSH : Out = InputA >> InputB;    // shift right 
    SLT : begin
      if (InputA < InputB) begin
        Out = 8'b1;
        Cond = 1'b1;
      end
      else begin
        Out = 8'b0;
        Cond = 1'b0;
      end
    end
    SEQ : begin
      if (InputA == InputB) begin
        Out = 8'b1;
        Cond = 1'b1;
      end
      else begin
        Out = 8'b0;
        Cond = 1'b0;
      end
    end

    default : Out = 8'bxxxx_xxxx;       // Quickly flag illegal ALU
  endcase
end

// assign Zero   = ~|Out;                  // reduction NOR
// assign Parity = ^Out;                   // reduction XOR
// assign Odd    = Out[0];                 // odd/even -- just the value of the LSB

// Toolchain guard: icarus verilog doesn't support this debug feature.
`ifndef __ICARUS__
always_comb
  op_mnemonic = op_mne'(OP);            // displays operation name in waveform viewer
`endif

endmodule
