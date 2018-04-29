function heuristicValue = heuristic(board)

% initializing variables
heuristicValue=0;
distFromCenter=0;
distFromOpponent=0;

% counts zeros on the board
zeros = length(find(board==0));

% if there are more than 12 vacant places on board only then the following
% strategy works.
if(zeros>12)
    
    % finding agent and human location pointers on board
    [agentRow,agentCol] = find(board == 1);
    [humanRow,humanCol] = find(board == 2);
    % calculating distances from oppenent
    distFromOpponent = sqrt ((agentRow-humanRow)^2+(agentCol-humanCol)^2);
    
    % if centre is not occupied then it calculates distance of agent from centre
    if(board(4,4)==0)
        distFromCenter = sqrt ((agentRow-4)^2+(agentCol-4)^2);
    end
    
    % adding both values to heuristicValue
    heuristicValue = (15 - distFromOpponent)+ (15-distFromCenter);
    
    val =0 ;
    % these checks are added to detect human movement direction and block
    
    if(isValid(board,humanRow,humanCol+1)==1)
        if(board(humanRow,humanCol+1)==22)
            if( (agentRow==humanRow) && (agentCol<humanCol))
                val = val+5;
            end
        end
    end
    
    if(isValid(board,humanRow,humanCol-1)==1)
        if(board(humanRow,humanCol-1)==22)
            if( (agentRow==humanRow) && (agentCol>humanCol))
                val = val+5;
            end
        end
    end
    
    if(isValid(board,humanRow+1,humanCol)==1)
        if(board(humanRow+1,humanCol)==22)
            if( (agentRow<humanRow) && (agentCol==humanCol))
                val = val+5;
            end
        end
    end
    
    if(isValid(board,humanRow-1,humanCol)==1)
        if(board(humanRow-1,humanCol)==22)
            if( (agentRow>humanRow) && (agentCol==humanCol))
                val = val+5;
            end
        end
    end
    % final heuristic value after all additions
    heuristicValue = val + heuristicValue;
    
end
end % end of function