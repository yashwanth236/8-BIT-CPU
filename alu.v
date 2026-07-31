module alu(

input [7:0] A,
input [7:0] B,

input [2:0] Op,

output reg [7:0] Result,
output reg Carry

);

always @(*) begin

Carry=0;

case(Op)

3'b000:
{Carry,Result}=A+B;

3'b001:
{Carry,Result}=A-B;

3'b010:
Result=A&B;

3'b011:
Result=A|B;

3'b100:
Result=A^B;

3'b101:
Result=~A;

default:
Result=8'b00000000;

endcase

end

endmodule