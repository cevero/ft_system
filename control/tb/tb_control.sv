module tb_control();

    localparam ADDR_WIDTH = 5;
    localparam NUM_REG = 2**ADDR_WIDTH;

    logic                  clk;
    logic                  error_i;
    logic [ADDR_WIDTH-1:0] replay_addr_o;
    logic                  fetch_block_o;
	
	control dut
	(
		.clk(clk),
        .error_i(error_i),
        .replay_addr_o(replay_addr_o),
        .fetch_block_o(fetch_block_o)
	);
	
    initial clk = 0;
    always #5 clk = ~clk;
	initial begin
		$display("time | clk | error_i | replay_addr_o | fetch_block_o |");
		$monitor("%4t | %3b | %7b | %13d | %13b |", $time, clk, error_i, replay_addr_o, fetch_block_o);

        #10
		error_i <= 1;
        #10
        error_i <= 0;
        #320
        error_i <= 1;
        #10
        error_i <= 0;
            
		#350 $finish;
	end
endmodule
