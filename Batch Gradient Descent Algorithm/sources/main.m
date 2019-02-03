clc;
clearvars;
close all;


%% 
% Author : Ýsmail Can Büyüktepe
% Date: 02.02.2019
% Institute : Gebze Technical University
% E-mail: ismailcanbuyuktepe@gmail.com
%
%
%
%
%
%


folderName = '..\handlers';                             % Don't change
folderNameOfFunctions = '..\handlers\functions';        % Don't change
folderNameOfDataSets = '..\handlers\dataset';          % Don't change


addpath(folderName, folderNameOfFunctions, folderNameOfDataSets);

dataSet = load('ClassificationData1.mat');

class1 = dataSet.class1_data();
class2 = dataSet.class2_data();

%% You can use to show distribution of each class

figure(1),
plot(class1(1,:), class1(2,:), '.', 'Color', 'red');
title('Overview of distribution class1');
xlabel('x');
ylabel('y');

figure(2),
plot(class2(1,:), class2(2,:), '.', 'Color', 'blue');
title('Overview of distribution class2');
xlabel('x');
ylabel('y');


%% all data is separated as training and test

trainingData = [class1(:,1:1800), class2(:,1:1800); ones(1,3600)];
testData = [class1(:,1801:2000), class2(:,1801:2000); ones(1,400)];

learningRate =0.02;     % correspond lambda
counter = 0;
wrongClassifyDataMatrix=[]; 
w=[12;10;1];             % initial decision line

[numberOfFeatureTrain, numberOfSampleTrain]= size(trainingData);
[numberOfFeatureTest, numberOfSampleTest]= size(testData);

%% Start Algorithm for 50 iteration (if you change ,you can do it)
for i=1:50
  
    [tempClass1, tempClass2 , temp1Size, temp2Size]= classify(w, trainingData, numberOfSampleTrain);
    [wrongClassifyDataMatrix] = detectIncorrectClassifiedData(class1, class2, tempClass1, tempClass2, ...
                                         temp1Size, temp2Size, numberOfSampleTrain);
    
    [w] = calcNewDecisionLine(wrongClassifyDataMatrix, w, learningRate);
    
end

%% Successof this algorithm is calculated on the test datas.

   [testTmpClass1, testTmpClass2, testTmp1Size, testTmp2Size]=classify(w, testData, numberOfSampleTest);
    
   [numbofAccurClassifiedData, accuracy] = successCalculation(testData, numberOfSampleTest, ...
                                               testTmpClass1,testTmpClass2, testTmp1Size, testTmp2Size);
                                                                    
    
        
