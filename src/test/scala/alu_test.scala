package alu

import chisel3._
import chisel3.experimental.BundleLiterals._
import chisel3.simulator.EphemeralSimulator._
import org.scalatest.freespec.AnyFreeSpec
import org.scalatest.matchers.must.Matchers

/**
  * This is a test specification for the RV32I ALU.
  * To run this test:
  * From sbt:
  * {{{
  * testOnly rv32i.RV32I_ALUSpec
  * }}}
  */
class RV32I_ALUSpec extends AnyFreeSpec with Matchers {

  "ALU should correctly perform all operations" in {
    simulate(new ALU) { dut =>
      // Test cases for ALU operations
      val testCases = Seq(
        // (fn, a, b, expected)
        ("b0000".U, 10.U, 5.U, 15.U),   // ADD
        ("b0001".U, 10.U, 5.U, 5.U),    // SUB
        ("b0010".U, 15.U, 5.U, 5.U),    // AND
        ("b0011".U, 15.U, 1.U, 15.U),   // OR
        ("b0100".U, 15.U, 5.U, 10.U),   // XOR
        ("b0101".U, 10.U, 20.U, 1.U),   // SLT (Signed)
        ("b0110".U, 10.U, 20.U, 1.U),   // SLTU (Unsigned)
        ("b0111".U, 1.U, 2.U, 4.U),     // SLL
        ("b1000".U, 4.U, 1.U, 2.U),     // SRL
        ("b1001".U, "hFFFFFFFF".U, 1.U, "h7FFFFFFF".U) // SRA
      )

      // Reset the ALU
      dut.reset.poke(true.B)
      dut.clock.step()
      dut.reset.poke(false.B)

      // Test each case
      for ((fn, a, b, expected) <- testCases) {
        dut.io.fn.poke(fn)
        dut.io.a.poke(a)
        dut.io.b.poke(b)
        dut.clock.step()
        dut.io.result.expect(expected, s"Failed on operation $fn with inputs $a and $b")
      }
    }
  }
}
