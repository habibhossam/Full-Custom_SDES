// Code your testbench here
// or browse Examples
module tb();
  reg [9:0] key;
  reg [7:0] plain;
  reg [7:0] chiper;
  reg [7:0] out_dec;
  wire [7:0] K1;
  wire [7:0] K2;
  KEP KEP1 (key,K1,K2);
  SDES Dec (K1,K2,plain,chiper);
  SDES Enc (K2,K1,chiper,out_dec);
  initial begin
    key <= 10'b1010000010;
    plain <= 8'b10010111;
    $monitor("key=%b plain=%b chiper=%b Decruption=%b",key,plain,chiper,out_dec);
	#5
    key <= 10'b1100011110;
    plain <= 8'b00101000;
    $monitor("key=%b plain=%b chiper=%b Decruption=%b",key,plain,chiper,out_dec); 
  end
endmodule