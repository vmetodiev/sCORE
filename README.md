# sCORE

## Inspiration
Rewriting the "Verilog Code for 16-bit RISC Processor" tutorial on fpga4student.com in Icarus Verilog.
https://www.fpga4student.com/2017/04/verilog-code-for-16-bit-risc-processor.html

## Added
Additional test benches for some of the basic modules.

## Run with Icarus Verilog and GTKwave
  $ cd RISC16bit  
  $ iverilog -o RISC_16_bit_tb.vvp RISC_16_bit_tb.v  
  $ vvp RISC_16_bit_tb.vvp  
  $ gtkwave RISC_16_bit_tb_waveform.vcd  
