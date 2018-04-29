function [row, colm] = Grid2board(x,y)
x = x/50;
y = y/50;
x = fix(x);
y = fix(y);
x = x+1;
y = y+1;
row = x;
colm =y;
%board(x,y)=turn;
end