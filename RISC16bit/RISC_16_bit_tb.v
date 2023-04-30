`timescale 1ns / 1ps

`include "RISC_16_bit.v"
`include "Parameter.v"

//
// $ iverilog -o RISC_16_bit_tb.vvp RISC_16_bit_tb.v
// $ vvp RISC_16_bit_tb.vvp
// $ gtkwave RISC_16_bit_tb_waveform.vcd
//

module RISC_16_bit_tb;

    // Inputs
    reg clk;

    // Instantiate the Unit Under Test (UUT)
    RISC_16_bit uut (
        .clk(clk)
    );

    initial 
    begin
        $dumpfile("RISC_16_bit_tb_waveform.vcd");
        $dumpvars(0, RISC_16_bit_tb);

        clk <= 0;
        `simulation_time;
        $finish;
    end

    always 
    begin
        #5 clk = ~clk;
    end

endmodule