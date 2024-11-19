package Schipper

import chisel3._
import _root_.circt.stage.ChiselStage

/**
 * ProgramCounter manages the instruction address for the processor.
 *
 * Features:
 * - Increment by 4 for sequential execution.
 * - Update with branch or jump addresses.
 * - Support for stalls.
 */
class ProgramCounter(bitWidth: Int = 32) extends Module {
  val io = IO(new Bundle {
    val pc_in = Input(UInt(bitWidth.W))  // Input for jump/branch address
    val branch = Input(Bool())           // Branch signal (use pc_in)
    val stall = Input(Bool())            // Stall signal (halt PC update)
    val pc_out = Output(UInt(bitWidth.W)) // Current program counter value
  })

  // Register to hold the current PC
  val pc = RegInit(0.U(bitWidth.W))

  // PC update logic
  when(io.stall) {
    // Stall: Retain the current PC value
    pc := pc
  }.elsewhen(io.branch) {
    // Branch/Jump: Update PC with input address
    pc := io.pc_in
  }.otherwise {
    // Default: Increment PC by 4
    pc := pc + 4.U
  }

  // Output the current PC
  io.pc_out := pc
}

object ProgramCounter extends App {
  ChiselStage.emitSystemVerilogFile(
    new ProgramCounter,
    //firtoolOpts = Array("-disable-all-randomization", "-strip-debug-info"),
    Array("--target-dir", "Systemverilog/")
  )
}
