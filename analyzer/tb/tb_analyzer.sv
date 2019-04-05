module tb_analyzer();
	logic [31:0]  result1;
	logic [31:0]  result2;
	logic [31:0]  addr1;
	logic [31:0]  addr2;
	logic         signal;
	logic [31:0]  data;
	
	analyzer dut
	(
		.result1 (result1),
		.result2 (result2), 
		.addr1   (addr1  ), 
		.addr2   (addr2  ), 
		.signal  (signal ),
		.data    (data   )
	);
	
	initial begin
		$display("time | result1 | result2 |  addr1  |  addr2  |  data  |  signal");
		$monitor("%2d | %5d | %5d |  %5d |  %5d |  %5d |  %b", $time, result1, result2, addr1, addr2, data, signal);

		result1 <= 32'd10;
		result2 <= 32'd10;
		#5  
		result1 <= 32'd14;
		result2 <= 32'd15;
		addr1   <= 32'd13;
		addr2   <= 32'd13;
		#5  
		result1 <= 32'd1;
		result2 <= 32'd1;
		addr1   <= 32'd22;
		addr2   <= 32'd13;
		#5  
		result1 <= 32'd10;
		result2 <= 32'd10;
		#5  
		addr1   <= 32'd13;
		addr2   <= 32'd13;
		#5
		addr1   <= 32'd13;
		addr2   <= 32'd13;
		#5
		addr1   <= 32'd13;
		addr2   <= 32'd13;
		#5
		result1 <= 32'd13;
		result2 <= 32'd13;
		addr1   <= 32'd23;
		addr2   <= 32'd23;
		#5
		result2 <= 32'd11;
		#5
		result2 <= 32'd10;
		addr2   <= 32'd11;
		#5 $finish;
	end
endmodule
