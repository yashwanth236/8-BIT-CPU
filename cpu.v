module cpu(
input CLK,
input RESET
);
//counter
wire [3:0] pc;

//instruction memory
wire [15:0]instruction;

//control unit
wire[2:0] alu_op;
wire[2:0]rd;
wire[2:0]Rs1;
wire[2:0]Rs2;
wire WE;
wire  HALT;

//register
wire [7:0] read_data1;
wire [7:0] read_data2;
//alu
wire [7:0] Result;
wire Carry;

wire [7:0] immediate;
wire [7:0] write_data;

assign immediate = instruction[7:0]; 
/*15          12 11      9 8                0
+---------------+---------+-----------------+
|    Opcode     |   Rd    |   Immediate     |
+---------------+---------+-----------------+*/
assign write_data =
    (instruction[15:12] == 4'b0111) ? //multiplexer for load
        immediate :
        Result;

counter pc1(
    .PC(pc),
    .CLK(CLK),
    .RESET(RESET),
    .HALT(HALT)
);
instruction_memory im(
    .Address(pc),
    .instruction(instruction)
);
controlunit cu(
    .instruction(instruction),
    .alu_op(alu_op),
    .rd(rd),
    .Rs1(Rs1),
    .Rs2(Rs2),

    .WE(WE),
    .HALT(HALT)
);
registerfile rf(
    .CLK(CLK),
    .RESET(RESET),
    .WE(WE),
    .read_addr1(Rs1),
    .read_addr2(Rs2),
    .write_addr(rd),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);
alu al(
    .Result(Result),
    .Carry(Carry),
    .A(read_data1),
    .B(read_data2),
    .Op(alu_op)
);

endmodule
