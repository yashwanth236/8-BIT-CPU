module cpu_tb;

reg CLK;
reg RESET;

cpu uut(

    .CLK(CLK),
    .RESET(RESET)

);

// Clock Generation
always #5 CLK = ~CLK;

// Test
initial begin

    CLK = 0;
    RESET = 1;

    #10;

    RESET = 0;

    #200;

    $finish;

end

// Monitor
initial begin

$monitor("Time= %2t | PC= %d | Instruction= %b | Result= %2d",
$time,
uut.pc,
uut.instruction,
uut.Result);
$dumpfile("cpu.vcd");
$dumpvars(0, cpu_tb);

end

endmodule