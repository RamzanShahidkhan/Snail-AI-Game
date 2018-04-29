function child = generatechildrenupdated(board,turn)
[r,c] = find(board == turn);
tempboard=board;
children =1;
%children=zeros(r,c,children1);
if(r<8)
    [tempboard,move] = islegalmove(tempboard,r+1, c,r,c,turn);
    if(move == true)
        
        child(:,:,children)= tempboard;
        tempboard=board;
        %children(r,c,children)=turn;
        children = children+1 ;
    end
end
if(r>1)
    [tempboard,move] = islegalmove(tempboard,r-1, c,r,c,turn);
    if(move == true)
        child(:,:,children)= tempboard;
        tempboard=board;
        children = children+1 ;
    end
end
if(c<8)
    [tempboard,move] = islegalmove(tempboard,r, c+1,r,c,turn);
    if(move == true)
        
        child(:,:,children)= tempboard;
        tempboard=board;
        children = children+1 ;
    end
end
if(c>1)
    [tempboard,move] = islegalmove(tempboard,r, c-1,r,c,turn);
    if(move == true)
        
        child(:,:,children)= tempboard;
        %children = children+1 ;
    end
end
end