module tb_comparator();

	logic        w_en1;
	logic        w_en2;
	logic        error;
	logic [4:0]  w_addr1;
	logic [4:0]  w_addr2;
	logic [31:0] w_data1;
	logic [31:0] w_data2;
	logic [31:0] data;  
	
	comparator dut
	(
		.w_en1   ( w_en1   ),
		.w_en2   ( w_en2   ),
		.w_addr1 ( w_addr1 ),
		.w_addr2 ( w_addr2 ),
		.w_data1 ( w_data1 ),
		.w_data2 ( w_data2 ),
		.error   ( error   ),
		.data    ( data    )
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
