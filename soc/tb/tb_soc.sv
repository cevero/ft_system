module tb_soc;

	logic          clk_i;
	logic          rst_ni;
	logic          fetch_enable_i_1;
	logic          fetch_enable_i_2;
	logic [31:0]   mem_flag;
	logic [31:0]   mem_result;
	logic [31:0]   instr_addr1;
	logic [31:0]   instr_addr2;

	zeroriscy_soc soc
	(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.fetch_enable_i_1(1'b1),
		.fetch_enable_i_2(1'b1),
		.mem_flag(mem_flag),
		.mem_result(mem_result),
		.instr_addr1(inst_addr1),
		.instr_addr2(inst_addr2)
	);
	
	initial clk_i = 1;
	always #1 clk_i = ~clk_i;
      
	initial begin
		$display(" time  |   mem_result   |\n");
        	$monitor ("%g  |   %h   ", $time, mem_result);
        	rst_ni = 0;
        	fetch_enable_i_1 = 1;
        	fetch_enable_i_2 = 1;
        	#5;
        	rst_ni = 1;

        	#100 $finish; // timeout if mem_flag never rises
	end

	always @*
		if (mem_flag)
			#5 $finish;
endmodule
