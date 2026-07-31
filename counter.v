module counter(

input CLK,
input RESET,
input HALT,
output reg [3:0] PC

);

always @(posedge CLK)
begin

    if(RESET)
        PC <= 8'd0; //start for first instruction

    else if(!HALT)
        PC <= PC + 1;

end

endmodule