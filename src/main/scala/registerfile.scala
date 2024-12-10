package Schipper

import chisel3._
import _root_.circt.stage.ChiselStage

/**
 * RegisterFile for a 32-bit RISC-V processor.
 *
 * Features:
 * - 32 registers, each 32 bits wide.
 * - Register x0 is hardwired to 0 (cannot be written or read as non-zero).
 * - Dual-port read and single-port write.
 * - Synchronous write with optional enable signal.
 */
class RegisterFile extends Module {
  val io = IO(new Bundle {
    val rs1Addr = Input(UInt(5.W))    // Address of the first source register
    val rs2Addr = Input(UInt(5.W))    // Address of the second source register
    val rdAddr = Input(UInt(5.W))     // Address of the destination register
    val rdData = Input(UInt(32.W))    // Data to write to the destination register
    val regWrite = Input(Bool())      // Write enable signal
    val rs1Data = Output(UInt(32.W))  // Data read from the first source register
    val rs2Data = Output(UInt(32.W))  // Data read from the second source register
  })

  // Register file: 32 registers initialized to 0
  val regFile = RegInit(VecInit(Seq.fill(32)(0.U(32.W))))

  // Read logic for rs1
  io.rs1Data := Mux(io.rs1Addr === 0.U, 0.U, regFile(io.rs1Addr))

  // Read logic for rs2
  io.rs2Data := Mux(io.rs2Addr === 0.U, 0.U, regFile(io.rs2Addr))

  // Write logic for rd
  when(io.regWrite && io.rdAddr =/= 0.U) {
    regFile(io.rdAddr) := io.rdData
  }
}

object RegisterFile extends App {
  ChiselStage.emitSystemVerilogFile(
    new RegisterFile,
    Array("--target-dir", "Systemverilog/")
  )
}
