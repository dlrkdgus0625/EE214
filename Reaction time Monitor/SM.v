`timescale 1ns / 1ps


module SM(
    input start,
    input react,
    input clk,
    input OneHz,
    input led,
    //input [31:0] random,
    input start_count,
    
    output [1:0] Cen,
    //output reg start_count
    //output led,
    output rst
    );
    
    localparam S0 = 2'b00; //default - set 0
    localparam S1 = 2'b01; // start - random
    localparam S2 = 2'b10; // react
    localparam S3 = 2'b11;
    
    reg [1:0] pState, nState;
    //wire OneHz;
    reg [31:0] count;
    //wire [10:0] random2;
    //reg [26:0] intCount;
//    reg [3:0] random;
//    reg [3:0] randomRead;
    
    //assign random2 = intCount[20:9];    
    
    /*
 always @ (posedge clk) begin
    intCount = intCount + 1;

if(btn0) begin
    if (count < random2) begin
        count = count + 1;
    end
    else if 
    
end
 end 
        &*/
        
    always@(pState, start, react)
    begin
        
        case(pState)
            S0 : begin
                if(start == 1'b1 && react == 1'b0)
                    nState = S1;
                else
                    nState = S0;
                 end
            S1 : 
                //if(start == 1'b1)
                    //nState = S0;
                if(start_count == 1'b1)
                    nState = S2;
                else
                    nState = S1;
                
            S2 :
                if(react == 1'b1)
                    nState = S3;
                //else if(start == 1'b1 && react == 1'b0)
                    //nState = S0;
                else
                    nState = S2;
                
            S3 :
            
             if(react == 1'b0 && start == 1'b1)
                    nState = S0;
                    else
                    nState = S3;
                
        endcase
    end 
    
    always@(posedge(clk))
    begin
            pState <= nState;
    end
    
//    always @ (posedge clk) 
//        begin
//        if(random != 10)
//        random <= random + 1;
//        else random <= random; 
//        end
    

        
//    always@(posedge(OneHz)) 
//        begin
//            if(pState == S1)
//            begin
//                if(count == random)
//                begin
//                    start_count <= 1;
//                end
//                else
//                    count <= count +1;
//            end
//            else begin
//                //randomRead <= random;
//                count <= 0;
//            end
//        end
    
    //assign randomRead = randomRead;
    assign Cen = pState;
    //assign rst = (pState == S0);
endmodule
