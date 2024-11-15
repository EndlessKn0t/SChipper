package alu
import chisel3._
import chisel3.util._

class ALU extends Module {
  val io = IO(new Bundle {
    val fn = Input(UInt(4.W))         // Function selector (opcode/alu control)
    val a = Input(UInt(32.W))         // Operand A
    val b = Input(UInt(32.W))         // Operand B
    val result = Output(UInt(32.W))   // ALU result
  })

  // Shorter variable names for clarity
  val fn = io.fn
  val a = io.a
  val b = io.b

  // Wire for the ALU result with a default value
  val result = Wire(UInt(32.W))
  result := 0.U

  // ALU operation selection
  switch(fn) {
    // Arithmetic operations
    is("b0000".U) { result := a + b }                // ADD
    is("b0001".U) { result := a - b }                // SUB
    // Logical operations
    is("b0010".U) { result := a & b }                // AND
    is("b0011".U) { result := a | b }                // OR
    is("b0100".U) { result := a ^ b }                // XOR
    // Comparison operations
    is("b0101".U) { result := (a.asSInt < b.asSInt).asUInt } // SLT (Signed Less Than)
    is("b0110".U) { result := (a < b).asUInt }              // SLTU (Unsigned Less Than)
    // Shift operations
    is("b0111".U) { result := a << b(4, 0) }        // SLL (Shift Left Logical)
    is("b1000".U) { result := a >> b(4, 0) }        // SRL (Shift Right Logical)
    is("b1001".U) { result := (a.asSInt >> b(4, 0).asUInt).asUInt } // SRA (Shift Right Arithmetic)
  }

  // Output the result
  io.result := result
}
