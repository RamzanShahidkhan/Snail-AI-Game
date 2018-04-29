function board = initiate_Board(rows,cols)
    board = zeros(rows,cols);
    board(rows,1)=1;
    board(1,cols)=2;
end