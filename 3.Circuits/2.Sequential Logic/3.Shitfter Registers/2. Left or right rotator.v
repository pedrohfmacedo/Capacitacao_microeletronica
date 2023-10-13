module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 

    always@(posedge clk)begin
        if(load) q<=data;
        else if(ena == 2'b01)begin
            q<={q[0],q[99:1]}; // deslocamento de bit para direita 
           end
        else if(ena == 2'b10)begin
            q<={q[98:0],q[99]}; // deslocamento de bit para esquerda
       	end    	
                else if(ena == 2'b11 || ena == 2'b00)begin 
           	q<=q;
       	end    	        
    end

endmodule
