`timescale 1ns / 1ps

`include "single_bit_or.v"
`include "single_bit_xor.v"
`include "single_bit_and.v"

module single_bit_full_adder (
            input_a,
            input_b,
            input_carry,
            output_sum,
            output_carry 
        );

    //-------- Input ports --------
    input wire input_a;
    input wire input_b;
    input wire input_carry;
    
    //-------- Output ports --------
    output wire output_sum;
    output wire output_carry;

    //-------- Module interconnection --------
    wire xor1_to_xor2;
    wire xor1_to_and2;
    wire and1_to_or;
    wire and2_to_or;

    //-------- Modules instantiations --------
    single_bit_xor xor1 ( .input_a(input_a), 
                          .input_b(input_b),
                          .output_c(xor1_to_xor2) );
                        
    single_bit_xor xor2 ( .input_a(xor1_to_xor2),
                          .input_b(input_carry),
                          .output_c(output_sum) );

    single_bit_and and1 ( .input_a(input_a),
                          .input_b(input_b),
                          .output_c(and1_to_or) );

    single_bit_and and2 ( .input_a(input_carry), 
                          .input_b(xor1_to_xor2),
                          .output_c(and2_to_or) );

    single_bit_or or1   ( .input_a(and2_to_or),
                          .input_b(and1_to_or),
                          .output_c(output_carry) );

endmodule