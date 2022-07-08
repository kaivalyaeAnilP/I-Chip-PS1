`timescale 1ps / 1fs

module imageProcessing(
input [7:0]inbyte, [7:0]value, [7:0]threshold, [1:0]select, clk,
output reg [7:0] outbyte
);

always @(posedge clk)
	case(select)
		2'b00:  begin
				if((8'b11111111-inbyte)<value)
					outbyte <= 8'b11111111;
				else
					outbyte <= inbyte + value;			     	
		        end
		2'b01:  begin
				if(inbyte < value)  
					outbyte <= 8'b00000000;
				else   
					outbyte <= inbyte - value; 	
		        end 
		2'b10:  begin
				if(inbyte < threshold)
					outbyte <= 8'b00000000;
				else
					outbyte <= 8'b11111111;	      	
		        end 
		2'b11:  outbyte <= 8'b11111111 - inbyte;	    	
	endcase	

endmodule
