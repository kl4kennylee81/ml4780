function preds=evalboost(BDT,xTe)
% function preds=evalboost(BDT,xTe);
%
% Evaluates a boosted decision tree on a test set xTe.
%
% input:
% BDT | Boosted Decision Trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

%% fill in code here
n = columns(xTe)
pred_totals = zeros(2,n);
[num_trees, ~] = size(BDT);
preds = zeros(1,n);
for i=1:num_trees
	% 1*n
	T = BDT{i,1};
	y_predictions = evaltree(T,xTe);

	index_1 = find(y_predictions==1);
	index_2 = find(y_predictions==2);

	%setting alphas
	if (isempty(index_1) == 0)
		pred_totals(1,index_1) = pred_totals(1,index_1) + BDT{i,2};
	end;
	if (isempty(index_2) == 0)
		pred_totals(2,index_2) = pred_totals(2,index_2) + BDT{i,2};
	end;
end;

% find the max for each vector
for j=1:n
	pred_j = find(max(pred_totals(:,j))== pred_totals(:,j));
	preds(j) = pred_j;
end
