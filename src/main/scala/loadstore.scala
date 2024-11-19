package Schipper

import chisel3._
import chisel3.util._
import _root_.circt.stage.ChiselStage

/**
 * LoadStoreUnit handles load and store operations for a processor.
 *
 * Supported Instructions:
 * - Load Word (LW): Reads a word (32 bits) from memory.
 * - Store Word (SW): Writes a word (32 bits) to memory.
 */
class LoadStoreUnit(memSize: Int = 1024) extends Module {
  val io = IO(new Bundle {
    val address = Input(UInt(32.W))      // Memory address
    val writeData = Input(UInt(32.W))   // Data to write (store)
    val memWrite = Input(Bool())        // Write enable signal
    val memRead = Input(Bool())         // Read enable signal
    val readData = Output(UInt(32.W))   // Data read from memory
    val stall = Input(Bool())           // Stall signal
  })

  // Memory array
  val memory = Mem(memSize, UInt(32.W))

  // Default output
  io.readData := 0.U

  // Load operation: Read data from memory
  when(io.memRead && !io.stall) {
    io.readData := memory(io.address >> 2) // Address is word-aligned
  }

  // Store operation: Write data to memory
  when(io.memWrite && !io.stall) {
    memory(io.address >> 2) := io.writeData // Address is word-aligned
  }
}

object LoadStoreUnit extends App {
  ChiselStage.emitSystemVerilogFile(
    new LoadStoreUnit,
    //firtoolOpts = Array("-disable-all-randomization", "-strip-debug-info"),
    Array("--target-dir", "Systemverilog/")
  )
}
