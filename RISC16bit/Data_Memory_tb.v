//
// $ iverilog -o Data_Memory_tb.vvp Data_Memory_tb.v
// $ vvp Data_Memory_tb.vvp
//

`include "Data_Memory.v"

module Data_Memory_tb;
        reg clk;
        
        // Address input, shared b/w read and write
        reg [15 : 0] mem_access_addr;

        reg [15 : 0] mem_write_data;
        reg mem_write_en;
        reg mem_read;

        // Read port
        wire [15 : 0] mem_read_data;

        Data_Memory uut (
            .mem_access_addr(mem_access_addr),
            .mem_write_data(mem_write_data),
            .mem_write_en(mem_write_en),
            .mem_read(mem_read),
            .mem_read_data(mem_read_data)
        );

        integer i;

        initial begin
            $dumpfile("Data_Memory_tb_waveform.vcd");
            $dumpvars(0, Data_Memory_tb);
            $monitor("data: %b", mem_read_data);

            // Enable write and read
            mem_write_en = 1'b1;
            mem_read = 1'b1;

            // Read the 'mem_read_data' bus
            for ( i = 0; i < 8; i = i + 1 ) begin
                #1
                mem_access_addr = i;
            end

            #2
            $finish;
            
        end

        always begin
            #1 clk = ~ clk;
        end

endmodule
