function y =  isLeagal(x,y)
    if (x>800 || y>800 || x<0 || y<0)
        y=false;
    else 
       y= true; 
    end
end