module tb_sgpr();

	logic        clk;
	logic        rst_n;
	logic        test_en_i;
	logic [4:0]  raddr_a_i;
	logic [31:0] rdata_a_o;
	logic [4:0]  raddr_b_i;
	logic [31:0] rdata_b_o;
	logic [4:0]  waddr_a_i;
	logic [31:0] wdata_a_i;
	logic        we_a_i;

	sgpr dut
	(
	 	.clk       (clk      ),
		.rst_n     (rst_n    ),
		.test_en_i (test_en_i),
		.raddr_a_i (raddr_a_i),
		.rdata_a_o (rdata_a_o),
		.raddr_b_i (raddr_b_i),
		.rdata_b_o (rdata_b_o),
		.waddr_a_i (waddr_a_i),
		.wdata_a_i (wdata_a_i),
		.we_a_i    (we_a_i   )
	);

	always #1 clk = ~clk;

	initial begin
		$display("time\t clk\t wA\t wD\t rA\t rB");
		$monitor("%g\t %b\t %g\t %g\t %g\t %g", $time, clk, waddr_a_i, wdata_a_i, rdata_a_o, rdata_b_o);
		clk       <= 0;
		rst_n     <= 1;
		we_a_i    <= 1;
		waddr_a_i <= 5'd10;
		wdata_a_i <= 32'd100;
		#2
		raddr_a_i <= 5'd10;
		#2 
		we_a_i    <= 0;
		raddr_a_i <= 5'd10;
		#10 $finish;
	end
endmodule
