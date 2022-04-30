// Design Name:      CSE141L
// Module Name:      TopLevel

// you will have the same 3 ports
module TopLevel(
  input        Reset,      // init/reset, active high
               Start,      // start next program
               Clk,        // clock -- posedge used inside design
  output logic Ack         // done flag from DUT
);


// Declare all the connections between modules.
//
// Generally, naming signals to match where they came from works
// well, i.e. MODULEINSTANCE_SIGNAL_out. This is because there is
// generally only one driver of a connection (enforced by the
// `logic` keyword), but it may fan out to multiple uses.
//
// Note that signals are named after the *instance* of the module
// not the type of the module (because you might instantiate
// multiple copies of certain modules).
//
// It's useful to have all of the connections declared at the top,
// because sometimes wires will 'loop back' (i.e. be needed as an
// input to a module but driven by a module that hasn't been
// declared yet).
//
// Stylistically, try to keep these declarations in the same order
// as the modules below. This will make your life easier.


// InstROM outputs
wire  [ 8:0] IR1_InstOut_out;  // the 9-bit opcode
logic [ 8:0] Active_InstOut;   // the actual Inst being executed

// ProgCtr outputs
wire [ 9:0] PC1_ProgCtr_out;  // the program counter

// LUT outputs
// n.b. "LUT" is a pretty generic name, a nice example
// of how to do a LUT, but your core should call this
// something more informative probably...
wire [ 9:0] LUT1_Target_out;  // Target of branch/jump
wire [ 9:0] LUT2_Target_out;
wire [ 9:0] LUT3_Target_out;
wire [ 9:0] LUT4_Target_out;
logic [9:0] LUT_Target;

// Control block outputs
logic       Ctrl1_Jump_out;      // to program counter: jump
logic       Ctrl1_BranchEn_out;  // to program counter: branch enable
logic       Ctrl1_RegWrEn_out;   // reg_file write enable
logic       Ctrl1_MemWrEn_out;   // data_memory write enable
logic       Ctrl1_LoadInst_out;  // TODO: Why both of these?
logic       Ctrl1_RegDst_out;
logic       Ctrl1_Ack_out;       // Done with program?
logic [1:0] Ctrl1_LUTSel_out;
logic [1:0] Ctrl1_AInSel_out;
logic [1:0] Ctrl1_BInSel_out;
logic [3:0] Ctrl1_TargSel_out;   // one trick to help with target range
logic [3:0] Ctrl1_ALUOp_out;

// Register file outputs
logic [7:0] RF1_DataOutA_out; // Contents of first selected register
logic [7:0] RF1_DataOutB_out; // Contents of second selected register

// ALU outputs
logic [7:0] ALU1_Out_out;
// logic       ALU1_Zero_out;
// logic       ALU1_Parity_out;
// logic       ALU1_Odd_out;
logic       ALU1_Cond_out;

// Data Memory outputs
logic [7:0] DM1_DataOut_out;  // data out from data_memory

// Output Mux deciding whether ALU or Memory result is used
logic [ 7:0] ExMem_RegValue_out; // data in to reg file

logic [ 2:0] WriteReg;

// Extras
//
// These are not really part of your processor per se, but can be
// useful for diagnostics or performance

logic[15:0] CycleCount; // Count the total number of clock cycles.


////////////////////////////////////////////////////////////////////////////////
// Fetch = Program Counter + Instruction ROM


