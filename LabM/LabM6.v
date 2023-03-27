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

        if (memOut[6:0] == 7'h33) //R-type
            $display("%-6h %-6h %-6h %-6h %-6h %-6h",memOut[31:25], memOut[24:20], memOut[19:15], memOut[14:12], memOut[11:7], memOut[6:0]);
        else if (memOut[6:0] == 7'h6F) //UJ-type
            $display("%-6h %-6h %-6h",memOut[31:12], memOut[11:7], memOut[6:0]);
        else if (memOut[6:0] == 7'h3 || memOut[6:0] == 7'h13) //I-type
            $display("%-6h %-6h %-6h %-6h %-6h", memOut[31:20],memOut[19:15], memOut[14:12], memOut[11:7], memOut[6:0]);
        else if (memOut[6:0] == 7'h23)  // S-type 
            $display("%-6h %-6h %-6h %-6h %-6h %-6h",memOut[31:25], memOut[24:20], memOut[19:15], memOut[14:12], memOut[11:7], memOut[6:0]);
        else if (memOut[6:0] == 7'h63) // SB-type
            $display("%-6h %-6h %-6h %-6h %-6h %-6h",memOut[31:25], memOut[24:20], memOut[19:15], memOut[14:12], memOut[11:7], memOut[6:0]);
        else    
            $display("%h", memOut);
        
        address = address +4;
    end
end
endmodule
