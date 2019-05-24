module control
#(
    parameter ADDR_WIDTH = 5
)
(
    input  logic                  clk_i,
    input  logic                  error_i,
    output logic                  halt_o,
    output logic                  resume_o,
    output logic                  shift_o,
    output logic [ADDR_WIDTH-1:0] replay_addr_o
);

    localparam NUM_REG = 2**ADDR_WIDTH;

    localparam WAIT      = 3'b000;
    localparam HALT      = 3'b001;
    localparam WORK_SGPR = 3'b010;
    localparam WORK_SPC  = 3'b011;
    localparam DONE      = 3'b100;

    logic [2:0]            state;
    logic [ADDR_WIDTH-1:0] iterator;
    logic [ADDR_WIDTH-1:0] addr;

    initial state = 3'b000;

    //always_ff @(posedge clk_i) 
    //    if (state == WORK) begin
    //        iterator <= 0;
    //        done_reg <= 0;
    //    end else if (iterator < NUM_REG-1) begin
    //        iterator = iterator + 1;
    //        addr = iterator;
    //    end else
    //        done_reg <= 1;

    //always_ff @(posedge clk_i)
    //    if(state == WORK && done_reg) begin
    //        shift_o <= 1;
    //        done <= 1;
    //    end else
    //        shift_o <= 0;

    always_ff @(posedge clk_i)
        case (state)
            WAIT:
                if (error_i)
                    state <= HALT;
            HALT:
                state <= WORK_SGPR;
            WORK_SGPR:
                if (iterator < NUM_REG-1) begin
                    iterator = iterator + 1;
                    addr = iterator;
                end else 
                    state <= WORK_SPC;
            WORK_SPC:
                state <= DONE;
            DONE: begin
                state <= WAIT;
            end
        endcase

    always @(state)
        case (state)
            WAIT: begin
                halt_o <= 0;
                resume_o <= 0;
                iterator <= 0;
                shift_o <= 0;
            end
            HALT:
                halt_o <= 1;
            WORK_SGPR:
                halt_o <= 0;
            WORK_SPC:
                shift_o <= 1;
            DONE: begin
                shift_o <= 0;
                resume_o <= 1;
            end
        endcase
            
    assign replay_addr_o = addr;
endmodule
