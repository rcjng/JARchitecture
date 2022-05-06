// Module Name:    ALU
// Project Name:   CSE141L
//
// Additional Comments:
//   combinational (unclocked) ALU

// includes package "Definitions"
import Definitions::*;

module ALU #(parameter W=8, Ops=4)(
  input                  Clk,
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

logic nextCond;
always_ff @(posedge Clk) begin
  Cond <= nextCond;
end


// type enum: used for convenient waveform viewing
op_mne op;
assign op = op_mne'(OP);            // displays operation name in waveform viewer

always_comb begin
  // No Op = default
  Out = 0;
  nextCond = Cond;
  // add, sub, load, store, move, and, or, not, xor, shiftl, shiftr, setlt, seteq
  case(op)
    ADD : Out = InputA + InputB;        // add 
    SUB : Out = InputA + (~InputB) + 1; // sub
    AND : Out = InputA & InputB;        // bitwise and
    OR  : Out = InputA | InputB;        // bitwise or
    NOT : Out = ~InputA;                // bitwise not
    XOR : Out = InputA ^ InputB;        // bitwise xor
    LSH : Out = InputA << InputB;       // logical shift left
    RSH : Out = InputA >> InputB;       // logical shift right 
    SLT : begin                         // set less than
      if (InputA < InputB) begin
        Out = 8'b1;
        nextCond = 1'b1;
      end
      else begin
        Out = 8'b0;
        nextCond = 1'b0;
      end
    end
    SEQ : begin                         // set equal
      if (InputA == InputB) begin
        Out = 8'b1;
        nextCond = 1'b1;
      end
      else begin
        Out = 8'b0;
        nextCond = 1'b0;
      end
    end
    default : Out = 8'bxxxx_xxxx;       // Quickly flag illegal ALU
  endcase
end

// assign Zero   = ~|Out;                  // reduction NOR
// assign Parity = ^Out;                   // reduction XOR
// assign Odd    = Out[0];                 // odd/even -- just the value of the LSB

// Toolchain guard: icarus verilog doesn't support this debug feature.
// `ifndef __ICARUS__
// always_comb
  // op = op_mne'(OP);            // displays operation name in waveform viewer
// `endif

endmodule
