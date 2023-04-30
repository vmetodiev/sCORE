//
// $ iverilog -o Instruction_Memory_tb.vvp Instruction_Memory_tb.v
// $ vvp Instruction_Memory_tb.vvp
//

`include "Instruction_Memory.v"

module Instruction_Memory_tb;
    reg [15 : 0] program_counter;
    wire [15 : 0] instruction_from_file;
    
    integer i;
    
    Instruction_Memory uut
                        ( 
                            .pc(program_counter),
                            .instruction(instruction_from_file)
                        );
    
    initial begin
        $dumpfile("Instruction_Memory_tb_waveform.vcd");
        $dumpvars(0, Instruction_Memory_tb);
        
        $monitor("instruction: %b", instruction_from_file);
        program_counter = 0;

        for ( i = 0; i < 15*2; i = i + 1 ) begin
            #1
            program_counter = i;
        end

    end

endmodule

