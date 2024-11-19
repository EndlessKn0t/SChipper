// package Schipper

// import chisel3._
// import chisel3.simulator.EphemeralSimulator._
// import org.scalatest.freespec.AnyFreeSpec
// import org.scalatest.matchers.must.Matchers

// class ProgramCounterSpec extends AnyFreeSpec with Matchers {

//   "ProgramCounter should increment by 4 on each clock cycle" in {
//     simulate(new ProgramCounter(32)) { dut =>
//       // Initial state
//       dut.io.branch.poke(false.B)
//       dut.io.stall.poke(false.B)
//       dut.clock.step()
//       val initialPC = dut.io.pc_out.peek().litValue

//       // Check increments
//       for (i <- 1 to 5) {
//         dut.clock.step()
//         dut.io.pc_out.peek().litValue mustBe (initialPC + (4 * i))
//       }
//     }
//   }

//   "ProgramCounter should jump to the branch address when branch is asserted" in {
//     simulate(new ProgramCounter(32)) { dut =>
//       val branchAddress = 64.U
//       dut.io.pc_in.poke(branchAddress)
//       dut.io.branch.poke(true.B)
//       dut.io.stall.poke(false.B)
//       dut.clock.step()

//       // Verify branch address
//       dut.io.pc_out.expect(branchAddress)
//     }
//   }

//   "ProgramCounter should stall and retain its value" in {
//     simulate(new ProgramCounter(32)) { dut =>
//       val initialPC = dut.io.pc_out.peek().litValue
//       dut.io.stall.poke(true.B)
//       dut.io.branch.poke(false.B)
//       dut.clock.step(3)

//       // Verify PC remains unchanged
//       dut.io.pc_out.peek().litValue mustBe initialPC
//     }
//   }

//   "ProgramCounter should prioritize branch over stall" in {
//     simulate(new ProgramCounter(32)) { dut =>
//       val branchAddress = 128.U
//       dut.io.pc_in.poke(branchAddress)
//       dut.io.branch.poke(true.B)
//       dut.io.stall.poke(true.B) // Both branch and stall are asserted
//       dut.clock.step()

//       // Verify branch address takes precedence
//       dut.io.pc_out.expect(branchAddress)
//     }
//   }
// }
