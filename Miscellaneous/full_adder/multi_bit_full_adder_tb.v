//
// $ iverilog -o multi_bit_full_adder_tb.vvp multi_bit_full_adder_tb.v
// $ vvp multi_bit_full_adder_tb.vvp
//

`timescale 1ns / 1ps
`include "multi_bit_full_adder.v"

module multi_bit_full_adder_tb;
    parameter N = 8;

    reg signed [N-1 : 0] a;
    reg signed [N-1 : 0] b;
    reg carry_in;

    wire signed [N-1 : 0] sum;
    wire carry_out;

    integer i;

    multi_bit_full_adder #(.N(N)) uut (   
                                .input_a(a),
                                .input_b(b),
                                .input_carry(carry_in),
                                .output_sum(sum),
                                .output_carry(carry_out) 
                                );

    initial begin
    $dumpfile("multi_bit_full_adder_waveform.vcd");
    $dumpvars(0, multi_bit_full_adder_tb);
    
    a = 0;
    b = 0;
    carry_in = 0;

    // $monitor("a=%h, b=%h, carry_in=%h, carry_out=%h, sum=%h", a, b, carry_in, carry_out, sum);
    $monitor("a=%d, b=%d, carry_in=%b, carry_out=%b, sum=%d", a, b, carry_in, carry_out, sum);

    for ( i = 0; i < 10; i = i + 1 ) 
    begin
            #10
            a = $random;
            b = $random;
            carry_in = $random;
    end

    #10
    a = -1;
    b = 0;
    carry_in = 0;
    end
endmodule