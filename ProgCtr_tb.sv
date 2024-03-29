// Test bench
// Program Counter (Instruction Fetch)

module ProgCtr_tb;

timeunit 1ns/1ps;

// Define signals to interface with UUT
bit Reset;
bit Start;
bit Clk;
bit BranchAbsEn;
bit BranchRelEn;
bit ALU_flag;
bit [5:0] RelTarget;
bit [9:0] AbsTarget;
logic [9:0] NextInstructionIndex;

// Instatiate and connect the Unit Under Test
ProgCtr uut (
  .Reset(Reset),
  .Start(Start),
  .Clk(Clk),
  .BranchAbsEn(BranchAbsEn),
  .BranchRelEn(BranchRelEn),
  .ALU_flag(ALU_flag),
  .RelTarget(RelTarget),
  .AbsTarget(AbsTarget),
  .ProgCtr(NextInstructionIndex)
);

integer ClockCounter = 0;
always @(posedge Clk)
  ClockCounter <= ClockCounter + 1;

// The actual testbench logic
//
// In this testbench, let's look at 'manual clocking'
initial begin
  // Time 0 values
  $display("Initialize Testbench.");
  Reset = '1;
  Start = '0;
  Clk = '0;
  BranchAbsEn = '0;
  BranchRelEn = '0;
  ALU_flag = '0;
  RelTarget = '0;
  AbsTarget = '0;

  // Advance to simulation time 1, latch values
  #1 Clk = '1;

  // Advance to simulation time 2, check results, prepare next values
  #1 Clk = '0;
  $display("Checking Reset behavior");
  assert (NextInstructionIndex == 'd0);
  Reset = '0;

  // Advance to simulation time 3, latch values
  #1 Clk = '1;

  // Advance to simulation time 4, check results, prepare next values
  #1 Clk = '0;
  $display("Checking that nothing happens before Start");
  assert (NextInstructionIndex == 'd0);
  Start = '1;

  // Advance to simulation time 5, latch values
  #1 Clk = '1;

  // Advance to simulation time 6, check results, prepare next values
  #1 Clk = '0;
  $display("Checking that nothing happened during Start");
  assert (NextInstructionIndex == 'd0);
  Start = '0;

  // Advance to simulation time 7, latch values
  #1 Clk = '1;

  // Advance to simulation time 8, check outputs, prepare next values
  #1 Clk = '0;
  $display("Checking that first Start went to first program");
  assert (NextInstructionIndex == 'd000);
  // No change in inputs

  // Advance to simulation time 9, latch values
  #1 Clk = '1;

  // Advance to simulation time 10, check outputs, prepare next values
  #1 Clk = '0;
  $display("Checking that no branch advanced by 1");
  assert (NextInstructionIndex == 'd001);
  BranchAbsEn = '1;
  AbsTarget = 'd10;

  // Latch, check, setup next test
  #1 Clk = '1;
  #1 Clk = '0;
  $display("Checking that absolute branch went to target");
  assert (NextInstructionIndex == 'd10);
  BranchAbsEn = '0;
  BranchRelEn = '1;
  RelTarget = 'd5;
  // note, ALU_flag still 0

  // Latch, check, setup next test
  #1 Clk = '1;
  #1 Clk = '0;
  $display("Checking that relative branch with no ALU flag did jump");
  assert (NextInstructionIndex == 'd15);
  BranchAbsEn = '0;
  BranchRelEn = '1;
  RelTarget = 'd5;
  ALU_flag = '1;

  // Latch, check, setup next test
  #1 Clk = '1;
  #1 Clk = '0;
  $display("Checking that relative branch with ALU flag did not jump");
  assert (NextInstructionIndex == 'd16);

  // new tests we wrote
  #1 Clk = '1;
  #1 Clk = '0;
  $display("Checking that pc increments correctly");
  assert (NextInstructionIndex == 'd17)
  ALU_flag = '0;
  BranchAbsEn = '0;
  BranchRelEn = '1;
  RelTarget = 6'b000101;  // 5

  #1 Clk = '1;
  #1 Clk = '0;
  $display("Checking that relative branch went forward");
  assert (NextInstructionIndex == 'd22);

  $display("All checks passed.");
end

initial begin
  $dumpfile("ProgCtr.vcd");
  $dumpvars();
  $dumplimit(104857600); // 2**20*100 = 100 MB, plenty.
end

endmodule
