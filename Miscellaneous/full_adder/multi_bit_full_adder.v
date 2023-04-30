`timescale 1ns / 1ps

`include "single_bit_full_adder.v"

module multi_bit_full_adder 
    #(parameter N = 8)
        (
            input_a,
            input_b,
            input_carry,
            output_sum,
            output_carry 
        );

    //-------- Input ports --------
    input wire [N-1 : 0] input_a;
    input wire [N-1 : 0] input_b;
    input wire input_carry;
    
    //-------- Output ports --------
    output wire [N-1 : 0] output_sum;
    output wire output_carry;

    //-------- Module interconnection --------
    wire [N-1 : 0] carry_in_carry_out_chain;

    //-------- Modules instantiations --------
    genvar i;
    generate
        for ( i = 0; i < N; i = i + 1 )
        begin
            if ( i == 0 )             // This is the first instance
            begin
                single_bit_full_adder umulti_bit_full_adder (
                    .input_a(input_a[0]),
                    .input_b(input_b[0]),
                    .input_carry(input_carry),
                    .output_sum(output_sum[0]),
                    .output_carry(carry_in_carry_out_chain[0]) 
                );
            end
            else if ( i == (N - 1) )  // This is the last instance
            begin
                single_bit_full_adder umulti_bit_full_adder (
                    .input_a(input_a[i]),
                    .input_b(input_b[i]),
                    .input_carry(carry_in_carry_out_chain[i-1]),
                    .output_sum(output_sum[i]),
                    .output_carry(output_carry) 
                );
            end
            else                      // This is the daisy chain b/w the first and the last
            begin
                single_bit_full_adder umulti_bit_full_adder (
                    .input_a(input_a[i]),
                    .input_b(input_b[i]),
                    .input_carry(carry_in_carry_out_chain[i-1]),
                    .output_sum(output_sum[i]),
                    .output_carry(carry_in_carry_out_chain[i]) 
                );
            end
        end
    endgenerate

endmodule