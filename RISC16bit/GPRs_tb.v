//
// $ iverilog -o GPRs_tb.vvp GPRs_tb.v
// $ vvp GPRs_tb.vvp
//

`include "GPRs.v"

module GPRs_tb;
    reg clk;
    reg reg_write_en;
    reg [2:0] reg_write_dest;
    reg [15:0] reg_write_data;
    reg [2:0] reg_read_addr_1;
    wire [15:0] reg_read_data_1;
    reg [2:0] reg_read_addr_2;
    wire [15:0] reg_read_data_2;

    integer i;

    GPRs uut (
        .clk(clk),
        .reg_write_en(reg_write_en),
        .reg_write_dest(reg_write_dest),
        .reg_write_data(reg_write_data),
        .reg_read_addr_1(reg_read_addr_1),
        .reg_read_data_1(reg_read_data_1),
        .reg_read_addr_2(reg_read_addr_2),
        .reg_read_data_2(reg_read_data_2)
    );

    initial begin
        $dumpfile("GPRs_tb_waveform.vcd");
        $dumpvars(0, GPRs_tb);
        $monitor("reg_read_data_1: %d, reg_read_data_2: %d", reg_read_data_1, reg_read_data_2);

        // Initialiase clock
        clk = 1'b0;
        reg_read_addr_1 = 16'b0;
        reg_read_addr_2 = 16'b0;

        // Enable write
        reg_write_en = 1'b1;
        
        // Write to registers at index i
        for ( i = 0; i < 8; i = i + 1 ) begin
            #1
            reg_write_dest = i;
            reg_write_data = i + 100;
            
            #1
            reg_read_addr_1 = i;
            reg_read_addr_2 = i;
        end

        #2
        $finish;

    end

    always begin
        #1 clk = ~ clk;
    end

endmodule