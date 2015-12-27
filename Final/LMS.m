clear all, close all, clc
% LMS Channel Adaptation
numPoints = 10000;
numTaps = 10; % Channel order
N=32; % Number of filter coefficients.
x = randn(numPoints,1); % Input is guassian
h = [1 -1 0.89]; % Channel
h = h/max(h);   % Normalize channel
sigma2_n = 0.001; % Noise power.
mu_max = 1/(N*(sum(h.^2)+sigma2_n)); % Maximum step size 
Mu = mu_max * 0.04; % iteration step size
D = 5; % Delay factor. 
d = filter(h, D, x); % Generate desired signal.
w = [];
y = [];
in = []; 
e = []; 
w = zeros(numTaps+1,1);
% LMS for Adaptive filter
for n  = numTaps+1 : numPoints    
    in = x(n : -1 : n-numTaps) ;
    y(n) = w'*in;    
    e(n) = d(n)-y(n); % Compute error
    w = w + Mu*e(n)*in;
end
MSE = abs(e).^2; % Mean Square Error (MSE).
figure
% semilogy(abs(e));
% plot(abs(e));
plot(MSE, 'b')
title(['LMS Adaptation Learning Curve, Mu = 0.04*Mu_m_a_x']);
xlabel('Iteration Number');
ylabel('MSE');