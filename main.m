%% Main of the FastKDE Analysis
clear variables;
close all;
clc
%% Parameters
n=10^4;         % Number of events
m=2^5;         % Number of estimation points
div=2^1;          % Number of matrix divisions
d=1;            % Number of dimensions
f=1;            % Smoothness Parameter (Keep it that way)

% Distribuition Parameters
mu=0;
sigma=0.25;
X=[-1:0.01:1];
Y = normpdf(X,mu,sigma);

%% Random Gaussian Distribuition
A = normrnd(mu,sigma,n,d);

%% FLAGS PLOTS
flagplot.hist=1;

[x1f,pdf1f]=fastKDE(A,m,f,div,'fix');      % Our Implementation Fast

[x1v,pdf1v]=fastKDE(A,m,f,div,'variable');      % Our Implementation Fast


if flagplot.hist==1
    figure
    plot(X,Y,'k','DisplayName','Analytic PDF')
    hold on
    plot(x1f,pdf1f,'*r','DisplayName','FastKDEf')
    plot(x1v,pdf1v,'*g','DisplayName','FastKDEv')
    axis tight
end