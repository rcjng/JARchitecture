// Create Date:   2017.01.25
// Last Update:   2022.04.30
// Design Name:   JARchitecture LUT1
// Module Name:   LUT1

// possible lookup table for PC target
// leverage a few-bit pointer to a wider number
// Lookup table acts like a function: here Target = f(Addr);
// in general, Output = f(Input)
//
// Lots of potential applications of LUTs!!

// You might consider parameterizing this!
module LUT0(
  input        [ 3:0] Addr,
  output logic [ 9:0] Target
);

always_comb begin

  case (Addr)
    4'b0000: Target = 10'd288;  // DONE
    4'b0001: Target = 10'd2;    // LOOP
    4'b0010: Target = 10'd0;
    4'b0011: Target = 10'd0;
    4'b0100: Target = 10'd0;
    4'b0101: Target = 10'd0;
    4'b0110: Target = 10'd0;
    4'b0111: Target = 10'd0;
    4'b1000: Target = 10'd0;
    4'b1001: Target = 10'd0;
    4'b1010: Target = 10'd0;
    4'b1011: Target = 10'd0;
    4'b1100: Target = 10'd0;
    4'b1101: Target = 10'd0;
    4'b1110: Target = 10'd0;
    4'b1111: Target = 10'd0;
  endcase
end

endmodule
