package Schipper

import chisel3._
import chisel3.simulator.EphemeralSimulator._
import org.scalatest.freespec.AnyFreeSpec
import org.scalatest.matchers.must.Matchers

class RegisterFileSpec extends AnyFreeSpec with Matchers {

  "RegisterFile should ensure x0 is always 0" in {
    simulate(new RegisterFile) { dut =>
      dut.io.regPort.rs1_addr.poke(0.U)
      dut.clock.step()
      dut.io.regPort.rs1.expect(0.U)
    }
  }

  "RegisterFile should not write to x0" in {
    simulate(new RegisterFile) { dut =>
      dut.io.regPort.writeEnable.poke(true.B)
      dut.io.regPort.regwr_addr.poke(0.U)
      dut.io.regPort.regwr_data.poke(123.U)
      dut.clock.step()

      dut.io.regPort.rs1_addr.poke(0.U)
      dut.clock.step()
      dut.io.regPort.rs1.expect(0.U)
    }
  }

  "RegisterBank should not write when writeEnable is false" in {
    simulate(new RegisterFile) { dut =>
      dut.io.regPort.rs1_addr.poke(1.U)
      dut.io.regPort.regwr_addr.poke(1.U)
      dut.io.regPort.regwr_data.poke(123.U)
      dut.io.regPort.writeEnable.poke(false.B)
      dut.clock.step()

      dut.io.regPort.rs1.expect(0.U)
    }
  }

  "RegisterBank should handle writes and reads correctly" in {
    simulate(new RegisterFile) { dut =>
      val testData = Seq(10, 20, 30, 40, 50)
      for ((data, idx) <- testData.zipWithIndex) {
        // Write data
        dut.io.regPort.writeEnable.poke(true.B)
        dut.io.regPort.regwr_addr.poke((idx + 1).U)
        dut.io.regPort.regwr_data.poke(data.U)
        dut.clock.step()

        // Read back
        dut.io.regPort.rs1_addr.poke((idx + 1).U)
        dut.clock.step()
        dut.io.regPort.rs1.expect(data.U)
      }
    }
  }

  "RegisterBank should stall writes when stall is active" in {
    simulate(new RegisterFile) { dut =>
      dut.io.regPort.writeEnable.poke(true.B)
      dut.io.regPort.regwr_addr.poke(2.U)
      dut.io.regPort.regwr_data.poke(123.U)
      dut.io.regPort.stall.poke(true.B) // Stall active
      dut.clock.step()

      // Ensure no write occurred
      dut.io.regPort.rs1_addr.poke(2.U)
      dut.clock.step()
      dut.io.regPort.rs1.expect(0.U)
    }
  }
}
