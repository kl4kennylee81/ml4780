function T=prunetree(T,xTe,y)
% function T=prunetree(T,xTe,y)
%
% Prunes a tree to minimal size such that performance on data xTe,y does not
% suffer.
%
% Input:
% T = tree
% xTe = validation data x (dxn matrix)
% y = labels (1xn matrix)
%
% Output:
% T = pruned tree
%

%% fill in code here
[d,n] = size(xTe);
[~,q] = size(T);

function acc = validation_error(test, tree)
	ypredict = evaltree(tree,test);
	correctness = ypredict-y;
	acc = sum(correctness(:)==0) ./ n;
end;

% take the prediction of the parent, assuming that it exists
acc = validation_error(xTe, T);
global_acc = acc;

function traverse(node)	
	if T(4, node) == 0 && T(5, node) == 0
		if T(6, node) == 0
			return
		end;		
		parent = T(6,node);
		parentprediction = T(1, parent);
		temp = T(:, :);
		temp(1, node) = parentprediction;
		newacc = validation_error(xTe, temp);
		if newacc >= global_acc
			global_acc = newacc;
			if T(4, parent) == node
				T(4, parent) = 0;
			else
				T(5, parent) = 0;
			end;
		end;
	else
		traverse(T(4, node))
		traverse(T(5, node))	

		if T(4, node) == 0 && T(5, node) == 0
			if T(6, node) == 0
				return
			end;		
			parent = T(6,node);
			parentprediction = T(1, parent);
			temp = T(:, :);
			temp(1, node) = parentprediction;
			newacc = validation_error(xTe, temp);
			if newacc >= global_acc
				global_acc = newacc;
				if T(4, parent) == node
					T(4, parent) = 0;
				else
					T(5, parent) = 0;
				end;
			end;	
		end;
	end;
end;

traverse(1);
end;