// Some examples of what DPI and Verilator might enable
//
// Here, we replace the fixed Inst ROM with runtime programmable memory
`ifdef VERILATOR
import "DPI-C" function int add (input int a, input int b);

initial begin
   $display("Basic DPI: %x + %x = %x", 1, 2, add(1,2));
end

import "DPI-C" function int getInstAtAddr (input int DPI_Addr);
export "DPI-C" task writeInstOut;

// Easier to convert here than in CPP
int DPI_Addr = {22'b0, PC1_ProgCtr_out};

int DPI_Inst;
task writeInstOut;
  DPI_Inst = getInstAtAddr(DPI_Addr);
endtask

assign IR1_InstOut_out = DPI_Inst[8:0];

//export "DPI-C" function getCurrentPC;

//function void getCurrentPC(output int Address)
//  Address = PC1_ProgCtr_out;
//endfunction

`else
// instruction ROM -- holds the machine code pointed to by program counter
InstROM #(.W(9)) IR1(
  .InstAddress (PC1_ProgCtr_out),
  .InstOut     (IR1_InstOut_out)
);
`endif

// this is the program counter module
ProgCtr PC1 (
  .Reset       (Reset),              // reset to 0
  .Start       (Start),              // Your PC will have to do something smart with this
  .Clk         (Clk),                // System CLK
  .BranchAbsEn (Ctrl1_Jump_out),     // jump enable
  .BranchRelEn (Ctrl1_BranchEn_out), // branch enable
  .ALU_flag    (ALU1_Cond_out),      // Maybe your PC will find this useful
  .AbsTarget   (LUT_Target),
  .RelTarget   (ALU1_Out_out),
  .ProgCtr     (PC1_ProgCtr_out)     // program count = index to instruction memory
);

// this is one way to 'expand' the range of jumps available
LUT1 LUT1(
  .Addr         (Ctrl1_TargSel_out),
  .Target       (LUT1_Target_out)
);
LUT1 LUT2(
  .Addr         (Ctrl1_TargSel_out),
  .Target       (LUT1_Target_out)
);
LUT1 LUT3(
  .Addr         (Ctrl1_TargSel_out),
  .Target       (LUT1_Target_out)
);
LUT1 LUT4(
  .Addr         (Ctrl1_TargSel_out),
  .Target       (LUT1_Target_out)
);

always_comb begin
  case (Ctrl1_LUTSel_out)
    0 : LUT_Target = LUT1_Target_out;
    1 : LUT_Target = LUT2_Target_out;
    2 : LUT_Target = LUT2_Target_out;
    3 : LUT_Target = LUT3_Target_out;
    default : LUT_Target = LUT1_Target_out;
  endcase
end

// Note that it may be simpler to handle Start here; depends on your design!
logic should_run_processor;
logic ever_start;

always_ff @(posedge Clk) begin
  if (Reset)
    ever_start <= '0;
  else if (Start)
    ever_start <= '1;
end

always_comb begin
  should_run_processor = ever_start & ~Start;
  Active_InstOut = (should_run_processor) ? IR1_InstOut_out : 9'b111_111_111;
end
/////////////////////////////////////////////////////////////////////// Fetch //



////////////////////////////////////////////////////////////////////////////////
// Decode = Control Decoder + Reg_file

// Control decoder
Ctrl Ctrl1 (
  .Instruction  (Active_InstOut),     // from instr_ROM
  .Jump         (Ctrl1_Jump_out),     // to PC to handle jump/branch instructions
  .BranchEn     (Ctrl1_BranchEn_out), // to PC
  .RegWrEn      (Ctrl1_RegWrEn_out),  // register file write enable
  .MemWrEn      (Ctrl1_MemWrEn_out),  // data memory write enable
  .LoadInst     (Ctrl1_LoadInst_out), // selects memory vs ALU output as data input to reg_file
  .RegDst       (Ctrl1_RegDst_out),
  .Ack          (Ctrl1_Ack_out),      // "done" flag
  .LUTSel       (Ctrl1_LUTSel_out),
  .AInSel       (Ctrl1_AInSel_out),
  .BInSel       (Ctrl1_BInSel_out),
  .TargSel      (Ctrl1_TargSel_out),   // index into lookup table
  .ALUOp        (Ctrl1_ALUOp_out)
);

// Register file
// A(3) makes this 2**3=8 elements deep
RegFile #(.W(8),.A(3)) RF1 (
  .Clk       (Clk),
  .Reset     (Reset),
  .WriteEn   (Ctrl1_RegWrEn_out),
  .RaddrA    (Active_InstOut[2:0]),      // See example below on how 3 opcode bits
  .RaddrB    (Zero_Input),      // could address 16 registers...
  .Waddr     (WriteReg),      // mux above
  .DataIn    (ExMem_RegValue_out),
  .DataOutA  (RF1_DataOutA_out),
  .DataOutB  (RF1_DataOutB_out)
);
// Here's a neat trick:
//   one pointer, two adjacent read accesses:
//   (sample optional approach)
//	.RaddrA ({Active_InstOut[5:3],1'b0});
//	.RaddrB ({Active_InstOut[5:3],1'b1});

// Also need to hook up the signal back to the testbench for when we're done.
assign Ack = should_run_processor & Ctrl1_Ack_out;
////////////////////////////////////////////////////////////////////// Decode //




////////////////////////////////////////////////////////////////////////////////
// Execute + Memory = ALU + DataMem
//
// Note: You do not need to structure blocks in the same way as the sample code.
//       Your procesor may wish to do something else (but does not have to).

// You can declare local wires if it makes sense, for instance
// if you need an local mux for the input
logic [ 7:0] InA, InB, Imm;      // ALU operand inputs

// No decision logic for these in this implementation
assign InA = RF1_DataOutA_out;     // connect RF out to ALU in
assign InB = RF1_DataOutB_out;     // interject switch/mux if needed/desired
assign Imm = Active_InstOut[7:0];
assign Zero_Input = 3'b0;


logic [7:0] ALU1_A_in;
logic [7:0] ALU1_B_in;
assign WriteReg = Ctrl1_RegDst_out ? Active_InstOut[2:0] : Zero_Input;

always_comb begin
  case (Ctrl1_AInSel_out)
    0 : ALU1_A_in = 8'b0;
    1 : ALU1_A_in = InA;
    2 : ALU1_A_in = Imm[7:0];
    default : ALU1_A_in = 8'b0;
  endcase

  case (Ctrl1_BInSel_out)
    0 : ALU1_B_in = 8'b0;
    1 : ALU1_B_in = InB;
    2 : ALU1_B_in = Imm[7:0];
    default : ALU1_B_in = 8'b0;
  endcase
end 

ALU ALU1 (
  .Clk     (Clk),
  .InputA  (ALU_A_in),
  .InputB  (ALU_B_in),
  .OP      (ALUOp),
  .Out     (ALU1_Out_out),
  .Cond    (ALU1_Cond_out)
);


DataMem DM1(
  .DataAddress  (ALU1_Out_out),
  .WriteEn      (Ctrl1_MemWrEn_out),
  .DataIn       (RF1_DataOutB_out),
  .DataOut      (DM1_DataOut_out),
  .Clk          (Clk),
  .Reset        (Reset)
);

// An output mux from this block, are we using the ALU result or the memory
// result this cycle?  Controlled by Ctrl1 -- must be high for load from
// data_mem; otherwise usually low
assign ExMem_RegValue_out = Ctrl1_LoadInst_out ? DM1_DataOut_out : ALU1_Out_out;
//////////////////////////////////////////////////////////// Execute + Memory //


////////////////////////////////////////////////////////////////////////////////
// Extras

// count number of cycles executed
// not part of main design, potentially useful for performance measure...
// This one halts when Ack is high
always_ff @(posedge Clk)
  if (Reset)   // if(start) ?
    CycleCount <= 0;
  else if(Ctrl1_Ack_out == 0)   // if(!halt) ?
    CycleCount <= CycleCount + 'b1;
endmodule

