function [ numbofAccurClassifiedData , accuracy ] = successCalculation( testData, sizeOfTestData, testTmpClass1, ...
                                                testTmpClass2, testTmp1Size, testTmp2Size )

%successCalculation: The number of correctly classified data was calculated.

% numbofAccurClassifiedData = The number of correctly classified data
% accuracy = accuracy in percent

numbofAccurClassifiedData=0;
    
    for i=1:testTmp1Size
        for j=1: sizeOfTestData/2
            if(testTmpClass1(1:2,i) == testData(1:2 ,j))
                numbofAccurClassifiedData = numbofAccurClassifiedData+1;
            end
        end
    end
    
    for k=1:testTmp2Size
        for m=1:sizeOfTestData
            if(testTmpClass2(1:2,k) == testData(1:2,m))
                numbofAccurClassifiedData=numbofAccurClassifiedData+1;
            end 
        end
    end
    
    accuracy = (numbofAccurClassifiedData*100)/sizeOfTestData;

end

