module labL;
reg [31:0] a, b;
reg [31:0] expect;
reg [2:0] op;
wire zero;
reg zeroOracle;
wire [31:0] z;
reg ok, flag, tmp;
yAlu mine(z, zero, a, b, op);
initial
begin
    repeat (10)
    begin
        a = $random;
        b = $random;
        tmp = $random % 2;
        if (tmp == 0) b = a;

        flag = $value$plusargs("op=%d", op);
        // The oracle: compute "expect" based on "op"
        if (op[0] === 0 && op[1] === 0 && op[2] ===0)
            expect = a&b;
        else if (op[0] === 1 && op[1] === 0 && op[2] ===0)
            expect = a|b;
        else if (op[0] === 0 && op[1] === 1 && op[2] ===0)
            expect = a + b;
        else if (op[0] === 0 && op[1] === 1 && op[2] ===1)
            expect = a - b;
        else if (op == 3'b111)
            expect = (a < b) ? 1 : 0;

        zeroOracle = (expect == 0) ? 1 : 0;

        #1;
        // Compare the circuit's output with "expect"
        // and set "ok" accordingly
        // Display ok and the various signals
        if (expect === z)
            ok =1;

        $display("ok: %b, a: %b, b: %b, z: %b, expect: %b, zero: %b", ok,a,b,z,expect, zeroOracle);
    end
    $finish;
end
endmodule