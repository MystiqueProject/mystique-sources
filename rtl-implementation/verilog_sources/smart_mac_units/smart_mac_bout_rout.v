`include "traditional_mac.v"

module smart_mac
#( 
    parameter WORD_SIZE = 16
)(
    clk,
    rst, 

    fsm_op2_select_in,
    fsm_out_select_in,
    stat_bit_in,

    //select_left_in_smart,
    //select_top_in_smart,

    select_right_out_smart,
    select_bottom_out_smart,

    left_in,
    top_in,
    right_out,
    bottom_out, 

    vertical_smart_bus_in,
    horizontal_smart_bus_in,
    vertical_smart_bus_out,
    horizontal_smart_bus_out
);

input clk;
input rst;

input fsm_op2_select_in;
input fsm_out_select_in;
input stat_bit_in;

//input select_left_in_smart;
//input select_top_in_smart;
input select_right_out_smart;
input select_bottom_out_smart;


input [WORD_SIZE - 1: 0] left_in;
input [WORD_SIZE - 1: 0] top_in;
output [WORD_SIZE - 1: 0] right_out;
output [WORD_SIZE - 1: 0] bottom_out;

input [WORD_SIZE - 1: 0] vertical_smart_bus_in;
input [WORD_SIZE - 1: 0] horizontal_smart_bus_in;
output [WORD_SIZE - 1: 0] vertical_smart_bus_out;
output [WORD_SIZE - 1: 0] horizontal_smart_bus_out;

wire [WORD_SIZE - 1: 0] left_in_mux_out;
wire [WORD_SIZE - 1: 0] top_in_mux_out;


//assign left_in_mux_out = (select_left_in_smart == 1'b1) ? horizontal_smart_bus_in : left_in;
//assign top_in_mux_out = (select_top_in_smart == 1'b1) ? vertical_smart_bus_in : top_in;

assign left_in_mux_out = left_in;
assign top_in_mux_out = top_in; 

assign horizontal_smart_bus_out =  (select_right_out_smart == 1'b1) ? right_out : horizontal_smart_bus_in;
assign vertical_smart_bus_out =  (select_bottom_out_smart == 1'b1) ? bottom_out : vertical_smart_bus_in;


mac #( 
    .WORD_SIZE(WORD_SIZE)
) tradtional_mac_inst(
    .clk(clk),
    .rst(rst),
    .fsm_op2_select_in(fsm_op2_select_in),
    .fsm_out_select_in(fsm_out_select_in),
    .stat_bit_in(stat_bit_in),

    .left_in(left_in_mux_out),
    .top_in(top_in_mux_out),
    .right_out(right_out),
    .bottom_out(bottom_out)
);

endmodule
