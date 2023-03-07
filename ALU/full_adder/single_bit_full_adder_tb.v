//
// $ iverilog -o single_bit_full_adder_tb.vvp single_bit_full_adder_tb.v
// $ vvp single_bit_full_adder_tb.vvp
//

`timescale 1ns / 1ps
`include "single_bit_full_adder.v"

module single_bit_full_adder_tb;
    reg signed a;
    reg signed b;
    reg carry_in;

    wire signed sum;
    wire carry_out;

    // Instantiate the full adder
    single_bit_full_adder uut ( 
                                .input_a(a),
                                .input_b(b),
                                .input_carry(carry_in),
                                .output_sum(sum),
                                .output_carry(carry_out) 
                              );

    initial begin
        $dumpfile("single_bit_full_adder_waveform.vcd");
        $dumpvars(0, single_bit_full_adder_tb);
        
        a = 0;
        b = 0;
        carry_in = 0;

        $monitor("a=%h, b=%h, carry_in=%h, carry_out=%h, sum=%h", a, b, carry_in, carry_out, sum);

        #5
        a = 0;
        b = 0;
        carry_in = 0;

        #5
        a = 0;
        b = 0;
        carry_in = 1;

        #5
        a = 0;
        b = 1;
        carry_in = 0;

        #5
        a = 0;
        b = 1;
        carry_in = 1;

        #5
        a = 1;
        b = 0;
        carry_in = 0;

        #5
        a = 1;
        b = 0;
        carry_in = 1;

        #5
        a = 1;
        b = 1;
        carry_in = 0;

        #5
        a = 1;
        b = 1;
        carry_in = 1;

        #10;
    end

endmodule