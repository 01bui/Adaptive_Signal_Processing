clear all, close all, clc
% SER Channel Adaptation
numPoints = 5000;
numTaps = 10; % Channel order
N=32; % Number of filter coefficients.
x = randn(numPoints,1);
h = [1 -1 0.89]; % Channel
h = h/max(h); % Normalize channel
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

% SER for Adaptive filter
Q = 100*eye(numTaps+1);
alpha = 0.95;
for n  = numTaps+1 : 400    
    in = x(n : -1 : n-numTaps) ;
    y(n) = w'*in;    
    e(n) = d(n)-y(n); % Compute error
    S = Q*in;
    r = alpha+in'*S;
    Q = (1/alpha)*(Q - (1/r)*(S*S'));
    w = w + 2*0.05*(1-alpha^(n+1))/(1-alpha)*Q*e(n)*in;
end
MSE = abs(e).^2;  % Mean Square Error (MSE).
% hold on
% semilogy(abs(e));
% plot(abs(e));
figure
plot(MSE, 'r')
title('SER Adaptation Learning Curve');
xlabel('Iteration Number');
ylabel('MSE');
% legend('LMS', 'SER')