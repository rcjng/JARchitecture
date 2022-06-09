// Create Date:   2017.01.25
// Design Name:   TopLevel Test Bench
// Module Name:   TopLevel_tb.v
// CSE141L

// This is NOT synthesizable; use for logic simulation only
// Verilog Test Fixture created for module: TopLevel

module TopLevel_program3_tb;

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

  // TEST 1
  // DUT.DM1.Core[0] = 'b11011011;
  // DUT.DM1.Core[1] = 'b10001000;
  // DUT.DM1.Core[2] = 'b10010101;
  // DUT.DM1.Core[3] = 'b11000110;
  // DUT.DM1.Core[4] = 'b10110101;
  // DUT.DM1.Core[5] = 'b00010011;
  // DUT.DM1.Core[6] = 'b01000100;
  // DUT.DM1.Core[7] = 'b00011111;
  // DUT.DM1.Core[8] = 'b10011111;
  // DUT.DM1.Core[9] = 'b10011111;
  // DUT.DM1.Core[10] = 'b01011100;
  // DUT.DM1.Core[11] = 'b01000010;
  // DUT.DM1.Core[12] = 'b11011010;
  // DUT.DM1.Core[13] = 'b10010100;
  // DUT.DM1.Core[14] = 'b10001110;
  // DUT.DM1.Core[15] = 'b00011111;
  // DUT.DM1.Core[16] = 'b00000101;
  // DUT.DM1.Core[17] = 'b01011110;
  // DUT.DM1.Core[18] = 'b01011001;
  // DUT.DM1.Core[19] = 'b01110101;
  // DUT.DM1.Core[20] = 'b11101010;
  // DUT.DM1.Core[21] = 'b11011010;
  // DUT.DM1.Core[22] = 'b11000000;
  // DUT.DM1.Core[23] = 'b10010100;
  // DUT.DM1.Core[24] = 'b10010100;
  // DUT.DM1.Core[25] = 'b00010101;
  // DUT.DM1.Core[26] = 'b00110110;
  // DUT.DM1.Core[27] = 'b01111010;
  // DUT.DM1.Core[28] = 'b00101011;
  // DUT.DM1.Core[29] = 'b00011100;
  // DUT.DM1.Core[30] = 'b11110110;
  // DUT.DM1.Core[31] = 'b01101110;
  // DUT.DM1.Core[32] = 'b10111000;

  // TEST 2
  // DUT.DM1.Core[0] = 'b00110101;
  // DUT.DM1.Core[1] = 'b00110001;
  // DUT.DM1.Core[2] = 'b01101001;
  // DUT.DM1.Core[3] = 'b11011001;
  // DUT.DM1.Core[4] = 'b00001010;
  // DUT.DM1.Core[5] = 'b11010010;
  // DUT.DM1.Core[6] = 'b11011011;
  // DUT.DM1.Core[7] = 'b11101101;
  // DUT.DM1.Core[8] = 'b01100010;
  // DUT.DM1.Core[9] = 'b00110110;
  // DUT.DM1.Core[10] = 'b01001010;
  // DUT.DM1.Core[11] = 'b11111001;
  // DUT.DM1.Core[12] = 'b11010001;
  // DUT.DM1.Core[13] = 'b00101000;
  // DUT.DM1.Core[14] = 'b00100001;
  // DUT.DM1.Core[15] = 'b01011011;
  // DUT.DM1.Core[16] = 'b01000000;
  // DUT.DM1.Core[17] = 'b00010111;
  // DUT.DM1.Core[18] = 'b11100110;
  // DUT.DM1.Core[19] = 'b11110000;
  // DUT.DM1.Core[20] = 'b11001011;
  // DUT.DM1.Core[21] = 'b10100000;
  // DUT.DM1.Core[22] = 'b01010000;
  // DUT.DM1.Core[23] = 'b01101110;
  // DUT.DM1.Core[24] = 'b11001001;
  // DUT.DM1.Core[25] = 'b00001011;
  // DUT.DM1.Core[26] = 'b00100000;
  // DUT.DM1.Core[27] = 'b10001100;
  // DUT.DM1.Core[28] = 'b11111110;
  // DUT.DM1.Core[29] = 'b11101011;
  // DUT.DM1.Core[30] = 'b01110010;
  // DUT.DM1.Core[31] = 'b11110001;
  // DUT.DM1.Core[32] = 'b00000000;

  // TEST 3
  // DUT.DM1.Core[0] = 'b11011011;
  // DUT.DM1.Core[1] = 'b00100100;
  // DUT.DM1.Core[2] = 'b11001100;
  // DUT.DM1.Core[3] = 'b00001111;
  // DUT.DM1.Core[4] = 'b11001110;
  // DUT.DM1.Core[5] = 'b11001101;
  // DUT.DM1.Core[6] = 'b11110001;
  // DUT.DM1.Core[7] = 'b01000000;
  // DUT.DM1.Core[8] = 'b01101010;
  // DUT.DM1.Core[9] = 'b10111010;
  // DUT.DM1.Core[10] = 'b00010111;
  // DUT.DM1.Core[11] = 'b11010111;
  // DUT.DM1.Core[12] = 'b11001101;
  // DUT.DM1.Core[13] = 'b10100100;
  // DUT.DM1.Core[14] = 'b00000100;
  // DUT.DM1.Core[15] = 'b00111011;
  // DUT.DM1.Core[16] = 'b11010111;
  // DUT.DM1.Core[17] = 'b10010101;
  // DUT.DM1.Core[18] = 'b10111100;
  // DUT.DM1.Core[19] = 'b00110000;
  // DUT.DM1.Core[20] = 'b11000101;
  // DUT.DM1.Core[21] = 'b10111011;
  // DUT.DM1.Core[22] = 'b00010001;
  // DUT.DM1.Core[23] = 'b00010100;
  // DUT.DM1.Core[24] = 'b10101011;
  // DUT.DM1.Core[25] = 'b01100100;
  // DUT.DM1.Core[26] = 'b10110001;
  // DUT.DM1.Core[27] = 'b01010011;
  // DUT.DM1.Core[28] = 'b01010111;
  // DUT.DM1.Core[29] = 'b01111011;
  // DUT.DM1.Core[30] = 'b00001011;
  // DUT.DM1.Core[31] = 'b10011010;
  // DUT.DM1.Core[32] = 'b11010000;

  // TEST 4
  // DUT.DM1.Core[0] = 'b11110010;
  // DUT.DM1.Core[1] = 'b11110110;
  // DUT.DM1.Core[2] = 'b10010001;
  // DUT.DM1.Core[3] = 'b11000110;
  // DUT.DM1.Core[4] = 'b00001001;
  // DUT.DM1.Core[5] = 'b00000000;
  // DUT.DM1.Core[6] = 'b11110000;
  // DUT.DM1.Core[7] = 'b11101001;
  // DUT.DM1.Core[8] = 'b01000111;
  // DUT.DM1.Core[9] = 'b01100000;
  // DUT.DM1.Core[10] = 'b00111000;
  // DUT.DM1.Core[11] = 'b10000001;
  // DUT.DM1.Core[12] = 'b00111100;
  // DUT.DM1.Core[13] = 'b01110000;
  // DUT.DM1.Core[14] = 'b11111010;
  // DUT.DM1.Core[15] = 'b01100000;
  // DUT.DM1.Core[16] = 'b10111011;
  // DUT.DM1.Core[17] = 'b10000011;
  // DUT.DM1.Core[18] = 'b10010010;
  // DUT.DM1.Core[19] = 'b01000011;
  // DUT.DM1.Core[20] = 'b11010101;
  // DUT.DM1.Core[21] = 'b01101011;
  // DUT.DM1.Core[22] = 'b11011010;
  // DUT.DM1.Core[23] = 'b00000101;
  // DUT.DM1.Core[24] = 'b01100010;
  // DUT.DM1.Core[25] = 'b01001011;
  // DUT.DM1.Core[26] = 'b11111000;
  // DUT.DM1.Core[27] = 'b10011110;
  // DUT.DM1.Core[28] = 'b01010010;
  // DUT.DM1.Core[29] = 'b11101010;
  // DUT.DM1.Core[30] = 'b11111111;
  // DUT.DM1.Core[31] = 'b01001010;
  // DUT.DM1.Core[32] = 'b10000000;
  
  // TEST 5
  // DUT.DM1.Core[0] = 'b11001100;
  // DUT.DM1.Core[1] = 'b00110000;
  // DUT.DM1.Core[2] = 'b10010101;
  // DUT.DM1.Core[3] = 'b10110010;
  // DUT.DM1.Core[4] = 'b01101000;
  // DUT.DM1.Core[5] = 'b00101110;
  // DUT.DM1.Core[6] = 'b10101001;
  // DUT.DM1.Core[7] = 'b01100000;
  // DUT.DM1.Core[8] = 'b11111100;
  // DUT.DM1.Core[9] = 'b11110001;
  // DUT.DM1.Core[10] = 'b10101100;
  // DUT.DM1.Core[11] = 'b10101001;
  // DUT.DM1.Core[12] = 'b10001101;
  // DUT.DM1.Core[13] = 'b11110111;
  // DUT.DM1.Core[14] = 'b10010111;
  // DUT.DM1.Core[15] = 'b11011000;
  // DUT.DM1.Core[16] = 'b11101010;
  // DUT.DM1.Core[17] = 'b11001010;
  // DUT.DM1.Core[18] = 'b00110101;
  // DUT.DM1.Core[19] = 'b01110111;
  // DUT.DM1.Core[20] = 'b11111000;
  // DUT.DM1.Core[21] = 'b01010011;
  // DUT.DM1.Core[22] = 'b01111111;
  // DUT.DM1.Core[23] = 'b11101010;
  // DUT.DM1.Core[24] = 'b00001110;
  // DUT.DM1.Core[25] = 'b10000111;
  // DUT.DM1.Core[26] = 'b01110111;
  // DUT.DM1.Core[27] = 'b01110110;
  // DUT.DM1.Core[28] = 'b00111110;
  // DUT.DM1.Core[29] = 'b01110100;
  // DUT.DM1.Core[30] = 'b00010111;
  // DUT.DM1.Core[31] = 'b01001011;
  // DUT.DM1.Core[32] = 'b01010000;

  // TEST 6
  // DUT.DM1.Core[0] = 'b10000001;
  // DUT.DM1.Core[1] = 'b00111010;
  // DUT.DM1.Core[2] = 'b11010000;
  // DUT.DM1.Core[3] = 'b00011110;
  // DUT.DM1.Core[4] = 'b10110100;
  // DUT.DM1.Core[5] = 'b11110000;
  // DUT.DM1.Core[6] = 'b11100000;
  // DUT.DM1.Core[7] = 'b10011011;
  // DUT.DM1.Core[8] = 'b00011110;
  // DUT.DM1.Core[9] = 'b10000111;
  // DUT.DM1.Core[10] = 'b11100111;
  // DUT.DM1.Core[11] = 'b11000010;
  // DUT.DM1.Core[12] = 'b10010001;
  // DUT.DM1.Core[13] = 'b10100001;
  // DUT.DM1.Core[14] = 'b01011110;
  // DUT.DM1.Core[15] = 'b00000010;
  // DUT.DM1.Core[16] = 'b10100000;
  // DUT.DM1.Core[17] = 'b01000111;
  // DUT.DM1.Core[18] = 'b01100100;
  // DUT.DM1.Core[19] = 'b01011111;
  // DUT.DM1.Core[20] = 'b00011111;
  // DUT.DM1.Core[21] = 'b01100101;
  // DUT.DM1.Core[22] = 'b01000000;
  // DUT.DM1.Core[23] = 'b10111010;
  // DUT.DM1.Core[24] = 'b01101110;
  // DUT.DM1.Core[25] = 'b01111101;
  // DUT.DM1.Core[26] = 'b01011010;
  // DUT.DM1.Core[27] = 'b11001110;
  // DUT.DM1.Core[28] = 'b10000101;
  // DUT.DM1.Core[29] = 'b01001101;
  // DUT.DM1.Core[30] = 'b10100010;
  // DUT.DM1.Core[31] = 'b10010000;
  // DUT.DM1.Core[32] = 'b11000000;

  // TEST 7
  // DUT.DM1.Core[0] = 'b00000110;
  // DUT.DM1.Core[1] = 'b10110000;
  // DUT.DM1.Core[2] = 'b10000001;
  // DUT.DM1.Core[3] = 'b00101110;
  // DUT.DM1.Core[4] = 'b10011111;
  // DUT.DM1.Core[5] = 'b10110010;
  // DUT.DM1.Core[6] = 'b00111101;
  // DUT.DM1.Core[7] = 'b01111110;
  // DUT.DM1.Core[8] = 'b00000100;
  // DUT.DM1.Core[9] = 'b11100110;
  // DUT.DM1.Core[10] = 'b01110101;
  // DUT.DM1.Core[11] = 'b10000111;
  // DUT.DM1.Core[12] = 'b00100110;
  // DUT.DM1.Core[13] = 'b10101011;
  // DUT.DM1.Core[14] = 'b01011001;
  // DUT.DM1.Core[15] = 'b10111010;
  // DUT.DM1.Core[16] = 'b11101101;
  // DUT.DM1.Core[17] = 'b10110101;
  // DUT.DM1.Core[18] = 'b10011111;
  // DUT.DM1.Core[19] = 'b00101111;
  // DUT.DM1.Core[20] = 'b11101101;
  // DUT.DM1.Core[21] = 'b01001001;
  // DUT.DM1.Core[22] = 'b11000100;
  // DUT.DM1.Core[23] = 'b11111010;
  // DUT.DM1.Core[24] = 'b01011110;
  // DUT.DM1.Core[25] = 'b11001011;
  // DUT.DM1.Core[26] = 'b00000100;
  // DUT.DM1.Core[27] = 'b10011000;
  // DUT.DM1.Core[28] = 'b10111000;
  // DUT.DM1.Core[29] = 'b10010011;
  // DUT.DM1.Core[30] = 'b10001111;
  // DUT.DM1.Core[31] = 'b01010111;
  // DUT.DM1.Core[32] = 'b10000000;

  // TEST 8
  // DUT.DM1.Core[0] = 'b11101001;
  // DUT.DM1.Core[1] = 'b11001001;
  // DUT.DM1.Core[2] = 'b11100000;
  // DUT.DM1.Core[3] = 'b01010100;
  // DUT.DM1.Core[4] = 'b00110011;
  // DUT.DM1.Core[5] = 'b11011000;
  // DUT.DM1.Core[6] = 'b10110101;
  // DUT.DM1.Core[7] = 'b00001010;
  // DUT.DM1.Core[8] = 'b11001110;
  // DUT.DM1.Core[9] = 'b11011100;
  // DUT.DM1.Core[10] = 'b10101111;
  // DUT.DM1.Core[11] = 'b00111100;
  // DUT.DM1.Core[12] = 'b00011111;
  // DUT.DM1.Core[13] = 'b11110110;
  // DUT.DM1.Core[14] = 'b01110001;
  // DUT.DM1.Core[15] = 'b11011010;
  // DUT.DM1.Core[16] = 'b11011001;
  // DUT.DM1.Core[17] = 'b11000000;
  // DUT.DM1.Core[18] = 'b01110010;
  // DUT.DM1.Core[19] = 'b00001001;
  // DUT.DM1.Core[20] = 'b10101010;
  // DUT.DM1.Core[21] = 'b01011100;
  // DUT.DM1.Core[22] = 'b10011110;
  // DUT.DM1.Core[23] = 'b10011000;
  // DUT.DM1.Core[24] = 'b00111101;
  // DUT.DM1.Core[25] = 'b00000111;
  // DUT.DM1.Core[26] = 'b00011101;
  // DUT.DM1.Core[27] = 'b01000000;
  // DUT.DM1.Core[28] = 'b01011001;
  // DUT.DM1.Core[29] = 'b01011111;
  // DUT.DM1.Core[30] = 'b11010010;
  // DUT.DM1.Core[31] = 'b11010110;
  // DUT.DM1.Core[32] = 'b01100000;

  // TEST 9
  // DUT.DM1.Core[0] = 'b11111111;
  // DUT.DM1.Core[1] = 'b11111111;
  // DUT.DM1.Core[2] = 'b11111111;
  // DUT.DM1.Core[3] = 'b11111111;
  // DUT.DM1.Core[4] = 'b11111111;
  // DUT.DM1.Core[5] = 'b11111111;
  // DUT.DM1.Core[6] = 'b11111111;
  // DUT.DM1.Core[7] = 'b11111111;
  // DUT.DM1.Core[8] = 'b11111111;
  // DUT.DM1.Core[9] = 'b11111111;
  // DUT.DM1.Core[10] = 'b11111111;
  // DUT.DM1.Core[11] = 'b11111111;
  // DUT.DM1.Core[12] = 'b11111111;
  // DUT.DM1.Core[13] = 'b11111111;
  // DUT.DM1.Core[14] = 'b11111111;
  // DUT.DM1.Core[15] = 'b11111111;
  // DUT.DM1.Core[16] = 'b11111111;
  // DUT.DM1.Core[17] = 'b11111111;
  // DUT.DM1.Core[18] = 'b11111111;
  // DUT.DM1.Core[19] = 'b11111111;
  // DUT.DM1.Core[20] = 'b11111111;
  // DUT.DM1.Core[21] = 'b11111111;
  // DUT.DM1.Core[22] = 'b11111111;
  // DUT.DM1.Core[23] = 'b11111111;
  // DUT.DM1.Core[24] = 'b11111111;
  // DUT.DM1.Core[25] = 'b11111111;
  // DUT.DM1.Core[26] = 'b11111111;
  // DUT.DM1.Core[27] = 'b11111111;
  // DUT.DM1.Core[28] = 'b11111111;
  // DUT.DM1.Core[29] = 'b11111111;
  // DUT.DM1.Core[30] = 'b11111111;
  // DUT.DM1.Core[31] = 'b11111111;
  // DUT.DM1.Core[32] = 'b11111000;

  // TEST 10
  // DUT.DM1.Core[0] = 'b01011001;
  // DUT.DM1.Core[1] = 'b10010111;
  // DUT.DM1.Core[2] = 'b01010110;
  // DUT.DM1.Core[3] = 'b01011010;
  // DUT.DM1.Core[4] = 'b11100010;
  // DUT.DM1.Core[5] = 'b01101100;
  // DUT.DM1.Core[6] = 'b01100110;
  // DUT.DM1.Core[7] = 'b01010111;
  // DUT.DM1.Core[8] = 'b00100111;
  // DUT.DM1.Core[9] = 'b01001000;
  // DUT.DM1.Core[10] = 'b00010111;
  // DUT.DM1.Core[11] = 'b10001100;
  // DUT.DM1.Core[12] = 'b10111001;
  // DUT.DM1.Core[13] = 'b01111110;
  // DUT.DM1.Core[14] = 'b00100001;
  // DUT.DM1.Core[15] = 'b01110111;
  // DUT.DM1.Core[16] = 'b10110110;
  // DUT.DM1.Core[17] = 'b01011110;
  // DUT.DM1.Core[18] = 'b00000011;
  // DUT.DM1.Core[19] = 'b00101001;
  // DUT.DM1.Core[20] = 'b01111100;
  // DUT.DM1.Core[21] = 'b11110100;
  // DUT.DM1.Core[22] = 'b11111111;
  // DUT.DM1.Core[23] = 'b00001010;
  // DUT.DM1.Core[24] = 'b11011010;
  // DUT.DM1.Core[25] = 'b11010011;
  // DUT.DM1.Core[26] = 'b00111000;
  // DUT.DM1.Core[27] = 'b11001001;
  // DUT.DM1.Core[28] = 'b01111000;
  // DUT.DM1.Core[29] = 'b01000100;
  // DUT.DM1.Core[30] = 'b10001101;
  // DUT.DM1.Core[31] = 'b01100000;
  // DUT.DM1.Core[32] = 'b00011000;

  // TEST 11
  // DUT.DM1.Core[0] = 'b10111111;
  // DUT.DM1.Core[1] = 'b01110100;
  // DUT.DM1.Core[2] = 'b11100111;
  // DUT.DM1.Core[3] = 'b11110000;
  // DUT.DM1.Core[4] = 'b11010110;
  // DUT.DM1.Core[5] = 'b11101101;
  // DUT.DM1.Core[6] = 'b11100110;
  // DUT.DM1.Core[7] = 'b10101111;
  // DUT.DM1.Core[8] = 'b10111011;
  // DUT.DM1.Core[9] = 'b00000000;
  // DUT.DM1.Core[10] = 'b01101010;
  // DUT.DM1.Core[11] = 'b11101111;
  // DUT.DM1.Core[12] = 'b00101010;
  // DUT.DM1.Core[13] = 'b10001100;
  // DUT.DM1.Core[14] = 'b11010001;
  // DUT.DM1.Core[15] = 'b00011010;
  // DUT.DM1.Core[16] = 'b10010010;
  // DUT.DM1.Core[17] = 'b00111101;
  // DUT.DM1.Core[18] = 'b01110011;
  // DUT.DM1.Core[19] = 'b10000001;
  // DUT.DM1.Core[20] = 'b00101000;
  // DUT.DM1.Core[21] = 'b10011010;
  // DUT.DM1.Core[22] = 'b10110010;
  // DUT.DM1.Core[23] = 'b10000100;
  // DUT.DM1.Core[24] = 'b01100101;
  // DUT.DM1.Core[25] = 'b10000111;
  // DUT.DM1.Core[26] = 'b10010000;
  // DUT.DM1.Core[27] = 'b11111010;
  // DUT.DM1.Core[28] = 'b01010001;
  // DUT.DM1.Core[29] = 'b01000110;
  // DUT.DM1.Core[30] = 'b10110011;
  // DUT.DM1.Core[31] = 'b01101100;
  // DUT.DM1.Core[32] = 'b01100000;

  // TEST 12
  // DUT.DM1.Core[0] = 'b10110000;
  // DUT.DM1.Core[1] = 'b10011011;
  // DUT.DM1.Core[2] = 'b11000011;
  // DUT.DM1.Core[3] = 'b10101000;
  // DUT.DM1.Core[4] = 'b11101111;
  // DUT.DM1.Core[5] = 'b10111010;
  // DUT.DM1.Core[6] = 'b01110100;
  // DUT.DM1.Core[7] = 'b01011011;
  // DUT.DM1.Core[8] = 'b10111010;
  // DUT.DM1.Core[9] = 'b00100010;
  // DUT.DM1.Core[10] = 'b00011101;
  // DUT.DM1.Core[11] = 'b00101101;
  // DUT.DM1.Core[12] = 'b10000101;
  // DUT.DM1.Core[13] = 'b11111101;
  // DUT.DM1.Core[14] = 'b01101101;
  // DUT.DM1.Core[15] = 'b10100110;
  // DUT.DM1.Core[16] = 'b11011001;
  // DUT.DM1.Core[17] = 'b11010110;
  // DUT.DM1.Core[18] = 'b11010011;
  // DUT.DM1.Core[19] = 'b10100001;
  // DUT.DM1.Core[20] = 'b11100111;
  // DUT.DM1.Core[21] = 'b00011010;
  // DUT.DM1.Core[22] = 'b01110100;
  // DUT.DM1.Core[23] = 'b00001100;
  // DUT.DM1.Core[24] = 'b01100000;
  // DUT.DM1.Core[25] = 'b01111100;
  // DUT.DM1.Core[26] = 'b00100110;
  // DUT.DM1.Core[27] = 'b10101101;
  // DUT.DM1.Core[28] = 'b11000100;
  // DUT.DM1.Core[29] = 'b01010101;
  // DUT.DM1.Core[30] = 'b11001001;
  // DUT.DM1.Core[31] = 'b11100101;
  // DUT.DM1.Core[32] = 'b01001000;

  // TEST 13
  DUT.DM1.Core[0] = 'b11011010;
  DUT.DM1.Core[1] = 'b11101000;
  DUT.DM1.Core[2] = 'b11111101;
  DUT.DM1.Core[3] = 'b01110110;
  DUT.DM1.Core[4] = 'b11000101;
  DUT.DM1.Core[5] = 'b11011110;
  DUT.DM1.Core[6] = 'b01110001;
  DUT.DM1.Core[7] = 'b11111110;
  DUT.DM1.Core[8] = 'b10000101;
  DUT.DM1.Core[9] = 'b11011000;
  DUT.DM1.Core[10] = 'b10010010;
  DUT.DM1.Core[11] = 'b00111110;
  DUT.DM1.Core[12] = 'b11101101;
  DUT.DM1.Core[13] = 'b00111100;
  DUT.DM1.Core[14] = 'b00001101;
  DUT.DM1.Core[15] = 'b00010100;
  DUT.DM1.Core[16] = 'b00000000;
  DUT.DM1.Core[17] = 'b11001011;
  DUT.DM1.Core[18] = 'b00011011;
  DUT.DM1.Core[19] = 'b10011110;
  DUT.DM1.Core[20] = 'b00000000;
  DUT.DM1.Core[21] = 'b01001000;
  DUT.DM1.Core[22] = 'b01011011;
  DUT.DM1.Core[23] = 'b00100111;
  DUT.DM1.Core[24] = 'b01100011;
  DUT.DM1.Core[25] = 'b00000100;
  DUT.DM1.Core[26] = 'b10100000;
  DUT.DM1.Core[27] = 'b01101111;
  DUT.DM1.Core[28] = 'b00000000;
  DUT.DM1.Core[29] = 'b11101000;
  DUT.DM1.Core[30] = 'b01111011;
  DUT.DM1.Core[31] = 'b10101101;
  DUT.DM1.Core[32] = 'b11001000;


  // launch program in DUT
  #10 Req = 0;

  // Wait for done flag, then display results
  wait (Ack);
  #10 $display("------------------------------------------");
  // TEST 1
  // if (DUT.DM1.Core[33] != 'b00000011) begin
  //   $display("ERROR, mem[33] should be %b, but is %b", 8'b00000011, DUT.DM1.Core[33]);
  // end
  // if (DUT.DM1.Core[34] != 'b00000011) begin
  //     $display("ERROR, mem[34] should be %b, but is %b", 8'b00000011, DUT.DM1.Core[34]);
  // end
  // if (DUT.DM1.Core[35] != 'b00000111) begin
  //     $display("ERROR, mem[35] should be %b, but is %b", 8'b00000111, DUT.DM1.Core[35]);
  // end

  // TEST 2
  // if (DUT.DM1.Core[33] != 'b00000100) begin
  //   $display("ERROR, mem[33] should be %b, but is %b", 8'b00000100, DUT.DM1.Core[33]);
  // end
  // if (DUT.DM1.Core[34] != 'b00000011) begin
  //     $display("ERROR, mem[34] should be %b, but is %b", 8'b00000011, DUT.DM1.Core[34]);
  // end
  // if (DUT.DM1.Core[35] != 'b00001010) begin
  //     $display("ERROR, mem[35] should be %b, but is %b", 8'b00001010, DUT.DM1.Core[35]);
  // end

  // TEST 3
  // if (DUT.DM1.Core[33] != 'b00000101) begin
  //   $display("ERROR, mem[33] should be %b, but is %b", 8'b00000101, DUT.DM1.Core[33]);
  // end
  // if (DUT.DM1.Core[34] != 'b00000101) begin
  //     $display("ERROR, mem[34] should be %b, but is %b", 8'b00000101, DUT.DM1.Core[34]);
  // end
  // if (DUT.DM1.Core[35] != 'b00000111) begin
  //     $display("ERROR, mem[35] should be %b, but is %b", 8'b00000111, DUT.DM1.Core[35]);
  // end

  // TEST 4
  // if (DUT.DM1.Core[33] != 'b00000111) begin
  //   $display("ERROR, mem[33] should be %b, but is %b", 8'b00000111, DUT.DM1.Core[33]);
  // end
  // if (DUT.DM1.Core[34] != 'b00000111) begin
  //     $display("ERROR, mem[34] should be %b, but is %b", 8'b00000111, DUT.DM1.Core[34]);
  // end
  // if (DUT.DM1.Core[35] != 'b00001010) begin
  //     $display("ERROR, mem[35] should be %b, but is %b", 8'b00001010, DUT.DM1.Core[35]);
  // end

  // TEST 5
  // if (DUT.DM1.Core[33] != 'b00000111) begin
  //   $display("ERROR, mem[33] should be %b, but is %b", 8'b00000111, DUT.DM1.Core[33]);
  // end
  // if (DUT.DM1.Core[34] != 'b00000111) begin
  //     $display("ERROR, mem[34] should be %b, but is %b", 8'b00000111, DUT.DM1.Core[34]);
  // end
  // if (DUT.DM1.Core[35] != 'b00001010) begin
  //     $display("ERROR, mem[35] should be %b, but is %b", 8'b00001010, DUT.DM1.Core[35]);
  // end

  // TEST 6 
  // if (DUT.DM1.Core[33] != 'b00000011) begin
  //   $display("ERROR, mem[33] should be %b, but is %b", 8'b00000011, DUT.DM1.Core[33]);
  // end
  // if (DUT.DM1.Core[34] != 'b00000011) begin
  //     $display("ERROR, mem[34] should be %b, but is %b", 8'b00000011, DUT.DM1.Core[34]);
  // end
  // if (DUT.DM1.Core[35] != 'b00000110) begin
  //     $display("ERROR, mem[35] should be %b, but is %b", 8'b00000110, DUT.DM1.Core[35]);
  // end

  // TEST 7
  // if (DUT.DM1.Core[33] != 'b00000011) begin
  //   $display("ERROR, mem[33] should be %b, but is %b", 8'b00000011, DUT.DM1.Core[33]);
  // end
  // if (DUT.DM1.Core[34] != 'b00000011) begin
  //     $display("ERROR, mem[34] should be %b, but is %b", 8'b00000011, DUT.DM1.Core[34]);
  // end
  // if (DUT.DM1.Core[35] != 'b00000101) begin
  //     $display("ERROR, mem[35] should be %b, but is %b", 8'b00000101, DUT.DM1.Core[35]);
  // end

  // TEST 8
  // if (DUT.DM1.Core[33] != 'b00000101) begin
  //   $display("ERROR, mem[33] should be %b, but is %b", 8'b00000101, DUT.DM1.Core[33]);
  // end
  // if (DUT.DM1.Core[34] != 'b00000101) begin
  //     $display("ERROR, mem[34] should be %b, but is %b", 8'b00000101, DUT.DM1.Core[34]);
  // end
  // if (DUT.DM1.Core[35] != 'b00000111) begin
  //     $display("ERROR, mem[35] should be %b, but is %b", 8'b00000111, DUT.DM1.Core[35]);
  // end

  // TEST 9
  // if (DUT.DM1.Core[33] != 'b10000000) begin
  //   $display("ERROR, mem[33] should be %b, but is %b", 8'b10000000, DUT.DM1.Core[33]);
  // end
  // if (DUT.DM1.Core[34] != 'b00100000) begin
  //     $display("ERROR, mem[34] should be %b, but is %b", 8'b00100000, DUT.DM1.Core[34]);
  // end
  // if (DUT.DM1.Core[35] != 'b11111100) begin
  //     $display("ERROR, mem[35] should be %b, but is %b", 8'b11111100, DUT.DM1.Core[35]);
  // end

  // TEST 10
  // if (DUT.DM1.Core[33] != 'b00000011) begin
  //   $display("ERROR, mem[33] should be %b, but is %b", 8'b00000011, DUT.DM1.Core[33]);
  // end
  // if (DUT.DM1.Core[34] != 'b00000011) begin
  //     $display("ERROR, mem[34] should be %b, but is %b", 8'b00000011, DUT.DM1.Core[34]);
  // end
  // if (DUT.DM1.Core[35] != 'b00000101) begin
  //     $display("ERROR, mem[35] should be %b, but is %b", 8'b00000101, DUT.DM1.Core[35]);
  // end

  // TEST 11
  // if (DUT.DM1.Core[33] != 'b00000101) begin
  //   $display("ERROR, mem[33] should be %b, but is %b", 8'b00000101, DUT.DM1.Core[33]);
  // end
  // if (DUT.DM1.Core[34] != 'b00000101) begin
  //     $display("ERROR, mem[34] should be %b, but is %b", 8'b00000101, DUT.DM1.Core[34]);
  // end
  // if (DUT.DM1.Core[35] != 'b00000111) begin
  //     $display("ERROR, mem[35] should be %b, but is %b", 8'b00000111, DUT.DM1.Core[35]);
  // end

  // TEST 12
  // if (DUT.DM1.Core[33] != 'b00000100) begin
  //   $display("ERROR, mem[33] should be %b, but is %b", 8'b00000100, DUT.DM1.Core[33]);
  // end
  // if (DUT.DM1.Core[34] != 'b00000100) begin
  //     $display("ERROR, mem[34] should be %b, but is %b", 8'b00000100, DUT.DM1.Core[34]);
  // end
  // if (DUT.DM1.Core[35] != 'b00001000) begin
  //     $display("ERROR, mem[35] should be %b, but is %b", 8'b00001000, DUT.DM1.Core[35]);
  // end

  // TEST 13
  if (DUT.DM1.Core[33] != 'b00000001) begin
    $display("ERROR, mem[33] should be %b, but is %b", 8'b00000001, DUT.DM1.Core[33]);
  end
  if (DUT.DM1.Core[34] != 'b00000001) begin
      $display("ERROR, mem[34] should be %b, but is %b", 8'b00000001, DUT.DM1.Core[34]);
  end
  if (DUT.DM1.Core[35] != 'b00000100) begin
      $display("ERROR, mem[35] should be %b, but is %b", 8'b00000100, DUT.DM1.Core[35]);
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
