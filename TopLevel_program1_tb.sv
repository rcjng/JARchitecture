// Create Date:   2017.01.25
// Design Name:   TopLevel Test Bench
// Module Name:   TopLevel_tb.v
// CSE141L

// This is NOT synthesizable; use for logic simulation only
// Verilog Test Fixture created for module: TopLevel

module TopLevel_program1_tb;

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

  DUT.DM1.Core[0] = 'b01001110;
  DUT.DM1.Core[1] = 'b00000000;
  DUT.DM1.Core[2] = 'b00011100;
  DUT.DM1.Core[3] = 'b00000100;
  DUT.DM1.Core[4] = 'b10111010;
  DUT.DM1.Core[5] = 'b00000110;
  DUT.DM1.Core[6] = 'b01010110;
  DUT.DM1.Core[7] = 'b00000101;
  DUT.DM1.Core[8] = 'b00000000;
  DUT.DM1.Core[9] = 'b00000000;
  DUT.DM1.Core[10] = 'b11111111;
  DUT.DM1.Core[11] = 'b00000111;
  DUT.DM1.Core[12] = 'b11010001;
  DUT.DM1.Core[13] = 'b00000011;
  DUT.DM1.Core[14] = 'b00000101;
  DUT.DM1.Core[15] = 'b00000100;
  DUT.DM1.Core[16] = 'b01110001;
  DUT.DM1.Core[17] = 'b00000100;
  DUT.DM1.Core[18] = 'b01000100;
  DUT.DM1.Core[19] = 'b00000000;
  DUT.DM1.Core[20] = 'b01101111;
  DUT.DM1.Core[21] = 'b00000111;
  DUT.DM1.Core[22] = 'b10000011;
  DUT.DM1.Core[23] = 'b00000011;
  DUT.DM1.Core[24] = 'b11100101;
  DUT.DM1.Core[25] = 'b00000111;
  DUT.DM1.Core[26] = 'b01001010;
  DUT.DM1.Core[27] = 'b00000111;
  DUT.DM1.Core[28] = 'b01011101;
  DUT.DM1.Core[29] = 'b00000110;

  // launch program in DUT
  #10 Req = 0;

  // Wait for done flag, then display results
  wait (Ack);
  #10 $display("------------------------------------------");
  if (DUT.DM1.Core[30] != 'b11110110) begin
    $display("ERROR, mem[30] should be %b, but is %b",8'b11110110, DUT.DM1.Core[30]);
  end
  if (DUT.DM1.Core[31] != 'b00001001) begin
    $display("ERROR, mem[31] should be %b, but is %b",8'b00001001, DUT.DM1.Core[31]);
  end
  if (DUT.DM1.Core[32] != 'b11010111) begin
    $display("ERROR, mem[32] should be %b, but is %b",8'b11010111, DUT.DM1.Core[32]);
  end
  if (DUT.DM1.Core[33] != 'b10000010) begin
    $display("ERROR, mem[33] should be %b, but is %b",8'b10000010, DUT.DM1.Core[33]);
  end
  if (DUT.DM1.Core[34] != 'b10110001) begin
    $display("ERROR, mem[34] should be %b, but is %b",8'b10110001, DUT.DM1.Core[34]);
  end
  if (DUT.DM1.Core[35] != 'b11010111) begin
    $display("ERROR, mem[35] should be %b, but is %b",8'b11010111, DUT.DM1.Core[35]);
  end
  if (DUT.DM1.Core[36] != 'b01100110) begin
    $display("ERROR, mem[36] should be %b, but is %b",8'b01100110, DUT.DM1.Core[36]);
  end
  if (DUT.DM1.Core[37] != 'b10101010) begin
    $display("ERROR, mem[37] should be %b, but is %b",8'b10101010, DUT.DM1.Core[37]);
  end
  if (DUT.DM1.Core[38] != 'b00000000) begin
    $display("ERROR, mem[38] should be %b, but is %b",8'b00000000, DUT.DM1.Core[38]);
  end
  if (DUT.DM1.Core[39] != 'b00000000) begin
    $display("ERROR, mem[39] should be %b, but is %b",8'b00000000, DUT.DM1.Core[39]);
  end
  if (DUT.DM1.Core[40] != 'b11111111) begin
    $display("ERROR, mem[40] should be %b, but is %b",8'b11111111, DUT.DM1.Core[40]);
  end
  if (DUT.DM1.Core[41] != 'b11111111) begin
    $display("ERROR, mem[41] should be %b, but is %b",8'b11111111, DUT.DM1.Core[41]);
  end
  if (DUT.DM1.Core[42] != 'b00011101) begin
    $display("ERROR, mem[42] should be %b, but is %b", 8'b00011101, DUT.DM1.Core[42]);
  end
  if (DUT.DM1.Core[43] != 'b01111011) begin
    $display("ERROR, mem[43] should be %b, but is %b", 8'b01111011, DUT.DM1.Core[43]);
  end
  if (DUT.DM1.Core[44] != 'b01001101) begin
    $display("ERROR, mem[44] should be %b, but is %b", 8'b01001101, DUT.DM1.Core[44]);
  end
  if (DUT.DM1.Core[45] != 'b10000001) begin
    $display("ERROR, mem[45] should be %b, but is %b", 8'b10000001, DUT.DM1.Core[45]);
  end
  if (DUT.DM1.Core[46] != 'b00011000) begin
    $display("ERROR, mem[46] should be %b, but is %b", 8'b00011000, DUT.DM1.Core[46]);
  end
  if (DUT.DM1.Core[47] != 'b10001110) begin
    $display("ERROR, mem[47] should be %b, but is %b", 8'b10001110, DUT.DM1.Core[47]);
  end
  if (DUT.DM1.Core[48] != 'b01010011) begin
    $display("ERROR, mem[48] should be %b, but is %b", 8'b01010011, DUT.DM1.Core[48]);
  end
  if (DUT.DM1.Core[49] != 'b00001001) begin
    $display("ERROR, mem[49] should be %b, but is %b", 8'b00001001, DUT.DM1.Core[49]);
  end
  if (DUT.DM1.Core[50] != 'b11101101) begin
    $display("ERROR, mem[50] should be %b, but is %b", 8'b11101101, DUT.DM1.Core[50]);
  end
  if (DUT.DM1.Core[51] != 'b11101101) begin
    $display("ERROR, mem[51] should be %b, but is %b", 8'b11101101, DUT.DM1.Core[51]);
  end
  if (DUT.DM1.Core[52] != 'b00101011) begin
    $display("ERROR, mem[52] should be %b, but is %b", 8'b00101011, DUT.DM1.Core[52]);
  end
  if (DUT.DM1.Core[53] != 'b01110001) begin
    $display("ERROR, mem[53] should be %b, but is %b", 8'b01110001, DUT.DM1.Core[53]);
  end
  if (DUT.DM1.Core[54] != 'b01011001) begin
    $display("ERROR, mem[54] should be %b, but is %b", 8'b01011001, DUT.DM1.Core[54]);
  end
  if (DUT.DM1.Core[55] != 'b11111100) begin
    $display("ERROR, mem[55] should be %b, but is %b", 8'b11111100, DUT.DM1.Core[55]);
  end
  if (DUT.DM1.Core[56] != 'b10110010) begin
    $display("ERROR, mem[56] should be %b, but is %b", 8'b10110010, DUT.DM1.Core[56]);
  end
  if (DUT.DM1.Core[57] != 'b11101000) begin
    $display("ERROR, mem[57] should be %b, but is %b", 8'b11101000, DUT.DM1.Core[57]);
  end
  if (DUT.DM1.Core[58] != 'b11001010) begin
    $display("ERROR, mem[58] should be %b, but is %b", 8'b11001010, DUT.DM1.Core[58]);
  end
  if (DUT.DM1.Core[59] != 'b11001010) begin
    $display("ERROR, mem[59] should be %b, but is %b", 8'b11001010, DUT.DM1.Core[59]);
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
