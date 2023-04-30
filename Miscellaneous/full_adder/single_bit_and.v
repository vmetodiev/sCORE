`timescale 1ns / 1ps

module single_bit_and (
        input_a,
        input_b,
        output_c
    );

    //-------- Input ports --------
    input wire input_a;
    input wire input_b;

    //-------- Output ports --------
    output wire output_c;

    assign output_c = input_a & input_b;

endmodule