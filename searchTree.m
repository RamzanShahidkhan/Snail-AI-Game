function [bestChild,bestValue]= searchTree(inputBoard,turn, depth)

% to get updated result of the inputBoard
[result, blueSnailScore, redSnailScore] = evaluateBoard(inputBoard);

% if depth level is reached
if ( (depth==0) || (result==0) )
    bestValue = (blueSnailScore-redSnailScore)+heuristic(inputBoard);
    bestChild = inputBoard;
    return;
end

children = generatechildrenupdated(inputBoard,turn);
% counting children
childrenCount = size((children),3);

% changing turn
if(turn==1)
    turn=2;
else
    turn=1;
end

% calling search tree for each child of ParentBoard
for i=1:childrenCount
    [bestChildren(:,:,i),BestValues(i)]=searchTree(children(:,:,i),turn,depth-1);
end

if turn==1
    [bestValue,index]=min(BestValues);
    bestChild=children(:,:,index);
else
    [bestValue,index]=max(BestValues);
    bestChild=children(:,:,index);
end

end
