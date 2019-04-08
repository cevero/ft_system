module tb_comp_sgpr();
    logic        we_a_i;
    logic        we_b_i;
    logic [4:0]  addr_a_i;
    logic [4:0]  addr_b_i;
    logic [31:0] data_a_i;
    logic [31:0] data_b_i;

    logic        clk;
    logic        rst_n;

    logic [4:0]  raddr_a_i;
    logic [31:0] rdata_a_o;
    
    logic [4:0]  raddr_b_i;
    logic [31:0] rdata_b_o;

    logic        signal;
    
    comp_sgpr dut
    (
        .we_a_i(we_a_i),
        .we_b_i(we_b_i),
        .addr_a_i(addr_a_i),
        .addr_b_i(addr_b_i),
        .data_a_i(data_a_i),
        .data_b_i(data_b_i),

        .clk(clk),
        .rst_n(rst_n),

        .raddr_a_i(raddr_a_i),
        .rdata_a_o(rdata_a_o),
        
        .raddr_b_i(raddr_b_i),
        .rdata_b_o(rdata_b_o),

        .signal(signal)
    );
    
    initial clk = 1;
    initial rst_n = 1;
    always #1 clk = ~clk;
    initial begin
        $display("time | clk | raddr_a_i | raddr_b_i | rdata_a_i | rdata_b_i | signal |");
        $monitor("%4t | %3b | %9d | %9d | %9d | %9d | %6d |", $time, clk, raddr_a_i, raddr_b_i, rdata_a_o, rdata_b_o, signal);

        we_a_i    <= 1'b1;
        we_b_i    <= 1'b1;
        addr_a_i  <= 5'd10;
        addr_b_i  <= 5'd10;
        data_a_i  <= 32'd100;
        data_b_i  <= 32'd100;
        raddr_a_i <= 5'd10;
        raddr_b_i <= 5'd10;
        #4  
        we_a_i    <= 1'b1;
        we_b_i    <= 1'b1;
        addr_a_i  <= 5'd11;
        addr_b_i  <= 5'd11;
        data_a_i  <= 32'd100;
        data_b_i  <= 32'd100;
        raddr_a_i <= 5'd11;
        raddr_b_i <= 5'd10;
        #4  
        we_a_i    <= 1'b1;
        we_b_i    <= 1'b1;
        addr_a_i  <= 5'd11;
        addr_b_i  <= 5'd10;
        data_a_i  <= 32'd100;
        data_b_i  <= 32'd100;
        raddr_a_i <= 5'd10;
        raddr_b_i <= 5'd10;
        #4  
        we_a_i    <= 1'b1;
        we_b_i    <= 1'b1;
        addr_a_i  <= 5'd10;
        addr_b_i  <= 5'd10;
        data_a_i  <= 32'd100;
        data_b_i  <= 32'd100;
        raddr_a_i <= 5'd10;
        raddr_b_i <= 5'd10;
        #4 $finish;
    end
endmodule
