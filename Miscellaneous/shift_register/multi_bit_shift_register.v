`timescale 1ns / 1ps

module multi_bit_shift_register
    #(parameter POSITIONS = 8, 
      parameter WIDTH = 8)
        (
            clk,
            si,
            so
        );

    // Inputs
    input wire clk;
    input wire [WIDTH-1 : 0] si;
    
    // Output
    output wire [WIDTH-1 : 0] so;

    // Registers
    reg [WIDTH-1 : 0] shreg [POSITIONS-1 : 0];

    integer i;
    
    initial
    begin
        for ( i = 0; i < POSITIONS; i = i + 1 ) begin  
            shreg[i] = 0;
        end
    end
    
    always @(posedge clk)
    begin
        for ( i = 0; i < POSITIONS - 1; i = i + 1 ) begin  
            shreg[i+1] <= shreg[i];
            shreg[0] <= si;
        end
    end

    assign so = shreg[POSITIONS-1];

endmodule