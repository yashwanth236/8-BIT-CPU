module instruction_memory(
    input [3:0] Address,
    output [15:0]instruction

);
//Instruction Memory stores an array of instructions.
    reg [15:0] MEM[15:0];          
/*15          12 11      9 8       6 5       3 2      0
+---------------+---------+---------+---------+--------+
|    Opcode     |   Rd    |   Rs1   |   Rs2   |Unused  |
+---------------+---------+---------+---------+--------+*/
    initial begin
    $readmemb("progrem.mem", MEM);       

    end
    assign instruction=MEM[Address];  
endmodule

/* menuel instruction input
MEM[0] = 16'b0111__000100001011; // LOAD R1,#10
MEM[1] = 16'b0111_010_000010101; // LOAD R2,#20
MEM[2] = 16'b0001_011_001_010_000; // ADD R3,R1,R2
MEM[3] = 16'b1111_000_000000000; // HALT*/