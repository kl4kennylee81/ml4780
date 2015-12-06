function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
% function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
%
% INPUT:    
% xTr : dxn input vectors
% yTr : 1xn input labels
% ktype : (linear, rbf, polynomial)
% Cs   : interval of regularization constant that should be tried out
% paras: interval of kernel parameters that should be tried out
% 
% Output:
% bestC: best performing constant C
% bestP: best performing kernel parameter
% bestval: best performing validation error
% allvalerrs: a matrix where allvalerrs(i,j) is the validation error with parameters Cs(i) and paras(j)
%
% Trains an SVM classifier for all possible parameter settings in Cs and paras and identifies the best setting on a
% validation split. 
%

[d,n] = size(xTr);
C_len = length(Cs);
P_len = length(paras);

k = 2;

ktotal = ceil(n/k);
kwindow = floor(n/k);

% accumilate
runningC = 25;
runningP = 10.5;
runningErr = 0;
errorMatrix(1:C_len, 1:P_len) = 0; % error matrix initialized to 0

bestC = runningC;
bestP = runningP;
bestval = runningErr;
allvalerrs = errorMatrix;

% fold = 1;

% while fold <= n-kwindow+1
%   x_validation = xTr(:,[fold:fold+kwindow-1]);
%   x_training = xTr;
%   x_training(:,[fold:fold+kwindow-1]) = [];

%   y_validation = yTr(:,[fold:fold+kwindow-1]);
%   y_training = yTr;
%   y_training(:,[fold:fold+kwindow-1]) = [];

%   % reinitialize loop variables
%   minError = 101;
%   minC = -1;
%   minP = -1;
%   tempErrorMatrix(1:C_len, 1:P_len) = 0;

%   for i = 1:C_len
%       for j=1:P_len
%           c = Cs(i);
%           kpar = paras(j);
%           [svmclassify, sv_i, alphas] = trainsvm(x_training, y_training, c, ktype, kpar);
%           guess = svmclassify(x_validation); % m x 1

%           err = sum(sign(guess) ~= y_validation.') ./ length(guess);
%           tempErrorMatrix(i,j) = err;

%           if err < minError
%               minError = err;
%               minC = c;
%               minP = kpar;
%           end;
%       end;
%   end;

%   runningErr = runningErr + minError;
%   runningC = runningC + minC;
%   runningP = runningP + minP;
%   errorMatrix = errorMatrix + tempErrorMatrix;

%   fold = fold+kwindow;
% end;

% bestC = runningC ./ ktotal;
% bestP = runningP ./ ktotal;
% bestval = runningErr ./ ktotal;
% allvalerrs = errorMatrix ./ ktotal;