function [result,FirstScore,SecondScore] = evaluateBoard(Board)
result = 0;

FirstScore = length(find(Board==11))+length(find(Board==1));
SecondScore = length(find(Board==22))+length(find(Board==2));
% condtition to check if game is continue  
  if(find(Board == 0))
      result = 5;
  end
  
end % end of evaluateBoard function


