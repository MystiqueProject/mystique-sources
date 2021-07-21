//`include "smart_systolic_arr_outer_sheath.v"

module smart_systolic_array
#(
    parameter WORD_SIZE = 16,
    parameter NUM_HOR_CELLS = 8,
    parameter NUM_VER_CELLS = 8,
    parameter CELL_HEIGHT = 4,
    parameter CELL_WIDTH  = 4
)(
    clk,
    rst,

    ctl_stat_bit_in,
    ctl_dummy_fsm_op2_select_in,
    ctl_dummy_fsm_out_select_in,

    // Buses: 1 bit per cell
    capture_smart_top_select_bus_in,
    capture_smart_left_select_bus_in,
    latch_smart_bottom_select_bus_in,
    latch_smart_right_select_bus_in,

    top_in_bus,
    left_in_bus,
    bottom_out_bus,

    // SMART bus outs are not needed
    hor_smart_bus_in,
    ver_smart_bus_in,
    ver_smart_bus_out

);

localparam NUM_VER_MAC = NUM_VER_CELLS * CELL_HEIGHT;
localparam NUM_HOR_MAC = NUM_HOR_CELLS * CELL_WIDTH;
localparam HOR_BUS_PITCH = CELL_WIDTH * WORD_SIZE;
localparam VER_BUS_PITCH = CELL_HEIGHT * WORD_SIZE;

input clk;
input rst;

input ctl_stat_bit_in; 
input ctl_dummy_fsm_op2_select_in;
input ctl_dummy_fsm_out_select_in;

input [NUM_HOR_CELLS * NUM_VER_CELLS - 1 : 0] capture_smart_top_select_bus_in;
input [NUM_HOR_CELLS * NUM_VER_CELLS - 1 : 0] capture_smart_left_select_bus_in;
input [NUM_HOR_CELLS * NUM_VER_CELLS - 1 : 0] latch_smart_bottom_select_bus_in;
input [NUM_HOR_CELLS * NUM_VER_CELLS - 1 : 0] latch_smart_right_select_bus_in;

input [NUM_HOR_MAC * WORD_SIZE - 1: 0] top_in_bus;
input [NUM_VER_MAC * WORD_SIZE - 1: 0] left_in_bus;
output [NUM_HOR_MAC * WORD_SIZE - 1: 0] bottom_out_bus;
//output [NUM_VER_MAC * WORD_SIZE - 1: 0] right_out_bus;    // Not needed

// Number of bypass paths is allocated as follows
// 1. For every cell columns num vertical bypass paths = NUM_VER_CELLS
// 2. For every cell rows vertical bypass paths        = NUM_HOR_CELLS
// Allocation of bypass paths to cells are determined by their IDs
// Therefore every cell gets its unique bypass path
// This preserves long wire lengths
//
input  [NUM_HOR_CELLS * NUM_VER_CELLS * CELL_HEIGHT * WORD_SIZE - 1: 0] hor_smart_bus_in;
input  [NUM_HOR_CELLS * NUM_VER_CELLS * CELL_WIDTH  * WORD_SIZE - 1: 0] ver_smart_bus_in;
output [NUM_HOR_CELLS * NUM_VER_CELLS * CELL_WIDTH  * WORD_SIZE - 1: 0] ver_smart_bus_out;


wire [NUM_VER_MAC * NUM_HOR_MAC * WORD_SIZE -1 :0] cell_bot_out_bus;
wire [NUM_VER_MAC * NUM_HOR_MAC * WORD_SIZE -1 :0] cell_right_out_bus;
wire [NUM_VER_MAC * NUM_HOR_MAC * WORD_SIZE -1 :0] cell_smart_bot_out_bus;
wire [NUM_VER_MAC * NUM_HOR_MAC * WORD_SIZE -1 :0] cell_smart_right_out_bus;

