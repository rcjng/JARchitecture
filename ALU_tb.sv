`timescale 1ns/ 1ps

// Test bench
// Arithmetic Logic Unit

//
// INPUT: A, B
// op: 000, A ADD B
// op: 100, A_AND B
// ...
// Please refer to definitions.sv for support ops (make changes if necessary)
// OUTPUT A op B
// equal: is A == B?
// even: is the output even?
//

module ALU_tb;

// Define signals to interface with the ALU module
logic [ 7:0] INPUTA;  // data inputs
logic [ 7:0] INPUTB;
logic [ 3:0] op;      // ALU opcode, part of microcode **4 bits,
// bit SC_IN = 'b0;
wire[ 7:0] OUT;
// wire Zero;

// Define a helper wire for comparison
logic [ 7:0] expected;

// Instatiate and connect the Unit Under Test
ALU uut(
  .InputA(INPUTA),
  .InputB(INPUTB),
  // .SC_in(SC_IN),
  .OP(op),
  .Out(OUT)
  // .Zero(Zero)
);


// The actual testbench logic
initial begin
  INPUTA = 1;
  INPUTB = 1;
  op= 'b0000; // ADD
  test_alu_func; // void function call
  #5; // wait 5 units

  INPUTA = 4;
  INPUTB = 1;
  op= 'b0001; // SUB
  test_alu_func; // void function call
  #5;

  INPUTA = 'b11110000;
  INPUTB = 'b11001100;
  op = 'b0010; // AND
  test_alu_func;
  #5;

  INPUTA = 'b11110000;
  INPUTB = 'b11001100;
  op = 'b0011; // OR
  test_alu_func;
  #5;

  INPUTA = 'b11110000;
  INPUTB = 'b11001100;
  op = 'b0100; // XOR
  test_alu_func;
  #5;

  INPUTA = 4; // random value in R0?
  INPUTB = 'b11110000;
  op = 'b0101; // NOT
  test_alu_func;
  #5;

  INPUTA = 'b10011001;
  INPUTB = 2;
  op = 'b0111; // LSH
  test_alu_func;
  #5;

  INPUTA = 'b10011001;
  INPUTB = 2;
  op = 'b1000; // RSH
  test_alu_func;
  #5;

  INPUTA = 3;
  INPUTB = 5;
  op = 'b1001; // SLT
  test_alu_func;
  #5;

  INPUTA = 7;
  INPUTB = 7;
  op = 'b1010; // SEQ
  test_alu_func;
  #5;
end

task test_alu_func;
  case (op)
    0: expected = INPUTA + INPUTB;      // ADD
    1: expected = INPUTA - INPUTB;      // SUB
    2: expected = INPUTA & INPUTB;      // AND
    3: expected = INPUTA | INPUTB;      // OR
    4: expected = INPUTA ^ INPUTB;      // XOR
    5: expected = ~INPUTA;              // NOT
    6: expected = INPUTA << INPUTB;     // LSH
    7: expected = INPUTA >> INPUTB;     // RSH
    8: begin
      if (INPUTA < INPUTB) begin
        expected = 1;
      end
      else begin
        expected = 0;
      end
    end
    9: begin
      if (INPUTA == INPUTB) begin
        expected = 0;
      end
      else begin
        expected = 0;
      end
    end
  endcase
  #1;
  if(expected == OUT) begin
    $display("%t YAY!! inputs = %h %h, opcode = %b, Zero %b",$time, INPUTA,INPUTB,op, Zero);
  end else begin
    $display("%t FAIL! inputs = %h %h, opcode = %b, zero %b",$time, INPUTA,INPUTB,op, Zero);
  end
endtask

initial begin
  $dumpfile("alu.vcd");
  $dumpvars();
  $dumplimit(104857600); // 2**20*100 = 100 MB, plenty.
end

endmodule
