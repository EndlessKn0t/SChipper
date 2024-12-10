package Schipper

import chisel3._
import _root_.circt.stage.ChiselStage

/**
 * PipelineControlUnit manages the overall pipeline stages of an RV32I processor.
 *
 * Features:
 * - Integrates core components: ProgramCounter, RegisterFile, ALU, Decoder, and LoadStoreUnit.
 * - Implements a 5-stage pipeline: Fetch, Decode, Execute, Memory, and Writeback.
 * - Handles register reads/writes, ALU operations, and memory access.
 */
class PipelineControlUnit extends Module {
  val io = IO(new Bundle {
    val instructionMem = Input(UInt(32.W))   // Instruction fetched from memory
    val dataMemIn = Input(UInt(32.W))       // Data read from memory
    val dataMemOut = Output(UInt(32.W))     // Data to be written to memory
    val dataMemAddr = Output(UInt(32.W))    // Address for memory operations
    val dataMemWrite = Output(Bool())       // Write enable for memory
    val dataMemRead = Output(Bool())        // Read enable for memory
  })

  // Pipeline Registers (for passing data between stages)
  val if_id = RegInit(0.U(32.W))    // Instruction Register (IF/ID stage)
  val id_ex = RegInit(0.U.asTypeOf(new Bundle {
    val rs1Data = UInt(32.W)
    val rs2Data = UInt(32.W)
    val imm = UInt(32.W)
    val aluCtrl = UInt(4.W)
    val regWriteAddr = UInt(5.W)
    val memWrite = Bool()
    val memRead = Bool()
    val writeBack = Bool()
  }))
  val ex_mem = RegInit(0.U.asTypeOf(new Bundle {
    val aluResult = UInt(32.W)
    val memWrite = Bool()
    val memRead = Bool()
    val writeBack = Bool()
    val regWriteAddr = UInt(5.W)
    val rs2Data = UInt(32.W)
  }))
  val mem_wb = RegInit(0.U.asTypeOf(new Bundle {
    val writeBackData = UInt(32.W)
    val regWriteAddr = UInt(5.W)
    val writeBack = Bool()
  }))

  // Core components
  val pc = Module(new ProgramCounter())          // Program Counter
  val regFile = Module(new RegisterFile())       // Register File
  val decoder = Module(new Decoder())            // Instruction Decoder
  val alu = Module(new ALU())                    // Arithmetic Logic Unit
  val loadStoreUnit = Module(new LoadStoreUnit()) // Memory Access Unit

  // Fetch Stage
  pc.io.stall := false.B
  pc.io.branch := false.B // Logic for branching to be added here
  pc.io.pc_in := 0.U // Update with jump/branch target address if needed
  if_id := io.instructionMem

  // Decode Stage
  decoder.io.instruction := if_id
  regFile.io.rs1Addr := decoder.io.rs1
  regFile.io.rs2Addr := decoder.io.rs2
  regFile.io.regWrite := mem_wb.writeBack
  regFile.io.rdAddr := mem_wb.regWriteAddr
  regFile.io.rdData := mem_wb.writeBackData
  id_ex.rs1Data := regFile.io.rs1Data
  id_ex.rs2Data := regFile.io.rs2Data
  id_ex.imm := decoder.io.imm
  id_ex.aluCtrl := decoder.io.aluCtrl
  id_ex.regWriteAddr := decoder.io.rd
  id_ex.memWrite := decoder.io.memWrite
  id_ex.memRead := decoder.io.memRead
  id_ex.writeBack := decoder.io.writeBack

  // Execute Stage
  alu.io.src1 := id_ex.rs1Data
  alu.io.src2 := Mux(id_ex.aluCtrl === "b0001".U, id_ex.imm, id_ex.rs2Data)
  alu.io.aluCtrl := id_ex.aluCtrl
  ex_mem.aluResult := alu.io.result
  ex_mem.memWrite := id_ex.memWrite
  ex_mem.memRead := id_ex.memRead
  ex_mem.writeBack := id_ex.writeBack
  ex_mem.regWriteAddr := id_ex.regWriteAddr
  ex_mem.rs2Data := id_ex.rs2Data

  // Memory Stage
  loadStoreUnit.io.address := ex_mem.aluResult
  loadStoreUnit.io.writeData := ex_mem.rs2Data
  loadStoreUnit.io.memRead := ex_mem.memRead
  loadStoreUnit.io.memWrite := ex_mem.memWrite
  io.dataMemAddr := loadStoreUnit.io.address
  io.dataMemOut := loadStoreUnit.io.writeData
  io.dataMemRead := loadStoreUnit.io.memRead
  io.dataMemWrite := loadStoreUnit.io.memWrite
  mem_wb.writeBackData := Mux(ex_mem.memRead, io.dataMemIn, ex_mem.aluResult)
  mem_wb.regWriteAddr := ex_mem.regWriteAddr
  mem_wb.writeBack := ex_mem.writeBack

  // Writeback Stage
  regFile.io.regWrite := mem_wb.writeBack
  regFile.io.rdAddr := mem_wb.regWriteAddr
  regFile.io.rdData := mem_wb.writeBackData
}

object PipelineControlUnit extends App {
  ChiselStage.emitSystemVerilogFile(
    new PipelineControlUnit,
    Array("--target-dir", "Systemverilog/")
  )
}
