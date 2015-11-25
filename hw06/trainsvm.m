function [svmclassify,sv_i,alphas]=trainsvm(xTr,yTr, C,ktype,kpar);
% function [svmclassify,sv_i,alphas]=trainsvm(xTr,yTr, C,ktype,kpar);
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% C   : regularization constant (in front of loss)
% ktype : (linear, rbf, polynomial)
% 
% Output:
% svmclassify : a classifier (scmclassify(xTe) returns the predictions on xTe)
% sv_i : indices of support vecdtors
% alphas : a nx1 vector of alpha values
%
% Trains an SVM classifier with kernel (ktype) and parameters (C,kpar)
% on the data set (xTr,yTr)
%

if nargin<5,kpar=1;end;
yTr=yTr(:);
svmclassify=@(xTe) (rand(1,size(xTe,2))>0.5).*2-1; %% classify everything randomly
n=length(yTr);



disp('Generating Kernel ...')
% 
% YOUR CODE
%
K = computeK(ktype, xTr, xTr, kpar);

disp('Solving QP ...')
%
% YOUR CODE 
%
yTr2 = yTr.';
[H,q,A,b,lb,ub] = generateQP(K,yTr2,C);


disp('Extracting support vectors ...')
%
% YOUR CODE 
%


X0 = zeros(n, 1);
[X, OBJ, INFO, LAMBDA] = qp(X0, H, q, A, b, lb, ub);
alphas = X;
sv_i = find(X);

disp('Recovering bias')
%
bias = recoverBias(K,yTr,alphas,C);
%


disp('Creating classifier ...')
%
ai_yi = alphas.*yTr;
svmclassify = @(xTe) sum( (computeK(ktype,xTr,xTe,kpar) .* repmat(ai_yi,1,size(xTe,2))), 1) + bias;

%



disp('Computing training error:') % this is optional, but interesting to see
%
% YOUR CODE 
%


