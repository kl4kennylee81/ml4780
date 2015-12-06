function BDT=boosttree(x,y,nt,maxdepth)
% function BDT=boosttree(x,y,nt,maxdepth)
%
% Learns a boosted decision tree on data x with labels y.
% It performs at most nt boosting iterations. Each decision tree has maximum depth "maxdepth".
%
% INPUT:
% x  | input vectors dxn
% y  | input labels 1xn
% nt | number of trees (default = 100)
% maxdepth | depth of each tree (default = 3)
%
% OUTPUT:
% BDT | Boosted DTree
%
if nargin<3,
	nt = 100;
	maxdepth = 4;
end;

if nargin<4,
	maxdepth = 4;
end;

H = {}
[d,n] = size(x);
wi = ones(1,n);
wi = wi./n;
for i=1:nt
	% create a weak learner tree
	temp_tree = id3tree(x,y,maxdepth,wi);
	preds = evaltree(temp_tree,x);
	% y*H(x) 1*n
	index_correct = preds!=y;
	summed_error = wi*index_correct.';
	if (summed_error == 0)
		temp{1,1} = temp_tree;
		temp{1,2} = 1;
		H = temp;
		break;
	end;

	y_Hx = -preds.*y;

	if summed_error > 1/2
		break;
	end;
	H{i,1} = temp_tree;
	H{i,2} = (log((1 - summed_error)/summed_error))/2;

	wi = wi.* exp(H{i,2}.*y_Hx);
	wi = wi ./ sum(wi);
end;

BDT = H;
end;
