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

size_validation = ceil(n/5);
size_training = n - size_validation;

xTr_validation = xTr(:, 1:size_validation);
yTr_validation = yTr(:, 1:size_validation);

xTr_training = xTr(:, 1:size_training);
yTr_training = yTr(:, 1:size_training);

C_len = length(Cs);
P_len = length(paras);
errorMatrix(1:C_len, 1:P_len) = 0; % error matrix initialized to 0

minError = 101;
minC = -1;
minP = -1;

for i = 1:C_len
	for j=1:P_len
		c = Cs(i);
		kpar = paras(j);
		[svmclassify, sv_i, alphas] = trainsvm(xTr_training, yTr_training, c, ktype, kpar);
		guess = svmclassify(xTr_validation); % guess is m x 1

		err = sum(sign(guess) ~= yTr_validation.') ./ length(guess);
		errorMatrix(i,j) = err;

		if err < minError
			minError = err;
			minC = c;
			minP = kpar;
		end;
	end;
end;

bestC = minC;
bestP = minP;
bestval = minError;
allvalerrs = errorMatrix;

