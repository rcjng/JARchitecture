// Create Date:    15:50:22 10/02/2019
// Project Name:   CSE141L
// Module Name:    InstROM 
// Description: Instruction ROM template preprogrammed with instruction values
// (see case statement)
//
// Revision:       2020.08.08
// Last Update:    2022.01.13

// Parameters:
//  A: Number of address bits in instruction memory
//  W: Width of instruction memory entry
module InstROM #(parameter A=10, W=9) (
  input        [A-1:0] InstAddress,
  output logic [W-1:0] InstOut
);

// Sample instruction format:
//   {3bit opcode; 3bit rs or rt; 3bit rt, immediate, or branch target}
//   then use LUT to map 3 bits to 10 for branch target, 8 for immediate


// Approach 1: Write machine code directly as combinational cases.
//
// This may be easier when first starting, before you have an assembler
// written or any way of automatically generating machine code.
//
// This is usually the fastest / easiest way to test individual instructions.

// always_comb begin 
//   InstOut = 'b000_000_000;       // default
//   case (InstAddress)
//     // 0 : InstOut = 'b0_0000_0000; // seti #0

//     // 1 : InstOut = 'b10_0100_001; // move $1

//     // 2 : InstOut = 'b10_0100_010; // move $2

//     // 3 : InstOut = 'b0_0000_0101; // seti #5
    
//     // 4 : InstOut = 'b10_1011_001; // setlt $1

//     // 5 : InstOut = 'b11_0_001010; // br $10

//     // 6 : InstOut = 'b0_0000_0010; // seti #2

//     // 7 : InstOut = 'b10_0000_010; // add $2

//     // 8 : InstOut = 'b10_0100_010; // move $2

//     // 9 : InstOut = 'b0_0000_0001; // seti #1

//     // 10 : InstOut = 'b10_0000_001; // add $1

//     // 11 : InstOut = 'b10_0100_001; // move $1

//     // 12 : InstOut = 'b0_0000_000; // seti #0

//     // 13 : InstOut = 'b10_1011_000; // setlt $0
    
//     // 14 : InstOut = 'b11_1_000000; // bl LUT0 Entry0

//     // 15 : InstOut = 'b0_0000_111; // seti #7

//     // 16 : InstOut = 'b10_0100_011; // move $3

//     // 17 : InstOut = 'b0_0000_010; // seti #2

//     // 18 : InstOut = 'b10_0000_010; // add $2

//     // 19 : InstOut = 'b10_0011_011; // store $3

//     // 20 : InstOut = 'b0_0000_010; // seti #2

//     // 21 : InstOut = 'b10_0010_011; // load $3

//     // 22 : InstOut = 'b10_0100_010; // move $2

//     // 23 : InstOut = 'b0_0000_011; // seti #3

//     // 24 : InstOut = 'b10_0000_010; // add $2

//     // 25 : InstOut = 'b10_0100_010; // move $2

//     // 26 : InstOut = 'b10_1111_111;  // halt

//     // (default case already covered by opening statement)
//   endcase
// end



// Approach 2: Create an actual instruction memory, and populate it
// from an external file.
//
// This is usually what you will switch to fairly quickly, once you
// start testing your actual program implementations on your core,
// rather than individual instructions.

// Declare 2-dimensional array, W bits wide, 2**A words deep
logic [W-1:0] inst_rom[2**A];

// This is where memory is read
always_comb InstOut = inst_rom[InstAddress];

// And this runs once during initalization to load instruction memory from
// external file using $readmemh or $readmemb.
initial begin
  // NOTE: This may not work depending on your simulator
  //       e.g. Questa needs the file in path of the application .exe,
  //       it doesn't care where you project code is
  $readmemb("C:\\Users\\rober\\Documents\\Projects\\SystemVerilog\\CSE141L\\JARchitecture\\src\\machine_code.txt", inst_rom);

  // So you are probably better off with an absolute path,
  // but you will have to change this example path when you
  // try this on your machine most likely:
  //$readmemb("//vmware-host/Shared Folders/Downloads/basic_proc2/machine_code.txt", inst_rom);
end

endmodule
