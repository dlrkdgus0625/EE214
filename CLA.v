
module P9R1(
input [3:0] A,
input [3:0] B,
input cin,
output [3:0] S,
output Cout 
    );

    wire [3:0] Carry;
    wire [3:0] G;
    wire [3:0] P;

   assign G = A & B;
    assign P = A ^ B;

    assign Carry[0] = cin;
    assign Carry[1] = G[0] | (P[0] & cin);
    //assign Carry[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);
    assign Carry[2] = (Carry[1] & P[1]) | G[1];
    //assign Carry[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0])|(P[2] & P[1] & P[0] & cin);
    assign Carry[3] = (Carry[2] & P[2]) | G[2];

    assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & cin);
    assign S = A ^ B ^ Carry;





endmodule
