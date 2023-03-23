module labL;
reg [31:0] a, b;
reg [31:0] expect;
reg [2:0] op;
wire ex;
wire [31:0] z;
reg ok, flag;
yAlu mine(z, ex, a, b, op);
initial
begin
    repeat (10)
    begin
        a = $random;
        b = $random;
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

        #1;
        // Compare the circuit's output with "expect"
        // and set "ok" accordingly
        // Display ok and the various signals
        if (expect === z)
            ok =1;

        $display("ok: %b, a: %b, b: %b, z: %b, expect: %b", ok,a,b,z,expect);
    end
    $finish;
end
endmodule