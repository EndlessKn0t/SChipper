
// package Schipper

// import chisel3._
// import chisel3.experimental.BundleLiterals._
// import chisel3.simulator.EphemeralSimulator._
// import org.scalatest.freespec.AnyFreeSpec
// import org.scalatest.matchers.must.Matchers

// /**
//   * Test Specification for the Schipper Decoder.
//   * Run using:
//   * {{{
//   * sbt testOnly Schipper.DecoderSpec
//   * }}}
//   */
// class DecoderSpec extends AnyFreeSpec with Matchers {

//   "Decoder should correctly decode Schipper instructions" in {
//     simulate(new Decoder) { dut =>
//       // Define test cases as a sequence of tuples
//       val testCases = Seq(
//         // (instruction, opcode, rd, rs1, rs2, funct3, funct7, instrType, imm)
//         ("b00000000000100001000000110110011".U, // ADD x3, x1, x2
//           "b0110011".U, 3.U, 1.U, 2.U, 0.U, 0.U, 0.U, 0.S),

//         ("b00000000000100001000000110100011".U, // BEQ x1, x2, offset
//           "b1100011".U, 0.U, 1.U, 2.U, 0.U, 0.U, 3.U, 4.S),

//         ("b00000000000100001000000110000011".U, // LW x3, offset(x1)
//           "b0000011".U, 3.U, 1.U, 0.U, 2.U, 0.U, 1.U, 1.S),

//         ("b00000000000100001000000110100011".U, // SW x1, offset(x2)
//           "b0100011".U, 0.U, 1.U, 2.U, 2.U, 0.U, 2.U, 1.S),

//         ("b00000000000100001000000111001111".U, // JAL x3, offset
//           "b1101111".U, 3.U, 0.U, 0.U, 0.U, 0.U, 5.U, 4.S)
//       )

//       // Simulation loop
//       for ((instr, expOpcode, expRd, expRs1, expRs2, expFunct3, expFunct7, expType, expImm) <- testCases) {
//         // Set input instruction
//         dut.io.instr.poke(instr)

//         // Step the simulation
//         dut.clock.step()

//         // Validate outputs
//         dut.io.opcode.expect(expOpcode, s"Opcode mismatch for instruction: $instr")
//         dut.io.rd.expect(expRd, s"Destination register mismatch for instruction: $instr")
//         dut.io.rs1.expect(expRs1, s"Source register 1 mismatch for instruction: $instr")
//         dut.io.rs2.expect(expRs2, s"Source register 2 mismatch for instruction: $instr")
//         dut.io.funct3.expect(expFunct3, s"Funct3 mismatch for instruction: $instr")
//         dut.io.funct7.expect(expFunct7, s"Funct7 mismatch for instruction: $instr")
//         dut.io.instrType.expect(expType, s"Instruction type mismatch for instruction: $instr")
//         dut.io.imm.expect(expImm, s"Immediate mismatch for instruction: $instr")
//       }
//     }
//   }
// }
