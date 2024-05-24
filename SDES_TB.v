// Code your design here
module SDES (input [7:0] K1,input [7:0] K2, input [7:0] plaintext,output [7:0] cipher);
  wire [3:0] ip_1_L;
  wire [3:0] ip_1_R;
  wire [7:0] out_1;
  wire [7:0] out_2;
  wire [7:0] out_3;
  wire [7:0] step_12;

	//*********************************************************
	IP IP_1 (plaintext,ip_1_L,ip_1_R);
	//*********************************************************
	FK FK1(ip_1_L,ip_1_R,K1,out_1);
 
	//*********************************************************
	SW SW1 (out_1,step_12);
 
	//*********************************************************
	FK FK2 (step_12[7:4],step_12[3:0],K2,out_2);
	IIP IIP1 (out_2,out_3);
  	assign cipher = out_3;
endmodule

module KEP (input [9:0] key,output [7:0] K1,output [7:0] K2);
	assign K1 = {key[9],key[3],key[1],key[6],key[2],key[7],key[0],key[4]};
	assign K2 = {key[2],key[7],key[4],key[5],key[0],key[8],key[1],key[9]};
endmodule

module IP (input [7:0] plaintext,output [3:0] ip_1_L,output [3:0] ip_1_R);
	assign ip_1_L = {plaintext[6],plaintext[2],plaintext[5],plaintext[7]};
	assign ip_1_R = {plaintext[4],plaintext[0],plaintext[3],plaintext[1]};
endmodule
module IIP (input [7:0] plaintext,output [7:0] ip);
	assign ip = {plaintext[4],plaintext[7],plaintext[5],plaintext[3],plaintext[1],plaintext[6],plaintext[0],plaintext[2]};
endmodule


module EP (input [3:0] Right,output [7:0] Expanded);
	assign Expanded ={Right[0],Right[3],Right[2],Right[1],Right[2],Right[1],Right[0],Right[3]};
endmodule

module S0 (input [3:0] Left,output [3:0] Box);
	wire A = Left[3];
	wire B = Left[0];
	wire C = Left[2];
	wire D = Left[1];
	assign Box[1] = ((~A)&(~B)&(C))|((~A)&(B)&(~C))|((A)&(~B)&(D))|((A)&(C)&(D))|((A)&(B)&(~D));
	assign Box[0] = ((A)&(~B)&(C))|((A)&(B)&(~C))|((~A)&(~D))|((C)&(~D));
endmodule
module S1 (input [3:0] Right,output [3:0] Box);
	wire A = Right[3];
	wire B = Right[0];
	wire C = Right[2];
	wire D = Right[1];
	assign Box[1] = ((~A)&(~B)&(C))|((~D)&(B)&(~C))|((C)&(B)&(D))|((A)&(~C)&(~D));
	assign Box[0] = ((~A)&(~B)&(D))|((~A)&(B)&(C))|((A)&(~B)&(~D))|((A)&(B)&(D));
endmodule

module P4 (input [3:0] In,output [3:0] Pout);
	assign Pout ={In[2],In[0],In[1],In[3]};
endmodule

module SW (input [7:0] In,output [7:0] Out);
	assign Out ={In[3:0],In[7:4]};
endmodule

module FK (input [3:0] ip_1_L,input [3:0] ip_1_R,input [7:0] Key,output [7:0] Fout);
	wire [7:0] ep_1;
	wire [1:0] S0_0;
	wire [1:0] S1_0;
	wire [3:0] s;
	wire [7:0] out_1;
	EP EP_1 (ip_1_R,ep_1);
	assign out_1 = ep_1 ^ Key;
	S0 S0_1 (out_1[7:4],S0_0);
	S1 S1_1 (out_1[3:0],S1_0);
	P4 P4_1 ({S0_0,S1_0},s);
	assign Fout = {s ^ ip_1_L,ip_1_R};
endmodule