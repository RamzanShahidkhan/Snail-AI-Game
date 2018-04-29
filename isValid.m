function status = isValid(board,row,col)

status = false;
[boardRows,boardCols] = size(board);

% if both row and col are in range [0-boardRows] and [0-boardCols]
% respectively means they are valid.
if(row>0 && row<boardRows+1 && col>0 && col<boardCols +1 )
    status = true;
end

end