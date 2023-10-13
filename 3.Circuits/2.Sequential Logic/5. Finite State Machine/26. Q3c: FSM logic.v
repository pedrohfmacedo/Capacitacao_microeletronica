module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);
    parameter [2:0]s0 = 3'b000;
    parameter [2:0]s1 = 3'b001;
    parameter [2:0]s2 = 3'b010;
    parameter [2:0]s3 = 3'b011;
    parameter [2:0]s4 = 3'b100;
    
    logic [2:0]present_state,next_state;
    
    always@(*)begin
        case(present_state)begin
		s0:begin
            if(x) next_state = s1;
            else  next_state = s0;
        end
    	s1:begin
            if(x) next_state = s4;
            else  next_state = s1;
        end
		s2:begin
            if(x) next_state = s1;
            else  next_state = s2;
        end
		s3:begin
            if(x) next_state = s2;
            else  next_state = s1;
        end
        s4: begin 
            if(x) next_state = s4;
            else  next_state = s3;
        end
        default:next_state = s0;
        endcase
    end
    
    always@(posedge clk)begin
        present_state<=next_state;
    end
    
            assign z = (present_state == s3)
            assign Y0=({y,x}==4'b0001)|({y,x}==4'b0010)|({y,x}==4'b0101)|({y,x}==4'b0110)|({y,x}==4'b1000);

endmodule
