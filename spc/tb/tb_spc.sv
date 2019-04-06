module tb_spc;
	logic        clk;
	logic        rst_n;
	logic        signal;
	logic [31:0] spc_i;
	logic [31:0] spc_o;
	
	spc dut
	(
		.clk(clk),
		.rst_n(rst_n),
		.signal(signal),
		.spc_i(spc_i),
		.spc_o(spc_o)
	);
	
	always #1 clk=~clk;
	initial begin
		$display("time | clk | rst_n | signal | spc_i | spc_o |");
		$monitor("%4d | %3b | %5b | %6b | %5d | %5d |", $time, clk, rst_n, signal, spc_i, spc_o);

		clk     = 1;
		rst_n   = 0; 
		signal <= 0;
		spc_i  <= 32'd10;
		#6  
		rst_n   = 1; 
		signal <= 0;
		spc_i  <= 32'd11;
		#5  
		rst_n   = 1; 
		signal <= 1;
		spc_i  <= 32'd11;
		#5 $finish;
	end
endmodule
