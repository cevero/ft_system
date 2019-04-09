module tb_soc_multi_sp_ram;

    logic        clk_i;
    logic        rst_ni;
    logic        fetch_en_i;

    logic [31:0] mem_flag;
    logic [31:0] mem_result;
    logic [31:0] instr_addr_1;
    logic [31:0] instr_addr_2;

    soc dut
    (
        .clk_i(clk_i),
        .rst_ni(rst_ni),
        .fetch_enable_i(fetch_en_i),
        .mem_flag(mem_flag),
        .mem_result(mem_result),
        .instr_addr_1(instr_addr_1),
        .instr_addr_2(instr_addr_2)
    );

    initial clk_i = 1;
    always #5 clk_i = ~clk_i;
      
    initial begin
        $display(" time | instr_addr_1 | instr_addr_2 | mem_flag | mem_result |\n");
        $monitor ("%4t  | %12h | %12h | %8b | %10d |", $time, instr_addr_1, instr_addr_2, mem_flag, mem_result);
         
        rst_ni = 0;
        fetch_en_i = 1;
        #5;
        rst_ni = 1;
        
        #1000 $finish; // timeout if mem_flag never rises
    end
    
    always @*
      if (mem_flag)
          #5 $finish;

endmodule
