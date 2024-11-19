package Schipper

import chisel3._
import chisel3.util._
import _root_.circt.stage.ChiselStage

class RegisterFilePort(bitWidth: Int = 32) extends Bundle {
  val rs1 = Output(UInt(bitWidth.W))         // Read data from rs1
  val rs2 = Output(UInt(bitWidth.W))         // Read data from rs2
  val rs1_addr = Input(UInt(log2Ceil(32).W)) // Address for rs1
  val rs2_addr = Input(UInt(log2Ceil(32).W)) // Address for rs2
  val regwr_addr = Input(UInt(log2Ceil(32).W)) // Address for writing
  val regwr_data = Input(UInt(bitWidth.W))   // Data to write
  val writeEnable = Input(Bool())            // Write enable
  val stall = Input(Bool())                  // Stall signal: true = stall, false = run
}

class RegisterFile(numRegs: Int = 32, regWidth: Int = 32) extends Module {
  val io = IO(new Bundle {
    val regPort = new RegisterFilePort(regWidth)
  })

  // Register file with 32 registers, each `regWidth` bits wide
  val regs = RegInit(VecInit(Seq.fill(numRegs)(0.U(regWidth.W))))
  regs(0) := 0.U // x0 is always zero

  // Default outputs
  io.regPort.rs1 := Mux(io.regPort.rs1_addr === 0.U, 0.U, regs(io.regPort.rs1_addr))
  io.regPort.rs2 := Mux(io.regPort.rs2_addr === 0.U, 0.U, regs(io.regPort.rs2_addr))

  // Write logic with stall control
  when(io.regPort.writeEnable && !io.regPort.stall && io.regPort.regwr_addr =/= 0.U) {
    regs(io.regPort.regwr_addr) := io.regPort.regwr_data
  }
}

object RegisterFile extends App {
  ChiselStage.emitSystemVerilogFile(
    new RegisterFile,
    //firtoolOpts = Array("-disable-all-randomization", "-strip-debug-info"),
    Array("--target-dir", "Systemverilog/")
  )
}
