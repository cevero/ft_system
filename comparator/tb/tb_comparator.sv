module tb_comparator();
	logic        we_a_i;
	logic        we_b_i;
	logic [4:0]  addr_a_i;
	logic [4:0]  addr_b_i;
	logic [31:0] data_a_i;
	logic [31:0] data_b_i;
	logic [4:0]  addr_o;
	logic [31:0] data_o;
	logic        signal;
	
	comparator dut
	(
		.we_a_i(we_a_i),
		.we_b_i(we_b_i),
		.addr_a_i(addr_a_i),
		.addr_b_i(addr_b_i),
		.data_a_i(data_a_i),
		.data_b_i(data_b_i),
		.addr_o(addr_o),
		.data_o(data_o),
		.signal(signal)
	);
	
	initial begin
		$display("time | addr | data | signal |");
		$monitor("%4t | %4d | %4d | %6b |", $time, addr_o, data_o, signal);

		we_a_i   <= 1'b1;
		we_b_i   <= 1'b1;
		addr_a_i <= 5'd10;
		addr_b_i <= 5'd10;
		data_a_i <= 32'd100;
		data_b_i <= 32'd100;
		#2  
		we_a_i   <= 1'b1;
		we_b_i   <= 1'b0;
		addr_a_i <= 5'd10;
		addr_b_i <= 5'd10;
		data_a_i <= 32'd100;
		data_b_i <= 32'd100;
		#2  
		we_a_i   <= 1'b1;
		we_b_i   <= 1'b1;
		addr_a_i <= 5'd10;
		addr_b_i <= 5'd11;
		data_a_i <= 32'd100;
		data_b_i <= 32'd100;
		#2  
		we_a_i   <= 1'b1;
		we_b_i   <= 1'b1;
		addr_a_i <= 5'd10;
		addr_b_i <= 5'd10;
		data_a_i <= 32'd120;
		data_b_i <= 32'd100;
		#2  
		we_a_i   <= 1'b1;
		we_b_i   <= 1'b1;
		addr_a_i <= 5'd10;
		addr_b_i <= 5'd10;
		data_a_i <= 32'd120;
		data_b_i <= 32'd120;
		#2 $finish;
	end
endmodule
