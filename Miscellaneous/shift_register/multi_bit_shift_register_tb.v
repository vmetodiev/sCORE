//
// $ iverilog -o multi_bit_shift_register_tb.vvp multi_bit_shift_register_tb.v
// $ vvp multi_bit_shift_register_tb.vvp
// $ gtkwave multi_bit_shift_register_tb_waveform.vcd
//

`include "multi_bit_shift_register.v"

module multi_bit_shift_register_tb();
    parameter POSITIONS = 8;
    parameter WIDTH = 8;

    reg clk;
    reg [WIDTH-1 : 0] si;
    wire [WIDTH-1 : 0] so;

    multi_bit_shift_register #(.POSITIONS(POSITIONS), .WIDTH(WIDTH)) uut (
        .clk(clk),
        .si(si),
        .so(so)
    );

    initial begin
        $dumpfile("multi_bit_shift_register_tb_waveform.vcd");
        $dumpvars(0, multi_bit_shift_register_tb);
        
        clk = 0;
        si = 0;

        #2
        si = 1;
        $display("so: %b", so);

        #2
        si = 2;
        $display("so: %b", so);

        #2
        si = 3;
        $display("so: %b", so);

        #2
        si = 4;
        $display("so: %b", so);

        #2
        si = 5;
        $display("so: %b", so);

        #2
        si = 6;
        $display("so: %b", so);

        #2
        si = 7;
        $display("so: %b", so);

        #2
        si = 8;
        $display("so: %b", so);

        #2
        si = 9;
        $display("so: %b", so);

        #2
        si = 10;
        $display("so: %b", so);

        #2
        si = 11;
        $display("so: %b", so);

        #2
        si = 12;
        $display("so: %b", so);

        #2
        si = 13;
        $display("so: %b", so);

        #2
        si = 14;
        $display("so: %b", so);

        #2
        $finish;
    end

    always begin
        #1 clk = ~clk;
    end
endmodule