function [ypredict]=evaltree(T,xTe)
% function [ypredict]=evaltree(T,xTe);
%
% input:
% T0  | tree structure
% xTe | Test data (dxn matrix)
%
% output:
%
% ypredict : predictions of labels for xTe
%

%% fill in code here

[d,n] = size(xTe);
[~,q] = size(T);
ypredict = zeros(1,n);

for i=1:n
	xi = xTe(:, i); % dx1 matrix

	node = 1;
	while node <= q
		if T(4,node) == 0 && T(5,node) == 0
			ypredict(i) = T(1, node);
			break;
		end;

		feat = xi(T(2, node));
		cut = T(3, node);

		if (feat <= cut)
			if T(4, node) == 0
				ypredict(i) = T(1, node);
				break;
			end;
			node = T(4, node);
		else
			if T(5, node) == 0
				ypredict(i) = T(1, node);
				break;
			end;
			node = T(5, node);
		end;
	end;
end;