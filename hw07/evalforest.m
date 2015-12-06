function preds=evalforest(F,xTe)
% function preds=evalforest(F,xTe);
%
% Evaluates a random forest on a test set xTe.
%
% input:
% F   | Forest of decision trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here
m = length(F);
% m each tree x n prediction
[d,n] = size(xTe);
all_preds = zeros(m,n);
for i=1:m
	this_preds = evaltree(F{i},xTe);
	all_preds(i,:) = this_preds;
end;
preds = mode(all_preds);
end;
