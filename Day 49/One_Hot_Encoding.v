module Controller(b, x, clk, rst);
input b, clk, rst;
output x;
reg x;

parameter Off = 2'b00,
          On1 = 2'b01,
          On2 = 2'b10,
          On3 = 2'b11;
reg [1:0] currentstate;
reg [1:0] nextstate;
//state register
always @ (posedge rst or posedge clk)
begin
if(rst==1)
    currentstate <= Off;
else
    currentstate <= nextstate;
end
//combinational 
always @ (*)
begin
    case (currentstate)
        Off: begin
        x <= 0;
        if(b==0)
            nextstate <= Off;
        else
            nextstate <= On1;
        end
        On1 : begin
            x <= 1;
            nextstate <= On2;
        end
        On2 : begin
            x <= 1;
            nextstate <= On3;
        end
        On3 : begin 
            x <= 1;
            nextstate <= Off;
        end
    endcase
end 
