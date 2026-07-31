module registerfile(
    input CLK,
    input RESET,
    input WE,
    
    //write data
    input [2:0] write_addr,
    input [7:0] write_data,

    //read data
    input [2:0] read_addr1,
    input [2:0] read_addr2,

    output [7:0] read_data1,
    output [7:0] read_data2
);

reg [7:0] REGS [0:7];
integer i;

always @(posedge CLK) begin
    if (RESET) begin
        for (i = 0; i < 8; i = i + 1)
            REGS[i] <= 8'b0;
    end
    else if (WE)
        REGS[write_addr] <= write_data;
end

assign read_data1 = REGS[read_addr1];
assign read_data2 = REGS[read_addr2];

endmodule