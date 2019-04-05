module tb_ft_system1;

	logic        clk_i;
	logic        rst_ni;
	logic        fetch_en_i;

	logic        signal;
	logic [31:0] result;
	logic [31:0] mem_flag;
	logic [31:0] mem_result;
	logic [31:0] inst_addr;

	zeroriscy_soc dut
	(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.fetch_enable_i(fetch_en_i),
		.signal(signal),
		.result(result),
		.mem_flag(mem_flag),
		.mem_result(mem_result),
		.instr_addr(inst_addr)
	);

	initial clk_i = 1;
	always #5 clk_i = ~clk_i;
      
	initial begin
		$display(" time  |   inst_addr  |   mem_flag    |    mem_result   |    result   |   signal   |\n");
		$monitor ("%5t  |   %h   |    %h   |    %d     |    %d     |   %b   |", $time, inst_addr, mem_flag, mem_result, result, signal);
		 
		rst_ni = 0;
		fetch_en_i = 1;
		#5;
		rst_ni = 1;
		
		#1000 $finish; // timeout if mem_flag never rises
	end
	
	//always @*
	//	if (mem_flag)
	//		#5 $finish;

endmodule
