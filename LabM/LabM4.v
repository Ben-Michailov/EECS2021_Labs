/* Name: Benjamin Michailov ID: 218917286*/

module labM;
wire [31:0] memOut;
reg clk, memRead, memWrite;
reg [31:0] address, memIn;
mem data(memOut, address, memIn, clk, memRead, memWrite);
initial
begin
    clk =0;
    #1;
    clk =1; memWrite= 1; memRead=0; address = 16;
    memIn = 32'h12345678;
    #1;
    clk = 0;
    #1;
    clk =1;
    address =24;
    memIn =  32'h89abcdef;
    #1;
    clk =0;
    #1;

    memWrite = 0; memRead = 1; address = 16;

    repeat (3)
    begin
        #1 $display("Address %d contains %h", address, memOut);
        address = address + 4;
    end

    $finish;
end

endmodule