function [ w ] = calcNewDecisionLine( wrongClassifyDataMatrix , w, learningRate )
%calcNewDecisionLine  New decision line calculated

totalCostDerivative = ones(3,1);

totalCostDerivative=sum(wrongClassifyDataMatrix,2);

w = w - learningRate * totalCostDerivative;

end

