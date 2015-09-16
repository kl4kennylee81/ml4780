function preds=knnclassifier(xTr,yTr,xTe,k);
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%

[indices,distances]=findknn(xTr,xTe,k);
index_labels = yTr(indices);
if (size(xTe,2) == 1)
	index_labels = index_labels';
end
preds = mode(index_labels,1);
[val,freq,cells] = mode(index_labels,1);
num_modes = sum(cellfun(@length,cells),2);
smaller_k = k;







%% fill in code here

