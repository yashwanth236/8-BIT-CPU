module controlunit(
input [15:0]instruction,

output reg[2:0] alu_op,
output reg[2:0]rd,
output reg[2:0]Rs1,
output reg[2:0]Rs2,

output reg WE,
output reg  HALT
);
always @(*)begin
    HALT = 1'b0;
    WE  = 1'b0;
    alu_op = 3'b000;
    rd=instruction[11:9];
    Rs1=instruction[8:6];
    Rs2=instruction[5:3];    
    case (instruction[15:12])
    4'b1111: begin
        HALT = 1'b1;
        WE  = 1'b0;
    end
    4'b0001:begin
        alu_op=3'b000; // ADD //translating to alu 
       
        WE=1'b1;
    end

    4'b0010:begin
        alu_op=3'b001; // SUB
       
        WE=1'b1;

    end

    4'b0011:begin
        alu_op=3'b010; // AND
       
        WE=1'b1;
    end

    4'b0100:begin
        alu_op=3'b011; // OR
       
        WE=1'b1;
    end

    4'b0101:begin
        alu_op=3'b100; // XOR
       
        WE=1'b1;
    end

    4'b0110:begin
        alu_op=3'b101; // NOT
       
        WE=1'b1;
    end
    4'b0111: begin

        alu_op = 3'b000;   // Not used for LOAD
        WE     = 1;
        HALT   = 0;
    end

        default: begin

    alu_op = 3'b000;
    rd     = 3'b000;
    Rs1    = 3'b000;
    Rs2    = 3'b000;
    WE     = 0;
    HALT   = 0;

end
    endcase

end

endmodule