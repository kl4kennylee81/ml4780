function [percentage,score]=hw03autograder()
% function [percentage,score]=hw03autograder()
%
% Tests the functions from homework assignment 0
% Please make sure that the error statements are instructive. 
%
% Output: 
% r=0 number of tests that broke
% s= statement describing the failed test (s={} if all succeed)
%

% handle unit tests
[percentage,s]=hw03tests();
for i=1:length(s)
    disp(s{i});
end;



[xTr,yTr]=genTrainFeatures();
[w,b]=naivebayesCL(xTr,yTr);

% compute score
system('cat secret/girls.test | python name2features.py > girls.csv ');
system('cat secret/boys.test | python name2features.py > boys.csv ');

girls=load('girls.csv');
[n1,d1]=size(girls);
boys=load('boys.csv');
[n2,d2]=size(boys);

xTe=[girls;boys]';
yTe=[ones(n1,1);-ones(n2,1)]';

preds=sign(w'*xTe+b);
score=sum(preds(:)==yTe(:))./length(yTe)
