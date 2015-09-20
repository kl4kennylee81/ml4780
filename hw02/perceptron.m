function w=perceptron(x,y);
% function w=perceptron(x,y);
%
% Implementation of a Perceptron classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
%

[d,n]=size(x);
w=zeros(d,1);
count = 0;
while (count <=100)
	m = 0;
	rand_order = randperm(n);
	for index = rand_order
		train_vector = x(:,index);
		train_label = y(:,index);
		w_after = perceptronUpdate(train_vector,train_label,w);
		if (!isequal(w,w_after))
			m = m + 1;
		end
		w = w_after;
	end
	if(isequal(m,0))
		break;
	end
	count = count + 1;
end

%% fill in code here


