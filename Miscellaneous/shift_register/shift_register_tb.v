//
// $ iverilog -o shift_register_tb.vvp shift_register_tb.v
// $ vvp shift_register_tb.vvp
// $ gtkwave shift_register_tb_waveform.vcd
//

`include "shift_register.v"

module shift_register_tb();
    parameter N = 8;

    reg clk;
    reg si;
    wire so;

    shift_register #(.N(N)) uut (
        .clk(clk),
        .si(si),
        .so(so)
    );

    initial begin
        $dumpfile("shift_register_tb_waveform.vcd");
        $dumpvars(0, shift_register_tb);
        
        clk = 0;
        si = 0;

        #2
        si = 1'b1;
        $display("so: %b", so);

        #2
        si = 1'b1;
        $display("so: %b", so);

        #2
        si = 1'b1;
        $display("so: %b", so);

        #2
        si = 1'b1;
        $display("so: %b", so);

        #2
        si = 1'b1;
        $display("so: %b", so);

        #2
        si = 1'b1;
        $display("so: %b", so);

        #2
        si = 1'b1;
        $display("so: %b", so);

        #2
        si = 1'b1;
        $display("so: %b", so);

        #2
        si = 1'b1;
        $display("so: %b", so);

        #2
        si = 1'b1;
        $display("so: %b", so);

        #2
        si = 1'b1;
        $display("so: %b", so);

        #2
        si = 1'b0;
        $display("so: %b", so);

        #2
        si = 1'b1;
        $display("so: %b", so);

        #2
        si = 1'b1;
        $display("so: %b", so);

        #2
        $finish;
    end

    always begin
        #1 clk = ~clk;
    end
endmodule