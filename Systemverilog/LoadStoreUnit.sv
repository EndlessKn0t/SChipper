// Generated by CIRCT firtool-1.62.0
// Standard header to adapt well known macros for register randomization.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
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

// VCS coverage exclude_file
module memory_1024x32(	// src/main/scala/loadstore.scala:25:19
  input  [9:0]  R0_addr,
  input         R0_en,
                R0_clk,
  output [31:0] R0_data,
  input  [9:0]  W0_addr,
  input         W0_en,
                W0_clk,
  input  [31:0] W0_data
);

  reg [31:0] Memory[0:1023];	// src/main/scala/loadstore.scala:25:19
  always @(posedge W0_clk) begin	// src/main/scala/loadstore.scala:25:19
    if (W0_en & 1'h1)	// src/main/scala/loadstore.scala:25:19
      Memory[W0_addr] <= W0_data;	// src/main/scala/loadstore.scala:25:19
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_MEM_	// src/main/scala/loadstore.scala:25:19
    reg [31:0] _RANDOM_MEM;	// src/main/scala/loadstore.scala:25:19
    initial begin	// src/main/scala/loadstore.scala:25:19
      `INIT_RANDOM_PROLOG_	// src/main/scala/loadstore.scala:25:19
      `ifdef RANDOMIZE_MEM_INIT	// src/main/scala/loadstore.scala:25:19
        for (logic [10:0] i = 11'h0; i < 11'h400; i += 11'h1) begin
          _RANDOM_MEM = `RANDOM;	// src/main/scala/loadstore.scala:25:19
          Memory[i[9:0]] = _RANDOM_MEM;	// src/main/scala/loadstore.scala:25:19
        end	// src/main/scala/loadstore.scala:25:19
      `endif // RANDOMIZE_MEM_INIT
    end // initial
  `endif // ENABLE_INITIAL_MEM_
  assign R0_data = R0_en ? Memory[R0_addr] : 32'bx;	// src/main/scala/loadstore.scala:25:19
endmodule

module LoadStoreUnit(	// src/main/scala/loadstore.scala:14:7
  input         clock,	// src/main/scala/loadstore.scala:14:7
                reset,	// src/main/scala/loadstore.scala:14:7
  input  [31:0] io_address,	// src/main/scala/loadstore.scala:15:14
                io_writeData,	// src/main/scala/loadstore.scala:15:14
  input         io_memWrite,	// src/main/scala/loadstore.scala:15:14
                io_memRead,	// src/main/scala/loadstore.scala:15:14
  output [31:0] io_readData,	// src/main/scala/loadstore.scala:15:14
  input         io_stall	// src/main/scala/loadstore.scala:15:14
);

  wire [31:0] _memory_ext_R0_data;	// src/main/scala/loadstore.scala:25:19
  wire        _GEN = io_memRead & ~io_stall;	// src/main/scala/loadstore.scala:31:{19,22}
  memory_1024x32 memory_ext (	// src/main/scala/loadstore.scala:25:19
    .R0_addr (io_address[11:2]),	// src/main/scala/loadstore.scala:32:{26,38}
    .R0_en   (_GEN),	// src/main/scala/loadstore.scala:31:19
    .R0_clk  (clock),
    .R0_data (_memory_ext_R0_data),
    .W0_addr (io_address[11:2]),	// src/main/scala/loadstore.scala:37:{11,23}
    .W0_en   (io_memWrite & ~io_stall),	// src/main/scala/loadstore.scala:31:22, :36:20
    .W0_clk  (clock),
    .W0_data (io_writeData)
  );
  assign io_readData = _GEN ? _memory_ext_R0_data : 32'h0;	// src/main/scala/loadstore.scala:14:7, :25:19, :28:15, :31:{19,33}, :32:17
endmodule

