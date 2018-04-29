function mainController(handles)

board = initiate_Board(8,8);
grid = initgrid(board);
grid =  board2Grid (grid,board);
imshow(grid,'Parent',handles.axes1);
%imshow(grid);
turn = randi(2);
if(turn == 1)
    uiwait(msgbox('First Player will start.','Turn Info'));
else
    uiwait(msgbox('Second Player will start.','Turn Info'));
end
noChangeFirst = 0;
noChangeSecond = 0;

humanScore=0;
agentScore=0;

while( (noChangeFirst<10) || (noChangeSecond<10))
    [r, c]= ((find(board==turn)));
    if( (turn==2) && (noChangeSecond<10) )
        [y,x] = ginput(1);
        while(isLeagal(x,y)==false)
            uiwait(msgbox('You cannt click here.','Illegal click'));
            [y,x] = ginput(1);
        end
        [row, colm]=Grid2board(x,y);
        
        [board,move] = islegalmove( board,row,colm,r,c,turn);
        if (move==false)
            continue;
        end
        
        grid=board2Grid(grid,board );
        imshow(grid);
        
        [~,~,SecondScore] = evaluateBoard(board);
        if(SecondScore > humanScore)
            humanScore=SecondScore;
            noChangeSecond=0;
        else
            noChangeSecond = noChangeSecond+1;
        end
        
        if(noChangeFirst<10)  % if AI player is active(his game is not over), only then gives him turn
            %turn=1;
            turn=turnChange(turn);
        else
            %(msgbox('Game Over.','Agent Game Status'));
            humanScore=64-agentScore;
            if(humanScore>agentScore)
                set(handles.humanWinner,'Visible','on');
                break;
            else
                    set(handles.agentWinner,'Visible','on');
                    break;
            end
        end
    end
    
    if( (turn==1) && (noChangeFirst<10) )
        pause(0.5); % adding delay
        [tempBoard,bestValue] = searchTree(board,turn,5);
        board = tempBoard;
        
        grid=board2Grid(grid,board );
        
        imshow(grid);
        
        [~,FirstScore,~]=evaluateBoard(board);
        if(FirstScore > agentScore)
            agentScore=FirstScore;
            noChangeFirst=0;
        else
            noChangeFirst = noChangeFirst+1;
        end
        
        if(noChangeSecond<10) % if human player is active(his game is not over), only then gives him turn
            turn=2;
        else
            %(msgbox('Game Over.','Human Game Status'));
              agentScore=64-humanScore;
            if(humanScore>agentScore)
                set(handles.humanWinner,'Visible','on');
                break;
            else
                set(handles.agentWinner,'Visible','on');
                break;
            end
        end
        
    end
    [~,FirstScore,SecondScore]=evaluateBoard(board);
    set(handles.humanScore, 'String',SecondScore);
    set(handles.agentScore, 'String',FirstScore);
    
    if( FirstScore+SecondScore == 64)
        if(FirstScore< SecondScore)
            % (msgbox('Second Player wins.','Game Status'));
            set(handles.humanWinner,'Visible','on');
            break;
        elseif(FirstScore>SecondScore)
            %(msgbox('First Player wins.','Game Status'));
            set(handles.agentWinner,'Visible','on');
            break;
        else
            %(msgbox('Game Over.','Game Status'));
            set(handles.agentWinner,'String','Draw!');
            set(handles.humanWinner,'String','Draw!');
            set(handles.agentWinner,'Visible','on');
            set(handles.humanWinner,'Visible','on');
            break;
        end
    end
end
%{
[result,FirstScore,SecondScore]=evaluateBoard(board);


if(FirstScore< SecondScore)
    set(handles.humanWinner,'Visible','on');
    %(msgbox('Second Player wins.','Game Status'));
elseif(FirstScore>SecondScore)
    set(handles.agentWinner,'Visible','on');
    %(msgbox('First Player wins.','Game Status'));
else
    %(msgbox('Game Over.','Game Status'));
    set(handles.agentWinner,'String','Draw!');
    set(handles.humanWinner,'String','Draw!');
    set(handles.agentWinner,'Visible','on');
    set(handles.humanWinner,'Visible','on');
    
end
%}
end