function [board,move] = islegalmove( board,row,colm,r,c,turn )
%move=true;
if(((row==r(1)+1||row==r(1)-1) && colm==c(1))&& (board(row,colm)==0))
    board(row,colm)=turn;
    board(r,c)= turn*11;
    move =true;
elseif(((colm==c(1)+1 || colm==c(1)-1 )&& row==r(1))&& (board(row,colm)==0))
    board(row,colm)=turn;
    board(r,c)= turn*11; 
    move=true;  
%elseif(board(row,colm)==turn*11)
%elseif((row~=r) && (colm==c))
elseif((r < row) && (c == colm))
        if(board(r+1,c)== turn*11)
            tempRow = r+1; tempCol = c;
           while(board(tempRow,tempCol) == turn*11)
            tempRow = tempRow+1; 
           if(tempRow > 8) 
                tempRow=9;
                break;
           end 
           end
        board(tempRow-1,tempCol)= turn;
        board(r,c)= turn*11;
        move=true;
        else
            move=false;
        end
elseif((r > row) && (c == colm))
        if(board(r-1,c)== turn*11)
        tempRow = r-1; tempCol = c;
        while(board(tempRow,tempCol) == turn*11)
            tempRow = tempRow-1;
            if(tempRow < 1)        
                tempRow=0;
                break;
            end
        end
        board(tempRow+1,tempCol)= turn;
        board(r,c)= turn*11;
        move=true;
        else
        move=false;
        end
            
        %{
while board(row,colm)==turn*11
            if(row>r)
                row=row-1;
            else
                row=row+1;
            end  
        end
        if (row==r && colm==c)
            %if(board(1:r-1,c)==turn*11)
             %   move=true;
            %elseif(board(r+1:8,c)==turn*11)
                move=true;
            %else
       % board(row,colm)=turn;  
            %move=false;
            %end
        else
            move=false;
        end
        %board(row,colm)=turn;
        %}
elseif((r == row) && (c < colm))           
        if(board(r,c+1)== turn*11)
        tempRow = r; tempCol = c+1;
        while(board(tempRow,tempCol) == turn*11)
            tempCol = tempCol+1;
            if(tempCol > 8)   
                tempCol=9;
                break;
            end
        end
        board(tempRow,tempCol-1)= turn;
        board(r,c)= turn*11;
        move=true;
        else
            move=false;
        end
elseif((r == row) && (c > colm))
        if(board(r,c-1)== turn*11)
        tempRow = r; tempCol = c-1;
        while(board(tempRow,tempCol) == turn*11)
            tempCol = tempCol-1;
            if(tempCol < 1)   
                tempCol=0;
                break;
            end
        end
        board(tempRow,tempCol+1)= turn;
        board(r,c)= turn*11;
        move=true;
        else
            move=false;
        end
      %{ 
        while((board(row,colm)==turn*11))
            if(colm>c)
                colm=colm-1;
            else
                colm=colm+1;
            end    
        end
        if ((row==r && colm==c))
            move=true;
        else
       % board(row,colm)=turn;  
            move=false;
        end
        %}
    %else
     %   move=false;
    %end
        
else
    move=false;
end  
end