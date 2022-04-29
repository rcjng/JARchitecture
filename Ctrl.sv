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
  input  [8:0] Instruction,    // machine code
                               // some designs use ALU inputs here
  output logic       Jump,      // Relative (0) or LUT (1) jump?
                     BranchEn,  // branch at all?
                     RegWrEn,   // write to reg_file (common)
                     MemWrEn,   // write to mem (store only)
                     LoadInst,  // mem (1) or ALU (0) to reg_file
                     RegDst,    // r0 (0) or specified register (1)
                     Ack,       // "done with program"
  output logic [1:0] LUTSel,    // Which LUT?
                     AInSel,    // 0 (0), Reg data [Rx] (1), Immediate (2)
                     BInSel,     // 0 (0), Reg data [R0] (1), Immediate (2)
  output logic [3:0] TargSel,    // LUT Address
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

// reserve instruction = 9'b111111111; for Ack
assign Ack = &Instruction;

// jump on right shift that generates a zero
// equiv to simply: assign Jump = Instruction[2:0] == RSH;
always_comb begin
  // I-Type
  if (Instruction[8] == 1'b0) begin
    Jump        = 1'b0;
    BranchEn    = 1'b0;
    MemWrEn     = 1'b0;
    RegWrEn     = 1'b1;
    LoadInst    = 1'b0;
    RegDst      = 1'b0;
    AInSel      = 2'b11;
    BInSel      = 2'b00;
    LUTSel      = 2'b00;
    TargSel     = 4'b0000;
    ALUOp       = ADD;
  end
  else begin
    // R-Type
    if (Instruction[8:7] == 2'b10) begin
      
      if (Instruction[6:3] == 4'b0000) begin
        //add
        Jump = 1'b0;
        BranchEn = 1'b0;
        RegWrEn = 1'b1;
        MemWrEn = 1'b0;
        LoadInst = 1'b0;
        RegDst = 1'b0;
        LUTSel = 2'b0;
        AInSel = 2'b1;
        BInSel = 2'b1;
        TargSel = 4'b0;
        ALUOp = ADD;
      end
      else if (Instruction[6:3] == 4'b0001) begin
        //sub
        Jump = 1'b0;
        BranchEn = 1'b0;
        RegWrEn = 1'b1;
        MemWrEn = 1'b0;
        LoadInst = 1'b0;
        RegDst = 1'b0;
        LUTSel = 2'b0;
        AInSel = 2'b1;
        BInSel = 2'b1;
        TargSel = 4'b0;
        ALUOp = SUB;
      end
      else if (Instruction[6:3] == 4'b0010) begin
        // load
        Jump = 1'b0;
        BranchEn = 1'b0;
        RegWrEn = 1'b1;   // write from mem to reg
        MemWrEn = 1'b0;
        LoadInst = 1'b1;  // load from mem to reg
        RegDst = 1'b0;
        LUTSel = 2'b0;
        AInSel = 2'b1;    // get address from register
        BInSel = 2'b0;    // add 0 to above
        TargSel = 4'b0;
        ALUOp = ADD;
      end
      else if (Instruction[6:3] == 4'b0011) begin
        //store
        Jump = 1'b0;
        BranchEn = 1'b0;
        RegWrEn = 1'b0;   // don't write to reg
        MemWrEn = 1'b1;   // write to mem
        LoadInst = 1'b0;
        RegDst = 1'b0;
        LUTSel = 2'b0;
        AInSel = 2'b0; // 
        BInSel = 2'b1; //
        TargSel = 4'b0;
        ALUOp = ADD;
      end
      else if (Instruction[6:3] == 4'b0100) begin
        //move
        Jump = 1'b0;
        BranchEn = 1'b0;
        RegWrEn = 1'b1;   // write to reg
        MemWrEn = 1'b0; 
        LoadInst = 1'b0;
        RegDst = 1'b1;
        LUTSel = 2'b0;
        AInSel = 2'b1; // 
        BInSel = 2'b0; //
        TargSel = 4'b0;
        ALUOp = ADD;
      end
      else if (Instruction[6:3] == 4'b0101) begin
        //and
        Jump = 1'b0;
        BranchEn = 1'b0;
        RegWrEn = 1'b1;   // write result to R0
        MemWrEn = 1'b0;
        LoadInst = 1'b0;
        RegDst = 1'b0;    // write result to R0
        LUTSel = 2'b0;
        AInSel = 2'b1;    // param Rx
        BInSel = 2'b1;    // param R0
        TargSel = 4'b0;
        ALUOp = AND;
      end
      else if (Instruction[6:3] == 4'b0110) begin
        //or
        Jump = 1'b0;
        BranchEn = 1'b0;
        RegWrEn = 1'b1;   // write result to R0
        MemWrEn = 1'b0;
        LoadInst = 1'b0;
        RegDst = 1'b0;    // write result to R0
        LUTSel = 2'b0;
        AInSel = 2'b1;    // param Rx
        BInSel = 2'b1;    // param R0
        TargSel = 4'b0;
        ALUOp = OR;
      end
      else if (Instruction[6:3] == 4'b0111) begin
        //xor
        Jump = 1'b0;
        BranchEn = 1'b0;
        RegWrEn = 1'b1;   // write result to R0
        MemWrEn = 1'b0;
        LoadInst = 1'b0;
        RegDst = 1'b0;    // write result to R0
        LUTSel = 2'b0;
        AInSel = 2'b1;    // param Rx
        BInSel = 2'b1;    // param R0
        TargSel = 4'b0;
        ALUOp = XOR;
      end
      else if (Instruction[6:3] == 4'b1000) begin
        //bitwise not
        Jump = 1'b0;
        BranchEn = 1'b0;
        RegWrEn = 1'b1;   // write result to R0
        MemWrEn = 1'b0;
        LoadInst = 1'b0;
        RegDst = 1'b0;    // write result to R0
        LUTSel = 2'b0;
        AInSel = 2'b1;    // param Rx
        BInSel = 2'b1;    // param R0
        TargSel = 4'b0;
        ALUOp = NOT;
      end
      else if (Instruction[6:3] == 4'b1001) begin
        //shift left
        Jump = 1'b0;
        BranchEn = 1'b0;
        RegWrEn = 1'b1; // write result to R0
        MemWrEn = 1'b0;
        LoadInst = 1'b0;
        RegDst = 1'b0; // write result to R0
        LUTSel = 2'b0;
        AInSel = 2'b1;  // value of rx
        BInSel = 2'b1;  // value of r0
        TargSel = 4'b0;
        ALUOp = LSH;
      end
      else if (Instruction[6:3] == 4'b1010) begin
        //shift right
        Jump = 1'b0;
        BranchEn = 1'b0;
        RegWrEn = 1'b1; // write result to R0
        MemWrEn = 1'b0;
        LoadInst = 1'b0;
        RegDst = 1'b0; // write result to R0
        LUTSel = 2'b0;
        TargSel = 4'b0;
        AInSel = 2'b1;  // value of rx
        BInSel = 2'b1;  // value of r0
        ALUOp = RSH;
      end
      else if (Instruction[6:3] == 4'b1011) begin
        //setlt
        Jump = 1'b0;
        BranchEn = 1'b0;
        RegWrEn = 1'b1; // write result to r0
        MemWrEn = 1'b0;
        LoadInst = 1'b0;
        RegDst = 1'b0; // write result to r0
        LUTSel = 2'b0;
        AInSel = 2'b1; // param Rx
        BInSel = 2'b1; // param R0
        TargSel = 4'b0;
        ALUOp = SLT;
      end
      else if (Instruction[6:3] == 4'b1100) begin
        //seteq
        Jump = 1'b0;
        BranchEn = 1'b0;
        RegWrEn = 1'b1; // write result to r0
        MemWrEn = 1'b0;
        LoadInst = 1'b0;
        RegDst = 1'b0; // write result to r0
        LUTSel = 2'b0;
        TargSel = 4'b0;
        AInSel = 2'b1; // param Rx
        BInSel = 2'b1; // param R0
        ALUOp = SEQ;
      end
    end
    else begin
      ALUOp = ADD;
      BranchEn = 1'b1;
      RegWrEn = 1'b0;
      MemWrEn = 1'b0;
      LoadInst = 1'b0;
      RegDst = 1'b0;
      AInSel = 2'b1;
      BInSel = 2'b1;
      
      //branch type
      if (Instruction[6] == 1'b1) begin
        //bl
        Jump = 1'b1;
        LUTSel = Instruction[5:4];
        TargSel = Instruction[3:0];
        
      end
      else begin
        Jump = 1'b0;
        LUTSel = 2'b0;
        TargSel = 4'b0;
      end
    end
  end
end

// // branch every time instruction = 9'b?????1111;
// assign BranchEn = &Instruction[3:0];

// // Maybe define specific types of branches?
// assign TargSel  = Instruction[3:2];

endmodule