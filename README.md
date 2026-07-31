# 8-Bit CPU in Verilog

## Overview

This project is a custom **8-bit CPU** designed and implemented in **Verilog HDL**. It executes a simple instruction set, including arithmetic, logical, load, and halt operations. To simplify programming, a **Python-based assembler** converts assembly language into 16-bit machine code, which is loaded into the CPU's instruction memory.

This was my **first Verilog project**, and it helped me understand the complete CPU execution cycle—from instruction fetch to write-back.

---

## Features

- 8-bit Data Path
- 16-bit Instruction Format
- Program Counter (PC)
- Instruction Memory
- Control Unit
- Register File (8 Registers × 8 Bits)
- Arithmetic Logic Unit (ALU)
- Write-Back Multiplexer
- Python Assembler
- Simulation using Icarus Verilog
- Waveform Verification using GTKWave

---

## Supported Instructions

| Instruction | Description |
|-------------|-------------|
| LOAD | Load an immediate value into a register |
| ADD | Add two registers |
| SUB | Subtract two registers |
| AND | Bitwise AND |
| OR | Bitwise OR |
| XOR | Bitwise XOR |
| NOT | Bitwise NOT |
| HALT | Stop CPU execution |

---

## Project Structure

```text
8-BIT-CPU/
│
├── alu.v
├── assembler.py
├── controlunit.v
├── counter.v
├── cpu.v
├── cpu_tb.v
├── instruction_memory.v
├── registerfile.v
├── program.asm
├── program.mem
├── README.md
└── screenshots/
```

---

## CPU Architecture

```
                Program Counter
                       │
                       ▼
              Instruction Memory
                       │
                       ▼
                 Control Unit
                  │        │
                  │        ▼
                  │      ALU Control
                  │
                  ▼
             Register File
                  │
          ReadData1 ReadData2
                  │
                  ▼
                   ALU
                  │
              Result/MUX
                  │
                  ▼
             Register File
```

---

## Instruction Execution Flow

1. Program Counter generates the instruction address.
2. Instruction Memory fetches the instruction.
3. Control Unit decodes the instruction.
4. Register File provides operands.
5. ALU executes the operation.
6. Result is written back to the destination register.
7. Program Counter advances to the next instruction.

---

## Tools Used

- Verilog HDL
- Python 3
- Icarus Verilog
- GTKWave
- Visual Studio Code
- WSL (Ubuntu)

---

## Demo

🎥 **Full project walkthrough** https://drive.google.com/file/d/1fWNFUABzGFGzJjIQStrDdadOHL37Yu6P/view?usp=sharing

---

## Future Improvements

- Branch Instructions
- Jump Instructions
- Memory Read/Write Instructions
- Stack Support
- Pipeline Implementation
- Interrupt Handling

---

## Author

**Yashwanth SB**

ECE Student | Verilog | Digital Design | Computer Architecture

