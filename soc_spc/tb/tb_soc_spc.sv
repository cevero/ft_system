module tb_soc_spc;
	logic        clk_i;
	logic        rst_ni;
	logic        fetch_en_i;
	logic [31:0] mem_flag;
	logic [31:0] mem_result;
	logic [31:0] inst_addr;

	logic        signal;
	logic [31:0] spc_o;
	logic [31:0] spc_i;

	zeroriscy_soc dut
	(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.fetch_enable_i(fetch_en_i),
		.mem_flag(mem_flag),
		.mem_result(mem_result),
		.instr_addr(inst_addr),

		// spc
		.signal(signal),
		.spc_o(spc_o)
	);

	initial clk_i = 0;
	always #5 clk_i = ~clk_i;
      
	initial begin
		$display(" time | inst_addr | mem_flag | mem_result | signal | clk_i | spc_o |\n");
		$monitor (" %4t | %9h | %8h | %10d | %6b | %5b | %5h |", $time, inst_addr, mem_flag, mem_result, signal, clk_i, spc_o);
		
		rst_ni = 0;
		fetch_en_i = 0;
		#25
		fetch_en_i = 1;
		signal = 0;
		rst_ni = 1;
		#20
		signal = 1;
		#10
		signal = 0;
		#10
		signal = 1;
		
		#200 $finish; // timeout if mem_flag never rises
	end
	
	always @*
		if (mem_flag)
			#5 $finish;
endmodule
