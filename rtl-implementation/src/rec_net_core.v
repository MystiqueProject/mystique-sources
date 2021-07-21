//`include "mult_bin_tree.v" 
module rec_net_core_top(
    clk,
    rst,
    stat_bit,
    input_vec,
    sum_out
);

localparam NUM_MULT = 256;
localparam NUM_CORES = 4;
localparam WORD_SIZE = 8;

input clk;
input rst;
input stat_bit;

input [NUM_CORES * NUM_MULT * WORD_SIZE - 1: 0] input_vec;
output [2* NUM_CORES * WORD_SIZE - 1: 0] sum_out;

rec_net_core #(
    .NUM_MULT(NUM_MULT),
    .NUM_CORES(NUM_CORES),
    .WORD_SIZE(WORD_SIZE)
) core_inst(
    .clk(clk),
    .rst(rst),
    .stat_bit(stat_bit),
    .input_vec(input_vec),
    .sum_out(sum_out)
);

endmodule


module rec_net_core 
#(
    parameter NUM_MULT = 256,
    parameter NUM_CORES = 2,
    parameter WORD_SIZE = 8

)( 
    clk,
    rst,
    stat_bit,
    input_vec,

    sum_out
);

input clk;
input rst;
input stat_bit;

input [NUM_CORES * NUM_MULT * WORD_SIZE - 1: 0] input_vec;
output [2* NUM_CORES * WORD_SIZE - 1: 0] sum_out;

reg [NUM_MULT * WORD_SIZE - 1: 0] stat_vec_reg;
reg [NUM_CORES * NUM_MULT * WORD_SIZE - 1: 0] op2_vec_reg;

wire [NUM_MULT * WORD_SIZE - 1: 0] stat_vec_wire;
wire [NUM_CORES * NUM_MULT * WORD_SIZE - 1: 0] op2_vec_wire;

wire [8191:0] tie_low;
assign tie_low = 8192'b0;

assign stat_vec_wire = (stat_bit == 1'b1) ? input_vec[WORD_SIZE * NUM_MULT - 1: 0] : stat_vec_reg;
assign op2_vec_wire  = (stat_bit == 1'b0) ? input_vec : op2_vec_reg; 

//Register updates
always @(posedge clk, posedge rst)
begin 
    if(rst == 1'b1)
    begin 
        stat_vec_reg = tie_low [NUM_MULT * WORD_SIZE - 1: 0];
        op2_vec_reg  = tie_low [NUM_CORES * NUM_MULT * WORD_SIZE - 1: 0];
    end
    else
    begin
        stat_vec_reg = stat_vec_wire; 
        op2_vec_reg = op2_vec_wire; 
    end
end

//Instantiate the cores
genvar cidx;
generate
    for (cidx = 0; cidx < NUM_CORES; cidx = cidx +1)
    begin
        localparam VEC_IN_BUS_SIZE = NUM_MULT * WORD_SIZE;
        mult_bin_tree #(
            .NUM_MAC(NUM_MULT),
            .WORD_SIZE(WORD_SIZE)

        ) mtree_inst(
            .clk(clk),
            .rst(rst),
            .vec_bus_in(op2_vec_reg[(cidx +1) * VEC_IN_BUS_SIZE -1  -: VEC_IN_BUS_SIZE]),
            .stat_op_bus_in(stat_vec_reg),
            .sum_out(sum_out[(cidx + 1) * 2 * WORD_SIZE -1 -: (2*WORD_SIZE)])
        );
    end

endgenerate
endmodule
