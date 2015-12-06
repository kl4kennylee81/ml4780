function F=forest(x,y,nt)
% function F=forest(x,y,nt)
%
% INPUT:
% x | input vectors dxn
% y | input labels 1xn
%
% OUTPUT:
% F | Forest
%
[d, n] = size(x);
all_index = (1:n);
for i=1:nt
	%select n with replacement
	rand_index = randsample(all_index,n,true,[]);
	xTr_rand = x(:,rand_index);
	yTr_rand = y(rand_index);
	F{i} = id3tree(xTr_rand,yTr_rand);
end;
end;
%% fill in code here