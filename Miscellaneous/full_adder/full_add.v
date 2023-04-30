module full_add
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

    assign { output_carry, output_sum } = input_a + input_b + input_carry;

endmodule