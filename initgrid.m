function grid1= initgrid(board) 
[rowsBoard, colsBoard] = size(board);
 %grid1 = ones(rowsBoard*50, colsBoard*50);
grid1 = imread('snailBoard1.bmp');
 grid1 (:,1, :) = 0;
 grid1(1,:, :) = 0;
 for i=1:rowsBoard
     grid1 (:,i*50, :) = 0;
     grid1(i*50,:) = 0;
 end
%grid1 = imread('snailBoard.jpg');
end