module labM;
reg clk, memRead, memWrite;
reg [31:0] address, memIn;
wire [31:0] memOut;
mem data(memOut, address, memIn, clk, memRead, memWrite);
initial
begin
    address = 16'h28; memWrite = 0; memRead = 1;
    repeat (11)
    begin
        clk = 0;
        #1
        clk =1;
        #1;

        $display("memOut=%h",memOut);
        address = address +4;
    end
end
endmodule
