`timescale 1ns / 1ps

module shift_register
    #(parameter N = 8)
        (
            clk,
            si,
            so
        );

    // Inputs
    input wire clk;
    input wire si;
    
    // Output
    output wire so;

    // Registers
    reg [N-1 : 0] shreg;
    //reg [0 : 0] shreg [N-1 : 0];

    integer i;
    
    initial
    begin
        for ( i = 0; i < N; i = i + 1 ) begin  
            shreg[i] = 0;
        end
    end
    
    always @(posedge clk)
    begin
        for ( i = 0; i < N - 1; i = i + 1 ) begin  
            shreg[i+1] <= shreg[i];
            shreg[0] <= si;
        end
    end

    assign so = shreg[N-1];

endmodule