// Layout the cells now
genvar vcell, hcell;
generate
for (hcell = 0; hcell < NUM_HOR_CELLS; hcell = hcell + 1)
begin : HOR_CELLS
    for (vcell = 0; vcell < NUM_VER_CELLS; vcell = vcell + 1)
    begin : VER_CELLS
           
        localparam SEL_BIT_IDX = vcell * NUM_HOR_CELLS + hcell;
        localparam HOR_BUS_START_IDX = (vcell * NUM_HOR_CELLS + hcell + 1) * HOR_BUS_PITCH;
        localparam VER_BUS_START_IDX = (vcell * NUM_HOR_CELLS + hcell + 1) * VER_BUS_PITCH;
        
        //IF statements here
        if ((hcell ==0) && (vcell == 0))
        begin:LEFT_TOP_CORNER_CELL

            smart_systolic_outer_sheath #(
                .WORD_SIZE(WORD_SIZE),
                .CELL_HEIGHT(CELL_HEIGHT),
                .CELL_WIDTH(CELL_WIDTH)

            ) top_left_cell (
                .clk(clk),
                .rst(rst),

                .ctl_stat_bit_in(ctl_stat_bit_in), 
                .ctl_dummy_fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                .ctl_dummy_fsm_out_select_in(ctl_dummy_fsm_out_select_in),

                .capture_smart_top_select_in(capture_smart_top_select_bus_in[SEL_BIT_IDX]),
                .capture_smart_left_select_in(capture_smart_left_select_bus_in[SEL_BIT_IDX]),
                .latch_smart_bottom_select_in(latch_smart_bottom_select_bus_in[SEL_BIT_IDX]),
                .latch_smart_right_select_in(latch_smart_right_select_bus_in[SEL_BIT_IDX]),

                .top_in_bus(top_in_bus[(hcell + 1) * HOR_BUS_PITCH - 1 -: HOR_BUS_PITCH]),
                .left_in_bus(left_in_bus[(vcell + 1) * VER_BUS_PITCH - 1 -: VER_BUS_PITCH]),
                .bottom_out_bus(cell_bot_out_bus[HOR_BUS_START_IDX -1 -: HOR_BUS_PITCH]),
                .right_out_bus(cell_right_out_bus[VER_BUS_START_IDX -1 -: VER_BUS_PITCH]), 

                // VER SMART BUS: Moves from top to bottom --> Has HOR pitch
                // HOR SMART BUS: Moved from left to right --> Has VER pitch
                .ver_smart_bus_in(ver_smart_bus_in[HOR_BUS_START_IDX - 1 -: HOR_BUS_PITCH]),
                .ver_smart_bus_out(cell_smart_bot_out_bus[HOR_BUS_START_IDX - 1 -: HOR_BUS_PITCH]),
                .hor_smart_bus_in(hor_smart_bus_in[VER_BUS_START_IDX - 1 -: VER_BUS_PITCH]),
                .hor_smart_bus_out(cell_smart_right_out_bus[VER_BUS_START_IDX - 1 -: VER_BUS_PITCH])

            );
        end

        //Top row
        else if (vcell == 0)
        begin:TOP_ROW_CELLS
        
             localparam LEFT_PEER_BUS_START_IDX = (vcell * NUM_HOR_CELLS + hcell) * VER_BUS_PITCH;

             smart_systolic_outer_sheath #(
                .WORD_SIZE(WORD_SIZE),
                .CELL_HEIGHT(CELL_HEIGHT),
                .CELL_WIDTH(CELL_WIDTH)

            ) top_row_cell (
                .clk(clk),
                .rst(rst),

                .ctl_stat_bit_in(ctl_stat_bit_in), 
                .ctl_dummy_fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                .ctl_dummy_fsm_out_select_in(ctl_dummy_fsm_out_select_in),

                .capture_smart_top_select_in(capture_smart_top_select_bus_in[SEL_BIT_IDX]),
                .capture_smart_left_select_in(capture_smart_left_select_bus_in[SEL_BIT_IDX]),
                .latch_smart_bottom_select_in(latch_smart_bottom_select_bus_in[SEL_BIT_IDX]),
                .latch_smart_right_select_in(latch_smart_right_select_bus_in[SEL_BIT_IDX]),

                .top_in_bus(top_in_bus[(hcell + 1) * HOR_BUS_PITCH - 1 -: HOR_BUS_PITCH]),
                .left_in_bus(cell_right_out_bus[LEFT_PEER_BUS_START_IDX - 1 -: VER_BUS_PITCH]),
                .bottom_out_bus(cell_bot_out_bus[HOR_BUS_START_IDX -1 -: HOR_BUS_PITCH]),
                .right_out_bus(cell_right_out_bus[VER_BUS_START_IDX -1 -: VER_BUS_PITCH]), 

                // VER SMART BUS: Moves from top to bottom --> Has HOR pitch
                // HOR SMART BUS: Moved from left to right --> Has VER pitch
                .ver_smart_bus_in(ver_smart_bus_in[HOR_BUS_START_IDX - 1 -: HOR_BUS_PITCH]),
                .ver_smart_bus_out(cell_smart_bot_out_bus[HOR_BUS_START_IDX - 1 -: HOR_BUS_PITCH]),
                .hor_smart_bus_in(hor_smart_bus_in[VER_BUS_START_IDX - 1 -: VER_BUS_PITCH]),
                .hor_smart_bus_out(cell_smart_right_out_bus[VER_BUS_START_IDX - 1 -: VER_BUS_PITCH])

            );


        end

        // Left col
        else if (hcell == 0)
        begin:LEFT_COL_CELLS
        
            localparam TOP_PEER_BUS_START_IDX = ((vcell -1) * NUM_HOR_CELLS + hcell + 1) * HOR_BUS_PITCH;

            smart_systolic_outer_sheath #(
                .WORD_SIZE(WORD_SIZE),
                .CELL_HEIGHT(CELL_HEIGHT),
                .CELL_WIDTH(CELL_WIDTH)

            ) left_edge_cell (
                .clk(clk),
                .rst(rst),

                .ctl_stat_bit_in(ctl_stat_bit_in), 
                .ctl_dummy_fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                .ctl_dummy_fsm_out_select_in(ctl_dummy_fsm_out_select_in),

                .capture_smart_top_select_in(capture_smart_top_select_bus_in[SEL_BIT_IDX]),
                .capture_smart_left_select_in(capture_smart_left_select_bus_in[SEL_BIT_IDX]),
                .latch_smart_bottom_select_in(latch_smart_bottom_select_bus_in[SEL_BIT_IDX]),
                .latch_smart_right_select_in(latch_smart_right_select_bus_in[SEL_BIT_IDX]),

                .top_in_bus(cell_bot_out_bus[TOP_PEER_BUS_START_IDX - 1 -: HOR_BUS_PITCH]),
                .left_in_bus(left_in_bus[(vcell + 1) * VER_BUS_PITCH - 1 -: VER_BUS_PITCH]),
                .bottom_out_bus(cell_bot_out_bus[HOR_BUS_START_IDX -1 -: HOR_BUS_PITCH]),
                .right_out_bus(cell_right_out_bus[VER_BUS_START_IDX -1 -: VER_BUS_PITCH]), 

                // VER SMART BUS: Moves from top to bottom --> Has HOR pitch
                // HOR SMART BUS: Moved from left to right --> Has VER pitch
                .ver_smart_bus_in(ver_smart_bus_in[HOR_BUS_START_IDX - 1 -: HOR_BUS_PITCH]),
                .ver_smart_bus_out(cell_smart_bot_out_bus[HOR_BUS_START_IDX - 1 -: HOR_BUS_PITCH]),
                .hor_smart_bus_in(hor_smart_bus_in[VER_BUS_START_IDX - 1 -: VER_BUS_PITCH]),
                .hor_smart_bus_out(cell_smart_right_out_bus[VER_BUS_START_IDX - 1 -: VER_BUS_PITCH])

            );

        end
        else    
        begin
             
            localparam LEFT_PEER_BUS_START_IDX = (vcell * NUM_HOR_CELLS + hcell) * VER_BUS_PITCH;
            localparam TOP_PEER_BUS_START_IDX = ((vcell -1) * NUM_HOR_CELLS + hcell + 1) * HOR_BUS_PITCH;

             smart_systolic_outer_sheath #(
                .WORD_SIZE(WORD_SIZE),
                .CELL_HEIGHT(CELL_HEIGHT),
                .CELL_WIDTH(CELL_WIDTH)

            ) internal_cell (
                .clk(clk),
                .rst(rst),

                .ctl_stat_bit_in(ctl_stat_bit_in), 
                .ctl_dummy_fsm_op2_select_in(ctl_dummy_fsm_op2_select_in),
                .ctl_dummy_fsm_out_select_in(ctl_dummy_fsm_out_select_in),

                .capture_smart_top_select_in(capture_smart_top_select_bus_in[SEL_BIT_IDX]),
                .capture_smart_left_select_in(capture_smart_left_select_bus_in[SEL_BIT_IDX]),
                .latch_smart_bottom_select_in(latch_smart_bottom_select_bus_in[SEL_BIT_IDX]),
                .latch_smart_right_select_in(latch_smart_right_select_bus_in[SEL_BIT_IDX]),

                .top_in_bus(cell_bot_out_bus[TOP_PEER_BUS_START_IDX - 1 -: HOR_BUS_PITCH]),
                .left_in_bus(cell_right_out_bus[LEFT_PEER_BUS_START_IDX - 1 -: VER_BUS_PITCH]),
                .bottom_out_bus(cell_bot_out_bus[HOR_BUS_START_IDX -1 -: HOR_BUS_PITCH]),
                .right_out_bus(cell_right_out_bus[VER_BUS_START_IDX -1 -: VER_BUS_PITCH]), 

                .ver_smart_bus_in(ver_smart_bus_in[HOR_BUS_START_IDX - 1 -: HOR_BUS_PITCH]),
                .ver_smart_bus_out(cell_smart_bot_out_bus[HOR_BUS_START_IDX - 1 -: HOR_BUS_PITCH]),
                .hor_smart_bus_in(hor_smart_bus_in[VER_BUS_START_IDX - 1 -: VER_BUS_PITCH]),
                .hor_smart_bus_out(cell_smart_right_out_bus[VER_BUS_START_IDX - 1 -: VER_BUS_PITCH])

            );

        end
    end
end
endgenerate

// TODO: This might be over complicating the code
//       We are simply taking the top NUM_HOR_CELLS * HOR_BUS_PITCH wires
//       from cell_bot_out_bus and assigning it to bottom out bus
//Assign the bottom out wire to ensure proper indexing
generate
for (hcell = 0; hcell < NUM_HOR_CELLS; hcell = hcell + 1)
begin:BOTTOM_OUT_CONNECTION
    assign bottom_out_bus[(hcell + 1) * HOR_BUS_PITCH - 1 -: HOR_BUS_PITCH] 
        = cell_bot_out_bus[((NUM_VER_CELLS - 1) * NUM_HOR_CELLS + hcell + 1) * HOR_BUS_PITCH -1 -: HOR_BUS_PITCH];
end
endgenerate

//Assign the bottom out bypass wire to ensure proper indexing
assign ver_smart_bus_out = cell_smart_bot_out_bus;

endmodule
