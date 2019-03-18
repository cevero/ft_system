module tb_analyzer();

	logic [31:0] result1;
	logic [31:0] result2;
	logic        reset;
	logic        signal;
	logic [31:0] data; 
	
	analyzer dut
	(
		.result1 (result1),
		.result2 (result2), 
		.reset   (reset  ),
		.signal  (signal ),
		.data    (data   )
	);
	
	initial begin
		$display("time | result1 | result2 | data | signal | reset");
		$monitor("%g\t %5d\t %5d\t %5d\t %b\t %b", $time, result1, result2, data, signal, reset);

		result1 <= 32'd10;
		result2 <= 32'd10;
		#5  
		result2 <= 32'd11;
		#5 $finish;
	end
endmodule
