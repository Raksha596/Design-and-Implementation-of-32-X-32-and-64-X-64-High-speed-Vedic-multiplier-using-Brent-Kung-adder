`timescale 1ns / 1ps



module CLA_4bit(a,b,cin,sum,cout);

//declaring inputs and outputs
input [3:0]a,b;
input cin;
output [3:0]sum;
output cout;

wire [2:0]c;

//generation and propagation logic
wire [3:0]gen,prop;

//generate logic
assign gen[0] = a[0] & b[0]; 
assign gen[1] = a[1] & b[1]; 
assign gen[2] = a[2] & b[2]; 
assign gen[3] = a[3] & b[3];

//propagate logic
assign prop[0] = a[0] ^ b[0];
assign prop[1] = a[1] ^ b[1];
assign prop[2] = a[2] ^ b[2];
assign prop[3] = a[3] ^ b[3];


//combinational logic for carry calculation
assign c[0] = gen[0] + (prop[0] & cin); 
assign c[1] = gen[1] + (prop[1] & c[0]); 
assign c[2] = gen[2] + (prop[2] & c[1]); 
assign cout = gen[3] + (prop[3] & c[2]); 

//combinational logic for sum calculation
assign sum[0] = prop[0] ^ cin;
assign sum[1] = prop[1] ^ c[0];
assign sum[2] = prop[2] ^ c[1];
assign sum[3] = prop[3] ^ c[2];

endmodule
