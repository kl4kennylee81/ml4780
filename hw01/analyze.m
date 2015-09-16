function output=analyze(kind,truth,preds)	
% function output=analyze(kind,truth,preds)		
%
% Analyses the accuracy of a prediction
% Input:
% kind='acc' classification error
% kind='abs' absolute loss
% (other values of 'kind' will follow later)
% 

switch kind
	case 'abs'
		% compute the absolute difference between truth and predictions
		output = mean(abs(preds-truth));
		
	case 'acc'
		difference = preds-truth;
		num_wrong = nnz(difference);
		num_el = numel(difference);
		output = (num_el-num_wrong)/num_el;
end;

