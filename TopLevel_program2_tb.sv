// Create Date:   2017.01.25
// Design Name:   TopLevel Test Bench
// Module Name:   TopLevel_tb.v
// CSE141L

// This is NOT synthesizable; use for logic simulation only
// Verilog Test Fixture created for module: TopLevel

module TopLevel_program2_tb;

// This defines what `#1` means, so later, when the clock is
// up wait `#5` then down wait `#5` we make a 100 MHz clock.
timeunit 1ns;
// This defines the precision of delays in the simulation.
// Convention is for this to be three orders of magnitude
// more precise unless you have a reason for it to be
// something else.
timeprecision 1ps;

// To DUT Inputs
bit Reset = 1'b1;
bit Req;
bit Clk;

// From DUT Outputs
wire Ack;              // done flag

// Instantiate the Device Under Test (DUT)
TopLevel DUT (
  .Reset  (Reset),
  .Start  (Req ),
  .Clk    (Clk ),
  .Ack    (Ack )
);

// This is the important part of the testbench, where logic might be added
initial begin
  #10 Reset = 'b0;
  #10 Req   = 'b1;

  // TODO: FILL IN THE MEMORY LOCATIONS HERE.
  DUT.DM1.Core[30] = 'b11010111; // correct
  DUT.DM1.Core[31] = 'b10000010; // correct
  DUT.DM1.Core[32] = 'b11010111; // parity
  DUT.DM1.Core[33] = 'b10000011; // parity
  DUT.DM1.Core[34] = 'b11010110; // global
  DUT.DM1.Core[35] = 'b10000010; // global
  DUT.DM1.Core[36] = 'b11010111; // data 
  DUT.DM1.Core[37] = 'b10000000; // data
  DUT.DM1.Core[38] = 'b11110111; // data
  DUT.DM1.Core[39] = 'b10000010; // data
  DUT.DM1.Core[40] = 'b01100110; // correct
  DUT.DM1.Core[41] = 'b10101010; // correct
  DUT.DM1.Core[42] = 'b01111110; // parity + data
  DUT.DM1.Core[43] = 'b10101010; // parity + data
  DUT.DM1.Core[44] = 'b01100000; // 2 parities
  DUT.DM1.Core[45] = 'b10101010; // 2 parities
  DUT.DM1.Core[46] = 'b01100110; // 2 data
  DUT.DM1.Core[47] = 'b10101100; // 2 data
  DUT.DM1.Core[48] = 'b01100111; // global + parity
  DUT.DM1.Core[49] = 'b10101011; // global + parity
  DUT.DM1.Core[50] = 'b11100111; // global + data
  DUT.DM1.Core[51] = 'b10101010; // global + data
  DUT.DM1.Core[52] = 'b11110110; // correct
  DUT.DM1.Core[53] = 'b00001001; // correct
  DUT.DM1.Core[54] = 'b10110001; // correct
  DUT.DM1.Core[55] = 'b11010111; // correct
  DUT.DM1.Core[56] = 'b00000000; // correct
  DUT.DM1.Core[57] = 'b00000000; // correct
  DUT.DM1.Core[58] = 'b11111111; // correct
  DUT.DM1.Core[59] = 'b11111111; // correct
  // launch program in DUT
  #10 Req = 0;

  // Wait for done flag, then display results
  wait (Ack);
  #10 $display("------------------------------------------");
  if (DUT.DM1.Core[0] != 'b00011100) begin
    $display("ERROR, mem[0] should be %b, but is %b",8'b00011100, DUT.DM1.Core[0]);
  end
  if (DUT.DM1.Core[1] != 'b00000100) begin
    $display("ERROR, mem[1] should be %b, but is %b",8'b00000100, DUT.DM1.Core[1]);
  end
  if (DUT.DM1.Core[2] != 'b00011100) begin
    $display("ERROR, mem[2] should be %b, but is %b",8'b00011100, DUT.DM1.Core[2]);
  end
  if (DUT.DM1.Core[3] != 'b01000100) begin
    $display("ERROR, mem[3] should be %b, but is %b",8'b01000100, DUT.DM1.Core[3]);
  end
  if (DUT.DM1.Core[4] != 'b00011100) begin
    $display("ERROR, mem[4] should be %b, but is %b",8'b00011100, DUT.DM1.Core[4]);
  end
  if (DUT.DM1.Core[5] != 'b01000100) begin
    $display("ERROR, mem[5] should be %b, but is %b",8'b01000100, DUT.DM1.Core[5]);
  end
  if (DUT.DM1.Core[6] != 'b00011100) begin
    $display("ERROR, mem[6] should be %b, but is %b",8'b00011100, DUT.DM1.Core[6]);
  end
  if (DUT.DM1.Core[7] != 'b01000100) begin
    $display("ERROR, mem[7] should be %b, but is %b",8'b01000100, DUT.DM1.Core[7]);
  end
  if (DUT.DM1.Core[8] != 'b00011100) begin
    $display("ERROR, mem[8] should be %b, but is %b",8'b00011100, DUT.DM1.Core[8]);
  end
  if (DUT.DM1.Core[9] != 'b01000100) begin
    $display("ERROR, mem[9] should be %b, but is %b",8'b01000100, DUT.DM1.Core[9]);
  end
  if (DUT.DM1.Core[10] != 'b01010110) begin
    $display("ERROR, mem[10] should be %b, but is %b",8'b01010110, DUT.DM1.Core[10]);
  end
  if (DUT.DM1.Core[11] != 'b00000101) begin
    $display("ERROR, mem[11] should be %b, but is %b",8'b00000101, DUT.DM1.Core[11]);
  end
  if (DUT.DM1.Core[12] != 'b01010111) begin
    $display("ERROR, mem[12] should be %b, but is %b",8'b01010111, DUT.DM1.Core[12]);
  end
  if (DUT.DM1.Core[13] != 'b10000101) begin
    $display("ERROR, mem[13] should be %b, but is %b",8'b10000101, DUT.DM1.Core[13]);
  end
  if (DUT.DM1.Core[14] != 'b01010110) begin
    $display("ERROR, mem[14] should be %b, but is %b",8'b01010110, DUT.DM1.Core[14]);
  end
  if (DUT.DM1.Core[15] != 'b10000101) begin
    $display("ERROR, mem[15] should be %b, but is %b",8'b10000101, DUT.DM1.Core[15]);
  end
  if (DUT.DM1.Core[16] != 'b01100110) begin
    $display("ERROR, mem[16] should be %b, but is %b",8'b01100110, DUT.DM1.Core[16]);
  end
  if (DUT.DM1.Core[17] != 'b10000101) begin
    $display("ERROR, mem[17] should be %b, but is %b",8'b10000101, DUT.DM1.Core[17]);
  end
  if (DUT.DM1.Core[18] != 'b01010110) begin
    $display("ERROR, mem[18] should be %b, but is %b",8'b01010110, DUT.DM1.Core[18]);
  end
  if (DUT.DM1.Core[19] != 'b10000101) begin
    $display("ERROR, mem[19] should be %b, but is %b",8'b10000101, DUT.DM1.Core[19]);
  end
  if (DUT.DM1.Core[20] != 'b01011110) begin
    $display("ERROR, mem[20] should be %b, but is %b",8'b01010110, DUT.DM1.Core[20]);
  end
  if (DUT.DM1.Core[21] != 'b10000101) begin
    $display("ERROR, mem[21] should be %b, but is %b",8'b10000101, DUT.DM1.Core[21]);
  end
  if (DUT.DM1.Core[22] != 'b01001110) begin
    $display("ERROR, mem[22] should be %b, but is %b",8'b01001110, DUT.DM1.Core[22]);
  end
  if (DUT.DM1.Core[23] != 'b00000000) begin
    $display("ERROR, mem[23] should be %b, but is %b",8'b00000000, DUT.DM1.Core[23]);
  end
  if (DUT.DM1.Core[24] != 'b10111010) begin
    $display("ERROR, mem[24] should be %b, but is %b",8'b10111010, DUT.DM1.Core[24]);
  end
  if (DUT.DM1.Core[25] != 'b00000110) begin
    $display("ERROR, mem[25] should be %b, but is %b",8'b00000110, DUT.DM1.Core[25]);
  end
  if (DUT.DM1.Core[26] != 'b00000000) begin
    $display("ERROR, mem[26] should be %b, but is %b",8'b00000000, DUT.DM1.Core[26]);
  end
  if (DUT.DM1.Core[27] != 'b00000000) begin
    $display("ERROR, mem[27] should be %b, but is %b",8'b00000000, DUT.DM1.Core[27]);
  end
  if (DUT.DM1.Core[28] != 'b11111111) begin
    $display("ERROR, mem[28] should be %b, but is %b",8'b11111111, DUT.DM1.Core[28]);
  end
  if (DUT.DM1.Core[29] != 'b00000111) begin
    $display("ERROR, mem[29] should be %b, but is %b",8'b00000111, DUT.DM1.Core[29]);
  end
  // Note: $stop acts like a breakpoint, pausing the simulation
  // and allowing certain tools to interact with it more, in
  // contrast to $finish, which ends the simulation.
  #10 $stop;
end

// This generates the system clock
always begin   // clock period = 10 Verilog time units
  #5 Clk = 1'b1;
  #5 Clk = 1'b0;
end
endmodule
