function [ wrongClassifyDataMatrix ] = detectIncorrectClassifiedData(class1, class2, tempClass1, ...
                                                tempClass2, temp1Size, temp2Size, numberOfSampleTrain)
%detectIncorrectClassifiedData: To Determine incorrectly classified data

isCorrectClassify = false;
wrongClassifyDataMatrix=[];
counter=1;
% To Determine incorrectly classified datas for each class

    for i=1:temp1Size
        for j=1:numberOfSampleTrain/2
            if(tempClass1(1:2,i) == class1(:,j))
                isCorrectClassify = true;
                break;
            end
        end
        
        if(~isCorrectClassify)
            wrongClassifyDataMatrix(:,counter)=tempClass1(:,i);
            counter = counter+1
        end
        
        isCorrectClassify=false;        
    end
    
    for k=1:temp2Size
        for m=1:numberOfSampleTrain/2
            if(tempClass2(1:2,k) == class2(:,m))
                isCorrectClassify =true;
                break;
            end
        end
        
        if(~isCorrectClassify)
            wrongClassifyDataMatrix(:,counter)= tempClass2(:,k) * -1;
            counter = counter+1;
        end
        
        isCorrectClassify=false;
    end
end

