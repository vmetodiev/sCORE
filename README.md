# sCORE

## What's inside

### RISC16bit
Rewriting the "Verilog Code for 16-bit RISC Processor" tutorial on fpga4student.com in Icarus Verilog.
https://www.fpga4student.com/2017/04/verilog-code-for-16-bit-risc-processor.html

#### Run with Icarus Verilog and GTKwave
  $ cd RISC16bit  
  $ iverilog -o RISC_16_bit_tb.vvp RISC_16_bit_tb.v  
  $ vvp RISC_16_bit_tb.vvp  
  $ gtkwave RISC_16_bit_tb_waveform.vcd  


### RV32I
RV32I core in TL-Verilog from the "Building a RISC-V CPU Core (LFD111x)" course by Linux Foundation
https://training.linuxfoundation.org/training/building-a-riscv-cpu-core-lfd111x/

## Added
Additional test benches for some of the basic modules.
