function grid1 =  board2Grid (grid1,board)


Zero_pic = imread('s1.bmp');

Zero_pic = imresize(Zero_pic, [47, 47]);
%Zero_pic=Zero_pic(:, :, 1);

%Zero_pic = imresize(Zero_pic, 0.5);

dead_pic1 = imread('o.bmp');
dead_pic1 = imresize(dead_pic1, [47, 47]);
%dead_pic1=dead_pic1(:, :, 1);
%dead_pic1 = imresize(dead_pic1, 0.5);

Kata_pic = imread('s2.bmp');
%Kata_pic = imresize(Kata_pic, 0.5);
Kata_pic = imresize(Kata_pic, [47, 47]);
%Kata_pic=Kata_pic(:, :, 1);
dead_pic2 = imread('x.bmp');

dead_pic2 = imresize(dead_pic2, [47, 47]);
%dead_pic2=dead_pic2(:, :, 1);
%dead_pic2 = imresize(dead_pic2, 0.5);

[rows,cols] = size(board);
for row = 1 : rows
    for col = 1 : cols
        rowLocation = (row*50)-48;
        colLocation = (col*50)-48;
        if(board(row,col) == 1)
            
            grid1(rowLocation:rowLocation+46,colLocation:colLocation+46, :) = Zero_pic;
        end
        if(board(row,col) == 11)
            
            grid1(rowLocation:rowLocation+46,colLocation:colLocation+46, :) = dead_pic1;
        end
        if (board(row,col) == 2)
            
            grid1(rowLocation:rowLocation+46,colLocation:colLocation+46, :) = Kata_pic;
        end
        if (board(row,col) == 22)
            
            grid1(rowLocation:rowLocation+46,colLocation:colLocation+46, :) = dead_pic2;
        end
    end
end

end