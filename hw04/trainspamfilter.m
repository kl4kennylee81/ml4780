function trainspamfilter(xTr,yTr);
%function trainspamfilter(xTr,yTr);
% INPUT:	
% xTr
% yTr
%
% NO OUTPUT

[d,n]=size(xTr);

lambda = 0.1;
% Feel free to change this code any way you want
hing=@(w) hinge(w,xTr,yTr,lambda);
logis=@(w) logistic(w,xTr,yTr);
ridge=@(w) ridge(w,xTr,yTr,lambda);


% Feel free to change this code any way you want
% f=@(w) ridge(w,xTr,yTr,1);

w0=zeros(size(xTr,1),1); % initialize with all-zeros vector
w_h=grdescent(hing,w0,1e-03,5000)
w_l=grdescent(logis,w0,1e-03, 10000);
w_r=grdescent(ridge,w0,1e-03, 5000);
 
% w = (w_r)/norm(w_r) + (w_h)/norm(w_h)
w = (0.1)*(w_r / norm(w_r)) + (0.70)*(w_l / norm(w_l)) + (0.2)*(w_h / norm(w_h)); 
% w = w_l;

save('w0','w');