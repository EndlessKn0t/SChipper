// package Schipper

// import chisel3._
// import chisel3.simulator.EphemeralSimulator._
// import org.scalatest.freespec.AnyFreeSpec
// import org.scalatest.matchers.must.Matchers

// class LoadStoreUnitSpec extends AnyFreeSpec with Matchers {
//   "LoadStoreUnit should handle load and store operations correctly" in {
//     simulate(new LoadStoreUnit(16)) { dut =>
//       val testMemory = Seq(0xDEADBEEF, 0xCAFEBABE, 0x12345678, 0x0ABCDEF0)

//       // Preload memory values
//       for ((value, index) <- testMemory.zipWithIndex) {
//         dut.io.memWrite.poke(true.B)
//         dut.io.address.poke((index * 4).U) // Word-aligned addresses
//         dut.io.writeData.poke(value.U)
//         dut.clock.step()
//       }

//       // Verify stored values by reading them back
//       for ((value, index) <- testMemory.zipWithIndex) {
//         dut.io.memWrite.poke(false.B)
//         dut.io.memRead.poke(true.B)
//         dut.io.address.poke((index * 4).U)
//         dut.clock.step()
//         dut.io.readData.expect(value.U)
//       }

//       // Test stall functionality during load
//       dut.io.memRead.poke(true.B)
//       dut.io.address.poke(0.U)
//       dut.io.stall.poke(true.B)
//       dut.clock.step()
//       dut.io.readData.expect(0.U) // No read occurs when stalled

//       // Test stall functionality during store
//       dut.io.memWrite.poke(true.B)
//       dut.io.writeData.poke(0xFACEFEED.U)
//       dut.io.stall.poke(true.B)
//       dut.clock.step()

//       // Verify no write occurred
//       dut.io.stall.poke(false.B)
//       dut.io.memRead.poke(true.B)
//       dut.io.address.poke(0.U)
//       dut.clock.step()
//       dut.io.readData.expect(testMemory.head.U) // Original value remains unchanged
//     }
//   }
// }
