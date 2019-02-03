function [ tempClass1, tempClass2, temp1Size, temp2Size ] = classify(w, data, numberOfSample)
%classify : Data are classified according to w(t).
%   w : decision line (Dimention: [w1,w2,bias]' = 3x1)
%   data: numberOfFeature x numberOfSample

temp1Size=0;
temp2Size=0;
tempClass1 =[];
tempClass2 =[];


    for i=1:numberOfSample
        dicriminantValue = w' * data(:,i);

        if(dicriminantValue > 0)
            temp1Size=temp1Size+1;
             tempClass1 = [tempClass1,data(:,i)];
            
        else
            temp2Size=temp2Size+1;
            tempClass2 = [tempClass2,data(:,i)];
            
        end
    end

end

