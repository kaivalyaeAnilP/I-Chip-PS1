`timescale 1ps / 1fs

module Testbench;
    wire [7:0] outbyte [0:3];
    reg [7:0] inbyte, value, threshold; 
    reg [1:0] select [0:3];
    reg clk;
    reg [7:0] image [0:98303];
    reg [7:0] memory1 [0:98303];
    reg [7:0] memory2 [0:98303];
    reg [7:0] memory3 [0:98303];
    reg [7:0] memory4 [0:98303];
    integer i; 
	
	imageProcessing img1 (
	.inbyte(inbyte),.value(value),.threshold(threshold),.select(select[0]),.clk(clk),
	.outbyte(outbyte[0])
	);
	
	imageProcessing img2 (
	.inbyte(inbyte),.value(value),.threshold(threshold),.select(select[1]),.clk(clk),
	.outbyte(outbyte[1])
	);
	
	imageProcessing img3 (
	.inbyte(inbyte),.value(value),.threshold(threshold),.select(select[2]),.clk(clk),
	.outbyte(outbyte[2])
	);
	
	imageProcessing img4 (
	.inbyte(inbyte),.value(value),.threshold(threshold),.select(select[3]),.clk(clk),
	.outbyte(outbyte[3])
	);
	
	initial $readmemh("Img1.txt", image);

	initial
	begin
	clk = 1'b0;
	select[0] = 8'b00;
	select[1] = 8'b01;
	select[2] = 8'b10;
	select[3] = 8'b11;
	value = 8'b00111100;
	threshold = 8'b10100000;
	i=0;
	end
	
	always
	#5 clk = ~clk;

    always @(posedge clk)
    begin
    inbyte = image[i];
    #5 begin
    memory1[i] = outbyte[0];
    memory2[i] = outbyte[1];
    memory3[i] = outbyte[2];
    memory4[i] = outbyte[3];
    end
    i=i+1;
    end
	
	initial
	begin
	#983045 begin
	   $writememh("BrightenedImage.hex", memory1);
	   $writememh("DarkenedImage.hex", memory2);
	   $writememh("ThresholdImage.hex", memory3);
	   $writememh("InvertedImage.hex", memory4); 
	   $finish;
	   end
    end 
    
endmodule
