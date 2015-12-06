function T=id3tree(xTr,yTr,maxdepth,weights)
% function T=id3tree(xTr,yTr,maxdepth,weights)
%
% The maximum tree depth is defined by "maxdepth" (maxdepth=2 means one split).
% Each example can be weighted with "weights".
%
% Builds an id3 tree
%
% Input:
% xTr | dxn input matrix with n column-vectors of dimensionality d
% yTr | 1xn input matrix
% maxdepth = maximum tree depth
% weights = 1xn vector where weights(i) is the weight of example i
%
% Output:
% T = decision tree
%

% OUTPUT entropysplit.m:
% feature | best feature to split
% cut     | Value to split on.
% Hbest   | Loss of best split


[d, n] = size(xTr);

if nargin<3,
	weights=ones(1,n)./n;
	maxdepth = (2^d) + 1;
end;

[d, n] = size(xTr);
q = (2^maxdepth) - 1;
Tree = zeros(6, q);
features_to_use = ones(q, d); % qxd matrix keeps track of which features haven't been used at node (row) i
location_of_x = ones(1, n); % keeps track of where each x_i is in the tree
lowerbound = 2^(maxdepth-1);
upperbound = q;

for currentNode=1:q
	if (currentNode <= lowerbound && currentNode <= upperbound) 

		available_x_indicies = find(location_of_x == currentNode); % 1 x n-? shows the columns of available vectors
		abridged_y = yTr(available_x_indicies);

		if isempty(abridged_y)
			continue;
		end;
		
		Tree(1, currentNode) = mode(abridged_y);
		Tree(2, currentNode) = -1;
		Tree(3, currentNode) = -1;
		Tree(4, currentNode) = 0;
		Tree(5, currentNode) = 0;

		if currentNode == 1 
			Tree(6, currentNode) = 0; % root node
		else
			Tree(6, currentNode) = floor(currentNode/2);
		end;
	else

		% 1. find vectors that are available at this node
		available_x_indicies = find(location_of_x == currentNode); % 1 x n-? shows the columns of available vectors
		shortened_xTr = xTr(:, available_x_indicies); % d x n-? take only the correct training instances	
		abridged_y = yTr(available_x_indicies);

		% 2. find features (dimensions) that haven't been used at the current node
		candidate_features = features_to_use(currentNode, :); % 1xd vector, 1 means usable, 0 means used
		available_feat = find(candidate_features); % 1 x d-? shows the indicies of features you can use
		abridged_x = shortened_xTr(available_feat, :); % d-? x n-? keep only the dimensions that haven't been used
		
		% 3 find the best split
		[feature,cut,Hbest] = entropysplit(abridged_x, abridged_y, weights);

		if feature == 0
			continue;
		end;

		Tree(1, currentNode) = -1;
		Tree(2, currentNode) = available_feat(feature);
		Tree(3, currentNode) = cut;
		Tree(4, currentNode) = -1;
		Tree(5, currentNode) = -1;

		% fill in parent
		if currentNode == 1 
			Tree(6, currentNode) = 0; % root node
		else
			Tree(6, currentNode) = floor(currentNode/2);
		end;

		left_indicies = find(abridged_y <= cut);
		right_indicies = find(abridged_y > cut);		
		left = abridged_x(left_indicies);
		right = abridged_x(right_indicies);

		if (left == 0 && right == 0)
			Tree(4, currentNode) = 0;
			Tree(5, currentNode) = 0;
			Tree(1, currentNode) = mode(abridged_y);
			continue;
		end;

		% update features_to_use
		features_to_use(currentNode)(available_feat(feature)) = 0;

		% update location_of_x
		location_of_x((available_x_indicies(left_indicies))) = currentNode*2;
		location_of_x((available_x_indicies(right_indicies))) = currentNode*2+1;
	end;
end;

T = Tree;








