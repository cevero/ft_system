module tb_ft_system();
    logic clk_i;
	
	ft_system dut
	(
	);
	
    initial clk = 0;
    always #5 clk = ~clk;
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
		#2 $finish;
	end
endmodule
