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
bit Clk;
logic [ 7:0] INPUTA;  // data inputs
logic [ 7:0] INPUTB;
logic [ 3:0] op;      // ALU opcode, part of microcode **4 bits,
wire[ 7:0] OUT;
logic COND;

// Define a helper wire for comparison
logic [ 7:0] expected;

// Instatiate and connect the Unit Under Test
ALU uut(
  .Clk(Clk),
  .InputA(INPUTA),
  .InputB(INPUTB),
  .OP(op),
  .Out(OUT),
  .Cond(COND)
);


// The actual testbench logic
initial begin
  #1 Clk = '1;
  #1 Clk = '0;
  
  INPUTA = 1;
  INPUTB = 1;
  op= 'b0000; // ADD
  test_alu_func; // void function call

  #1 Clk = '1;
  check_expected;
  #1 Clk = '0;

  INPUTA = 4;
  INPUTB = 1;
  op= 'b0001; // SUB
  test_alu_func; // void function call

  #1 Clk = '1;
  check_expected;
  #1 Clk = '0;

  INPUTA = 'b11110000;
  INPUTB = 'b11001100;
  op = 'b0010; // AND
  test_alu_func;

  #1 Clk = '1;
  check_expected;
  #1 Clk = '0;

  INPUTA = 'b11110000;
  INPUTB = 'b11001100;
  op = 'b0011; // OR
  test_alu_func;

  #1 Clk = '1;
  check_expected;
  #1 Clk = '0;

  INPUTA = 'b11110000;
  INPUTB = 'b11001100;
  op = 'b0100; // XOR
  test_alu_func;

  #1 Clk = '1;
  check_expected;
  #1 Clk = '0;

  INPUTA = 'b11110000;
  INPUTB = 4; // random value in R0
  op = 'b0101; // NOT
  test_alu_func;

  #1 Clk = '1;
  check_expected;
  #1 Clk = '0;

  INPUTA = 'b10011001;
  INPUTB = 9;
  op = 'b0110; // LSH
  test_alu_func;

  #1 Clk = '1;
  check_expected;
  #1 Clk = '0;

  INPUTA = 'b10011001;
  INPUTB = 9;
  op = 'b0111; // RSH
  test_alu_func;

  #1 Clk = '1;
  check_expected;
  #1 Clk = '0;

  INPUTA = 3;
  INPUTB = 5;
  op = 'b1000; // SLT
  test_alu_func;

  #1 Clk = '1;
  check_expected;
  #1 Clk = '0;

  INPUTA = 7;
  INPUTB = 7;
  op = 'b1001; // SEQ
  test_alu_func;

  #1 Clk = '1;
  check_expected;
  #1 Clk = '0;

  INPUTA = 7;
  INPUTB = 7;
  op = 'b0000; // ADD (conditional flag sanity check)
  test_alu_func;

  #1 Clk = '1;
  check_expected;
  #1 Clk = '0;

  INPUTA = 5;
  INPUTB = 3;
  op = 'b1000; // SLT
  test_alu_func;

  #1 Clk = '1;
  check_expected;
  #1 Clk = '0;

  INPUTA = 3;
  INPUTB = 5;
  op = 'b1000; // SLT
  test_alu_func;

  #1 Clk = '1;
  check_expected;
  #1 Clk = '0;

  INPUTA = 3;
  INPUTB = 5;
  op = 'b1001; // SEQ
  test_alu_func;

  #1 Clk = '1;
  check_expected;
  #1 Clk = '0;

  INPUTA = 3;
  INPUTB = 5;
  op = 'b0001; // SEQ
  test_alu_func;

  #1 Clk = '1;
  check_expected;
  #1 Clk = '0;
end

task test_alu_func;
  case (op)
    0: expected = INPUTA + INPUTB;      // ADD
    1: expected = INPUTA - INPUTB;      // SUB
    2: expected = INPUTA & INPUTB;      // AND
    3: expected = INPUTA | INPUTB;      // OR
    4: expected = INPUTA ^ INPUTB;      // XOR
    5: expected = ~INPUTA;              // NOT
    6: expected = INPUTA << INPUTB;     // LSL
    7: expected = INPUTA >> INPUTB;     // LSR
    8: begin                            // SLT
      if (INPUTA < INPUTB) begin
        expected = 8'b1;
      end
      else begin
        expected = 8'b0;
      end
    end
    9: begin                            // SEQ
      if (INPUTA == INPUTB) begin
        expected = 8'b1;
      end
      else begin
        expected = 8'b0;
      end
    end
  endcase
  
endtask

task check_expected;
  if(expected == OUT) begin
    $display("%t YAY!! inputs = %h %h, output = %h, opcode = %b, cond %b",$time, INPUTA,INPUTB, OUT, op, COND);
  end else begin
    $display("%t FAIL! inputs = %h %h, output = %h, opcode = %b, cond %b",$time, INPUTA,INPUTB, OUT, op, COND);
  end
endtask

initial begin
  $dumpfile("alu.vcd");
  $dumpvars();
  $dumplimit(104857600); // 2**20*100 = 100 MB, plenty.
end

endmodule
