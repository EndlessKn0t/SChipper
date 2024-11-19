// Generated by CIRCT firtool-1.62.0
// Standard header to adapt well known macros for register randomization.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

// Include register initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS

// Include rmemory initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_MEM_
    `define ENABLE_INITIAL_MEM_
  `endif // not def ENABLE_INITIAL_MEM_
`endif // not def SYNTHESIS

module RegisterFile(	// src/main/scala/reg.scala:18:7
  input         clock,	// src/main/scala/reg.scala:18:7
                reset,	// src/main/scala/reg.scala:18:7
  output [31:0] io_regPort_rs1,	// src/main/scala/reg.scala:19:14
                io_regPort_rs2,	// src/main/scala/reg.scala:19:14
  input  [4:0]  io_regPort_rs1_addr,	// src/main/scala/reg.scala:19:14
                io_regPort_rs2_addr,	// src/main/scala/reg.scala:19:14
                io_regPort_regwr_addr,	// src/main/scala/reg.scala:19:14
  input  [31:0] io_regPort_regwr_data,	// src/main/scala/reg.scala:19:14
  input         io_regPort_writeEnable,	// src/main/scala/reg.scala:19:14
                io_regPort_stall	// src/main/scala/reg.scala:19:14
);

  reg  [31:0]       regs_0;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_1;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_2;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_3;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_4;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_5;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_6;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_7;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_8;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_9;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_10;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_11;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_12;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_13;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_14;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_15;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_16;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_17;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_18;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_19;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_20;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_21;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_22;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_23;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_24;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_25;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_26;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_27;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_28;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_29;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_30;	// src/main/scala/reg.scala:24:21
  reg  [31:0]       regs_31;	// src/main/scala/reg.scala:24:21
  wire [31:0][31:0] _GEN =
    {{regs_31},
     {regs_30},
     {regs_29},
     {regs_28},
     {regs_27},
     {regs_26},
     {regs_25},
     {regs_24},
     {regs_23},
     {regs_22},
     {regs_21},
     {regs_20},
     {regs_19},
     {regs_18},
     {regs_17},
     {regs_16},
     {regs_15},
     {regs_14},
     {regs_13},
     {regs_12},
     {regs_11},
     {regs_10},
     {regs_9},
     {regs_8},
     {regs_7},
     {regs_6},
     {regs_5},
     {regs_4},
     {regs_3},
     {regs_2},
     {regs_1},
     {regs_0}};	// src/main/scala/reg.scala:24:21, :28:24
  always @(posedge clock) begin	// src/main/scala/reg.scala:18:7
    if (reset) begin	// src/main/scala/reg.scala:18:7
      regs_0 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_1 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_2 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_3 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_4 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_5 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_6 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_7 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_8 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_9 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_10 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_11 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_12 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_13 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_14 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_15 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_16 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_17 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_18 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_19 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_20 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_21 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_22 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_23 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_24 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_25 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_26 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_27 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_28 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_29 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_30 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
      regs_31 <= 32'h0;	// src/main/scala/reg.scala:24:{21,29}
    end
    else begin	// src/main/scala/reg.scala:18:7
      automatic logic _GEN_0 =
        io_regPort_writeEnable & ~io_regPort_stall & (|io_regPort_regwr_addr);	// src/main/scala/reg.scala:32:{34,52,77}
      regs_0 <= _GEN_0 & ~(|io_regPort_regwr_addr) ? io_regPort_regwr_data : 32'h0;	// src/main/scala/reg.scala:24:{21,29}, :25:11, :32:{52,77,86}, :33:33
      if (_GEN_0 & io_regPort_regwr_addr == 5'h1)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_1 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h2)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_2 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h3)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_3 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h4)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_4 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h5)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_5 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h6)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_6 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h7)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_7 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h8)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_8 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h9)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_9 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'hA)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_10 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'hB)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_11 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'hC)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_12 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'hD)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_13 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'hE)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_14 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'hF)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_15 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h10)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_16 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h11)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_17 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h12)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_18 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h13)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_19 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h14)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_20 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h15)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_21 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h16)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_22 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h17)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_23 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h18)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_24 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h19)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_25 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h1A)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_26 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h1B)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_27 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h1C)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_28 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h1D)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_29 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & io_regPort_regwr_addr == 5'h1E)	// src/main/scala/reg.scala:18:7, :24:21, :32:{52,86}, :33:33
        regs_30 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
      if (_GEN_0 & (&io_regPort_regwr_addr))	// src/main/scala/reg.scala:24:21, :32:{52,86}, :33:33
        regs_31 <= io_regPort_regwr_data;	// src/main/scala/reg.scala:24:21
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/reg.scala:18:7
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/reg.scala:18:7
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/reg.scala:18:7
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/reg.scala:18:7
      automatic logic [31:0] _RANDOM[0:31];	// src/main/scala/reg.scala:18:7
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/reg.scala:18:7
        `INIT_RANDOM_PROLOG_	// src/main/scala/reg.scala:18:7
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/reg.scala:18:7
        for (logic [5:0] i = 6'h0; i < 6'h20; i += 6'h1) begin
          _RANDOM[i[4:0]] = `RANDOM;	// src/main/scala/reg.scala:18:7
        end	// src/main/scala/reg.scala:18:7
        regs_0 = _RANDOM[5'h0];	// src/main/scala/reg.scala:18:7, :24:21
        regs_1 = _RANDOM[5'h1];	// src/main/scala/reg.scala:18:7, :24:21
        regs_2 = _RANDOM[5'h2];	// src/main/scala/reg.scala:18:7, :24:21
        regs_3 = _RANDOM[5'h3];	// src/main/scala/reg.scala:18:7, :24:21
        regs_4 = _RANDOM[5'h4];	// src/main/scala/reg.scala:18:7, :24:21
        regs_5 = _RANDOM[5'h5];	// src/main/scala/reg.scala:18:7, :24:21
        regs_6 = _RANDOM[5'h6];	// src/main/scala/reg.scala:18:7, :24:21
        regs_7 = _RANDOM[5'h7];	// src/main/scala/reg.scala:18:7, :24:21
        regs_8 = _RANDOM[5'h8];	// src/main/scala/reg.scala:18:7, :24:21
        regs_9 = _RANDOM[5'h9];	// src/main/scala/reg.scala:18:7, :24:21
        regs_10 = _RANDOM[5'hA];	// src/main/scala/reg.scala:18:7, :24:21
        regs_11 = _RANDOM[5'hB];	// src/main/scala/reg.scala:18:7, :24:21
        regs_12 = _RANDOM[5'hC];	// src/main/scala/reg.scala:18:7, :24:21
        regs_13 = _RANDOM[5'hD];	// src/main/scala/reg.scala:18:7, :24:21
        regs_14 = _RANDOM[5'hE];	// src/main/scala/reg.scala:18:7, :24:21
        regs_15 = _RANDOM[5'hF];	// src/main/scala/reg.scala:18:7, :24:21
        regs_16 = _RANDOM[5'h10];	// src/main/scala/reg.scala:18:7, :24:21
        regs_17 = _RANDOM[5'h11];	// src/main/scala/reg.scala:18:7, :24:21
        regs_18 = _RANDOM[5'h12];	// src/main/scala/reg.scala:18:7, :24:21
        regs_19 = _RANDOM[5'h13];	// src/main/scala/reg.scala:18:7, :24:21
        regs_20 = _RANDOM[5'h14];	// src/main/scala/reg.scala:18:7, :24:21
        regs_21 = _RANDOM[5'h15];	// src/main/scala/reg.scala:18:7, :24:21
        regs_22 = _RANDOM[5'h16];	// src/main/scala/reg.scala:18:7, :24:21
        regs_23 = _RANDOM[5'h17];	// src/main/scala/reg.scala:18:7, :24:21
        regs_24 = _RANDOM[5'h18];	// src/main/scala/reg.scala:18:7, :24:21
        regs_25 = _RANDOM[5'h19];	// src/main/scala/reg.scala:18:7, :24:21
        regs_26 = _RANDOM[5'h1A];	// src/main/scala/reg.scala:18:7, :24:21
        regs_27 = _RANDOM[5'h1B];	// src/main/scala/reg.scala:18:7, :24:21
        regs_28 = _RANDOM[5'h1C];	// src/main/scala/reg.scala:18:7, :24:21
        regs_29 = _RANDOM[5'h1D];	// src/main/scala/reg.scala:18:7, :24:21
        regs_30 = _RANDOM[5'h1E];	// src/main/scala/reg.scala:18:7, :24:21
        regs_31 = _RANDOM[5'h1F];	// src/main/scala/reg.scala:18:7, :24:21
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/reg.scala:18:7
      `FIRRTL_AFTER_INITIAL	// src/main/scala/reg.scala:18:7
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_regPort_rs1 = io_regPort_rs1_addr == 5'h0 ? 32'h0 : _GEN[io_regPort_rs1_addr];	// src/main/scala/reg.scala:18:7, :24:29, :28:{24,45}
  assign io_regPort_rs2 = io_regPort_rs2_addr == 5'h0 ? 32'h0 : _GEN[io_regPort_rs2_addr];	// src/main/scala/reg.scala:18:7, :24:29, :28:24, :29:{24,45}
endmodule
