// Project Name:   CSE141L
// Module Name:    Ctrl
// Create Date:    ?
// Last Update:    2022.01.13

// control decoder (combinational, not clocked)
// inputs from ... [instrROM, ALU flags, ?]
// outputs to ...  [program_counter (fetch unit), ?]
import Definitions::*;

// n.b. This is an example / starter block
//      Your processor **will be different**!
module Ctrl (
  input  [8:0] Instruction,     // machine code
                                // some designs use ALU inputs here
  output logic       Jump,      // Relative (0) or LUT (1) jump?
                     BranchEn,  // branch at all?
                     RegWrEn,   // write to reg_file (common)
                     MemWrEn,   // write to mem (store only)
                     LoadInst,  // mem (1) or ALU (0) to reg_file
                     RegDst,    // r0 (0) or specified register (1)
                     Ack,       // "done with program"
  output logic [1:0] AInSel,    // 0 (0), Reg data [Rx] (1), Immediate (2)
                     BInSel,    // 0 (0), Reg data [R0] (1), Immediate (2)
  output logic [3:0] ALUOp      // Determines the ALU operation
  
);

// What follows is instruction decoding.
// This codifies much of your ISA definition!
//
// Note: This **starter code** is not a complete ISA!

// instruction = 9'b110??????;
// assign MemWrEn = Instruction[8:6] == 3'b110;

// assign RegWrEn = Instruction[8:7] != 2'b11;
// assign LoadInst = Instruction[8:6] == 3'b011;

// reserve instruction = 9'b10_1111_111; for Ack
assign Ack = (Instruction == 9'b10_1111_111);

// jump on right shift that generates a zero
// equiv to simply: assign Jump = Instruction[2:0] == RSH;
always_comb begin
  Jump        = 1'b0;
  BranchEn    = 1'b0;
  MemWrEn     = 1'b0;
  RegWrEn     = 1'b0;
  LoadInst    = 1'b0;
  RegDst      = 1'b0;
  AInSel      = 2'b0;
  BInSel      = 2'b0;
  ALUOp       = ADD;

  // I-Type
  if (Instruction[8] == 1'b0) begin
    RegWrEn     = 1'b1;
    AInSel      = 2'b10;
  end

  else begin

    // R-Type
    if (Instruction[8:7] == 2'b10) begin
      if (Instruction[6:3] == 4'b0000) begin
        //add
        RegWrEn = 1'b1;
        AInSel = 2'b1;
        BInSel = 2'b1;
      end
      else if (Instruction[6:3] == 4'b0001) begin
        //sub
        RegWrEn = 1'b1;
        AInSel = 2'b1;
        BInSel = 2'b1;
        ALUOp = SUB;
      end
      else if (Instruction[6:3] == 4'b0010) begin
        // load
        RegWrEn = 1'b1;   // write from mem to reg
        LoadInst = 1'b1;  // load from mem to reg
      end
      else if (Instruction[6:3] == 4'b0011) begin
        // store
        MemWrEn = 1'b1;   // write to mem
      end
      else if (Instruction[6:3] == 4'b0100) begin
        //move
        RegWrEn = 1'b1;   // write to reg
        RegDst = 1'b1;
        BInSel = 2'b1; // 
      end
      else if (Instruction[6:3] == 4'b0101) begin
        //and
        RegWrEn = 1'b1;   // write result to R0
        AInSel = 2'b1;    // param Rx
        BInSel = 2'b1;    // param R0
        ALUOp = AND;
      end
      else if (Instruction[6:3] == 4'b0110) begin
        //or
        RegWrEn = 1'b1;   // write result to R0
        AInSel = 2'b1;    // param Rx
        BInSel = 2'b1;    // param R0
        ALUOp = OR;
      end
      else if (Instruction[6:3] == 4'b0111) begin
        //xor
        RegWrEn = 1'b1;   // write result to R0
        AInSel = 2'b1;    // param Rx
        BInSel = 2'b1;    // param R0
        ALUOp = XOR;
      end
      else if (Instruction[6:3] == 4'b1000) begin
        //not
        RegWrEn = 1'b1;   // write result to R0
        AInSel = 2'b1;    // param Rx
        BInSel = 2'b1;    // param R0
        ALUOp = NOT;
      end
      else if (Instruction[6:3] == 4'b1001) begin
        //shift left
        RegWrEn = 1'b1; // write result to R0
        AInSel = 2'b1;  // value of rx
        BInSel = 2'b1;  // value of r0
        ALUOp = LSH;
      end
      else if (Instruction[6:3] == 4'b1010) begin
        //shift right
        RegWrEn = 1'b1; // write result to R0
        AInSel = 2'b1;  // value of rx
        BInSel = 2'b1;  // value of r0
        ALUOp = RSH;
      end
      else if (Instruction[6:3] == 4'b1011) begin
        //setlt
        RegWrEn = 1'b1; // write result to r0
        AInSel = 2'b1; // param Rx
        BInSel = 2'b1; // param R0
        ALUOp = SLT;
      end
      else if (Instruction[6:3] == 4'b1100) begin
        //seteq
        RegWrEn = 1'b1; // write result to r0
        AInSel = 2'b1; // param Rx
        BInSel = 2'b1; // param R0
        ALUOp = SEQ;
      end
    end
    else begin
      // B-Type
      BranchEn = 1'b1;
      
      if (Instruction[6] == 1'b1) begin
        // bl
        Jump = 1'b1;
      end
      else begin
        // br
        Jump = 1'b0;
      end
    end
  end
end

// // branch every time instruction = 9'b?????1111;
// assign BranchEn = &Instruction[3:0];

// // Maybe define specific types of branches?
// assign TargSel  = Instruction[3:2];

endmodule
