function [r,ok,s]=hw05tests()
% function [r,ok,s]=hw05tests()
%
% Tests the functions from homework assignment 5
% Please make sure that the error statements are instructive. 
%
% Output: 
% r=0 number of tests that broke
% ok= number of passed tests, max = 8
% s= statement describing the failed test (s={} if all succeed)
%


% initial outputs
r=0;
ok=0;
s={};


% data set
global Nsmall Nbig NMODELS OFFSET;
NMODELS=1000; % how many models do you want to average over
LAMBDA=2^-6; % What regularization constants to evaluate
SIGMA=4; % what is the kernel width?

% test with two far away Gaussians #1
Nsmall=5; % how big is the training set size N
OFFSET=50;   % offset between the two Gaussians

% test data with size 2*5
xTe =  [49.308783, 1.705462, 51.192402, 0.205998, 50.853083;
        49.620651, 1.885418, 50.256330, -0.089885, 51.833237];
yTe =   [2, 1, 2, 1, 2];


	
%% Estimate AVERAGE ERROR (TOTAL)
total=0;
for j=1:NMODELS
    [xTr2,yTr2]=toydata(OFFSET,Nsmall);        
    fsmall=kregression(xTr2,yTr2,SIGMA,LAMBDA);
    total=total+mean((fsmall(xTe)-yTe).^2);
end;
total=mean(total)/NMODELS;


%% testing computeybar.m
ybar=computeybar(xTe);
noise=mean((yTe-ybar).^2);
if noise != 0,
	r=r+1;				
	s{length(s)+1}='#1 computeybar is not correct. Two far away Gaussians should have no noise';
else
	ok=ok+1;
end;


%% testing computehbar.m
hbar=computehbar(xTe,SIGMA,LAMBDA);
bias=mean((hbar-ybar).^2);
if abs(bias - 0.114) > 0.01;
	r=r+1;				
	s{length(s)+1}='#1 computehbar is not correct. The bias in this setting should be around 0.114';
else
	ok=ok+1;
end;


%% testing computevariance.m
variance=computevariance(xTe,SIGMA,LAMBDA,hbar);
if abs(variance - 0.054) > 0.01;
	r=r+1;				
	s{length(s)+1}='#1 computevariance is not correct. The variance in this setting should be around 0.054';
else
	ok=ok+1;
end;


difference = total - noise - bias - variance;
if abs(difference) > 0.01;
	r=r+1;				
	s{length(s)+1}='#1 noise + bias + variance != error';
else
	ok=ok+1;
end;





%% test with another distribution #2
OFFSET = 3;
Nsmall = 7;

% test data with size 2*7
xTe =  [0.45864, 2.44662, 1.00345, -0.10560, 3.07264, 3.13035, 2.25265;
        0.71552, 1.68167, 0.15182, -0.48155, 3.81535, 2.72151, 3.78697];
yTe =  [1, 2, 1, 1, 2, 2, 2];

%% Estimate AVERAGE ERROR (TOTAL)
total=0;
for j=1:NMODELS
    [xTr2,yTr2]=toydata(OFFSET,Nsmall);        
    fsmall=kregression(xTr2,yTr2,SIGMA,LAMBDA);
    total=total+mean((fsmall(xTe)-yTe).^2);
end;
total=mean(total)/NMODELS;

%% testing computeybar.m
ybar=computeybar(xTe);
noise=mean((yTe-ybar).^2);
if noise > 0.001,
	r=r+1;				
	s{length(s)+1}='#2 computeybar is not correct. The noise should be less than 10^-3 in this distribution';
else
	ok=ok+1;
end;

%% testing computehbar.m
hbar=computehbar(xTe,SIGMA,LAMBDA);
bias=mean((hbar-ybar).^2);
if abs(bias - 0.01) > 0.001;
	r=r+1;				
	s{length(s)+1}='#2 computehbar is not correct. The bias in this setting should be around 0.01';
else
	ok=ok+1;
end;

%% testing computevariance.m
variance=computevariance(xTe,SIGMA,LAMBDA,hbar);
if abs(variance - 0.034) > 0.005;
	r=r+1;				
	s{length(s)+1}='#2 computevariance is not correct. The variance in this setting should be around 0.034';
else
	ok=ok+1;
end;


difference = total - noise - bias - variance;
if abs(difference) > 0.01;
	r=r+1;				
	s{length(s)+1}='#2 noise + bias + variance != error';
else
	ok=ok+1;
end;


