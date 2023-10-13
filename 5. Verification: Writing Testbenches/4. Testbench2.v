module top_module();
    logic clk,in,out;
    logic [2:0]s;
    q7 teste(clk,in,s,out);

    always #5 clk=~clk;
    initial begin
    	in =0; clk = 0; s = 3'h2;
        #10 s = 3'h6; 
        #10 s = 3'h2; in = 1;
        #10 s = 3'h7; in = 0;
        #10 s = 3'h0; in = 1;
        #30 in = 0;
    end
endmodule
