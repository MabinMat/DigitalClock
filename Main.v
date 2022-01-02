module Main(clk,secsSeg,minsSeg,hrsSeg,reset,en,hrup,minup,secup);
//registers for clock
reg [25:0]count;
reg clk_1s;

//setting up inputs/ouputs
input clk,reset,en,hrup,minup,secup;
output  reg [13:0] secsSeg =16'b10000001000000;
output  reg [13:0] minsSeg =16'b10000001000000;
output  reg [13:0] hrsSeg  =16'b10000001000000;

//registers for seconds,minutes, and hours value
reg [5:0] sec=0;
reg [5:0] min=0;
reg [5:0] hour=0;

//Always block to generate 1 second clock
always @(posedge clk, posedge reset) begin
	
	if(reset) begin
        count <= 0;
        end
	else if(count == 26'd25000000)begin
      clk_1s = ~clk_1s;
		count = 26'd0;
		end
	else
		count = count+26'd1;
	end


	
//always block to change clock value/reset
always @(posedge clk_1s,posedge reset) begin

	//reset all values
	if(reset)begin
		sec <= 0;
		secsSeg <= 16'b10000001000000;
		min <= 0;
		minsSeg <= 16'b10000001000000;
		hour <=0;
		hrsSeg <= 16'b10000001000000;
		
	end
	//sets seconds back from 60 to 00
	else if(sec==6'd60)begin
			sec<=0;
			secsSeg <= 16'b10000001000000;
			//sets mins back from 60 to 00
			if(min==6'd60) begin
				min<=0;
				minsSeg <= 16'b10000001000000;
				//sets hours back from 23 to 00
				if (hour==6'd23) begin
					hour<=0;
					hrsSeg <=16'b10000001000000;
				end else begin
				//increment hours 
				hour<=hour+1'd1;
				case(hour)
    				6'd00:hrsSeg<=16'b10000001000000;
					6'd01:hrsSeg<=16'b10000001111001;
					6'd02:hrsSeg<=16'b10000000100100;
					6'd03:hrsSeg<=16'b10000000110000;
					6'd04:hrsSeg<=16'b10000000011001;
					6'd05:hrsSeg<=16'b10000000010010;
					6'd06:hrsSeg<=16'b10000000000010;
					6'd07:hrsSeg<=16'b10000001111000;
					6'd08:hrsSeg<=16'b10000000000000;
					6'd09:hrsSeg<=16'b10000000011000;
					6'd10:hrsSeg<=16'b11110011000000;
					6'd11:hrsSeg<=16'b11110011111001;
					6'd12:hrsSeg<=16'b11110010100100;
					6'd13:hrsSeg<=16'b11110010110000;
					6'd14:hrsSeg<=16'b11110010011001;
					6'd15:hrsSeg<=16'b11110010010010;
					6'd16:hrsSeg<=16'b11110010000010;
					6'd17:hrsSeg<=16'b11110011111000; 
					6'd18:hrsSeg<=16'b11110010000000;
					6'd19:hrsSeg<=16'b11110010011000;
					6'd20:hrsSeg<=16'b01001001000000;
					6'd21:hrsSeg<=16'b01001001111001;
					6'd22:hrsSeg<=16'b01001000100100;
					6'd23:hrsSeg<=16'b01001000110000;
				endcase				
				end
			end
			else begin
			//increment mins
				min<=min+1'd1;
				case(min)
					6'd00:minsSeg<=16'b10000001000000;
					6'd01:minsSeg<=16'b10000001111001;
					6'd02:minsSeg<=16'b10000000100100;
					6'd03:minsSeg<=16'b10000000110000;
					6'd04:minsSeg<=16'b10000000011001;
					6'd05:minsSeg<=16'b10000000010010;
					6'd06:minsSeg<=16'b10000000000010;
					6'd07:minsSeg<=16'b10000001111000;
					6'd08:minsSeg<=16'b10000000000000;
					6'd09:minsSeg<=16'b10000000011000;
					6'd10:minsSeg<=16'b11110011000000;
					6'd11:minsSeg<=16'b11110011111001;
					6'd12:minsSeg<=16'b11110010100100;
					6'd13:minsSeg<=16'b11110010110000;
					6'd14:minsSeg<=16'b11110010011001;
					6'd15:minsSeg<=16'b11110010010010;
					6'd16:minsSeg<=16'b11110010000010;
					6'd17:minsSeg<=16'b11110011111000; 
					6'd18:minsSeg<=16'b11110010000000;
					6'd19:minsSeg<=16'b11110010011000;
					6'd20:minsSeg<=16'b01001001000000;
					6'd21:minsSeg<=16'b01001001111001;
					6'd22:minsSeg<=16'b01001000100100;
					6'd23:minsSeg<=16'b01001000110000;
					6'd24:minsSeg<=16'b01001000011001;
					6'd25:minsSeg<=16'b01001000010010;
					6'd26:minsSeg<=16'b01001000000010;
					6'd27:minsSeg<=16'b01001001111000;
					6'd28:minsSeg<=16'b01001000000000;
					6'd29:minsSeg<=16'b01001000011000;
					6'd30:minsSeg<=16'b01100001000000;
					6'd31:minsSeg<=16'b01100001111001;
					6'd32:minsSeg<=16'b01100000100100;
					6'd33:minsSeg<=16'b01100000110000;
					6'd34:minsSeg<=16'b01100000011001;
					6'd35:minsSeg<=16'b01100000010010;
					6'd36:minsSeg<=16'b01100000000010;
					6'd37:minsSeg<=16'b01100001111000;
					6'd38:minsSeg<=16'b01100000000000;
					6'd39:minsSeg<=16'b01100000011000;
					6'd40:minsSeg<=16'b00110011000000;
					6'd41:minsSeg<=16'b00110011111001;
					6'd42:minsSeg<=16'b00110010100100;
					6'd43:minsSeg<=16'b00110010110000;
					6'd44:minsSeg<=16'b00110010011001;
					6'd45:minsSeg<=16'b00110010010010;
					6'd46:minsSeg<=16'b00110010000010;
					6'd47:minsSeg<=16'b00110011111000;
					6'd48:minsSeg<=16'b00110010000000;
					6'd49:minsSeg<=16'b00110010011000;
					6'd50:minsSeg<=16'b00100101000000;
					6'd51:minsSeg<=16'b00100101111001;
					6'd52:minsSeg<=16'b00100100100100;
					6'd53:minsSeg<=16'b00100100110000;
					6'd54:minsSeg<=16'b00100100011001;
					6'd55:minsSeg<=16'b00100100010010;
					6'd56:minsSeg<=16'b00100100000010;
					6'd57:minsSeg<=16'b00100101111000;
					6'd58:minsSeg<=16'b00100100000000;
					6'd59:minsSeg<=16'b00100100011000;
				endcase
			end
			end
		else begin
		//increment seconds
			sec<=sec+1'd1;
				case(sec)
    				6'd00:secsSeg<=16'b10000001000000;
					6'd01:secsSeg<=16'b10000001111001;
					6'd02:secsSeg<=16'b10000000100100;
					6'd03:secsSeg<=16'b10000000110000;
					6'd04:secsSeg<=16'b10000000011001;
					6'd05:secsSeg<=16'b10000000010010;
					6'd06:secsSeg<=16'b10000000000010;
					6'd07:secsSeg<=16'b10000001111000;
					6'd08:secsSeg<=16'b10000000000000;
					6'd09:secsSeg<=16'b10000000011000;
					6'd10:secsSeg<=16'b11110011000000;
					6'd11:secsSeg<=16'b11110011111001;
					6'd12:secsSeg<=16'b11110010100100;
					6'd13:secsSeg<=16'b11110010110000;
					6'd14:secsSeg<=16'b11110010011001;
					6'd15:secsSeg<=16'b11110010010010;
					6'd16:secsSeg<=16'b11110010000010;
					6'd17:secsSeg<=16'b11110011111000; 
					6'd18:secsSeg<=16'b11110010000000;
					6'd19:secsSeg<=16'b11110010011000;
					6'd20:secsSeg<=16'b01001001000000;
					6'd21:secsSeg<=16'b01001001111001;
					6'd22:secsSeg<=16'b01001000100100;
					6'd23:secsSeg<=16'b01001000110000;
					6'd24:secsSeg<=16'b01001000011001;
					6'd25:secsSeg<=16'b01001000010010;
					6'd26:secsSeg<=16'b01001000000010;
					6'd27:secsSeg<=16'b01001001111000;
					6'd28:secsSeg<=16'b01001000000000;
					6'd29:secsSeg<=16'b01001000011000;
					6'd30:secsSeg<=16'b01100001000000;
					6'd31:secsSeg<=16'b01100001111001;
					6'd32:secsSeg<=16'b01100000100100;
					6'd33:secsSeg<=16'b01100000110000;
					6'd34:secsSeg<=16'b01100000011001;
					6'd35:secsSeg<=16'b01100000010010;
					6'd36:secsSeg<=16'b01100000000010;
					6'd37:secsSeg<=16'b01100001111000;
					6'd38:secsSeg<=16'b01100000000000;
					6'd39:secsSeg<=16'b01100000011000;
					6'd40:secsSeg<=16'b00110011000000;
					6'd41:secsSeg<=16'b00110011111001;
					6'd42:secsSeg<=16'b00110010100100;
					6'd43:secsSeg<=16'b00110010110000;
					6'd44:secsSeg<=16'b00110010011001;
					6'd45:secsSeg<=16'b00110010010010;
					6'd46:secsSeg<=16'b00110010000010;
					6'd47:secsSeg<=16'b00110011111000;
					6'd48:secsSeg<=16'b00110010000000;
					6'd49:secsSeg<=16'b00110010011000;
					6'd50:secsSeg<=16'b00100101000000;
					6'd51:secsSeg<=16'b00100101111001;
					6'd52:secsSeg<=16'b00100100100100;
					6'd53:secsSeg<=16'b00100100110000;
					6'd54:secsSeg<=16'b00100100011001;
					6'd55:secsSeg<=16'b00100100010010;
					6'd56:secsSeg<=16'b00100100000010;
					6'd57:secsSeg<=16'b00100101111000;
					6'd58:secsSeg<=16'b00100100000000;
					6'd59:secsSeg<=16'b00100100011000;
				
				endcase
		end
	
			

end


endmodule