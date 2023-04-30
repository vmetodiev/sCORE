//
// $ iverilog -o ALU_tb.vvp ALU_tb.v
// $ vvp ALU_tb.vvp
//

`include "ALU.v"

module ALU_tb();
        reg [15 : 0] a;
        reg [15 : 0] b;
        reg [2 : 0 ] alu_control;

        wire [15 : 0 ] result;
        wire zero;

        ALU uut (
            .a(a),
            .b(b),
            .alu_control(alu_control),
            .result(result),
            .zero(zero)
        );

        initial begin 
            $dumpfile("ALU_tb_waveform.vcd");
            $dumpvars(0, ALU_tb);
            $monitor("result: %d zero: %b", result, zero);

            // +            
            #1
            a = 0;
            b = 0;
            alu_control = 3'b000;

            #1
            a = 10;
            b = 20;
            alu_control = 3'b000;

            // -
            #1
            a = 20;
            b = 10;
            alu_control = 3'b001;

            #1
            a = 10;
            b = 20;
            alu_control = 3'b001;

            // ~
            #1
            a = 1;
            alu_control = 3'b010;

            // <<
            #1
            a = 1;
            b = 3;
            alu_control = 3'b011;

            // >>
            #1
            a = 8;
            b = 3;
            alu_control = 3'b100;

            // &
            #1
            a = 1;
            b = 1025;
            alu_control = 3'b101;

            // |
            #1
            a = 1;
            b = 1025;
            alu_control = 3'b110;

            // CMP
            #1
            a = 1024;
            b = 2048;
            alu_control = 3'b111;

            #1
            a = 1024;
            b = 512;
            alu_control = 3'b111;

            // End of the simulation
            #1
            $finish;
        end

endmodule