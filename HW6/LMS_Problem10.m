clc 
close all
clear all;
I(1) = 0;
x(1) = 0; 
J = 1;
N = 5000;
for k = 1:N
    I(k + 1) = mod((J*I(k) + 1),N - 1);
    r(k + 1) = rand_seq(I(k));
    x(k + 1) = 0.95*(r(k + 1)-0.5)+0.05*x(k);
end
% Estimate R
C = cov(x'*x);
mu = mean(x'*x);
R = C + mu'*mu;
R = R(2:end,2:end); 
% Choose u
u = 1/sum(diag(R(1:100,1:100)));
u = u/10;
% LMS
w(:,1) = [0 0]';
I = 5000;
mu = u;
%LMS Method
j = [1:I];
    x = x(j);
    xd = [0 x(1:I-1)];
    XX = [x;xd];
for i = 2:I
    X = XX(:,i-1);
    e = x(i-1)-X'*w(:,i-1);
    w(:,i) = w(:,i-1) + 2*mu*e.*X;
    w0(i) = w(1,i);
    w1(i) = w(2,i);
end
figure
k = 1:5000;
plot(k, w(1,:), 'r',  k, w(2,:), 'b')
title('w0k and w1k, vs. k iteration')
xlabel('k, Iteration')
ylabel('w0k and w1k')
legend('w0k','w1k')
% Learning curve LMS
for i = 1:length(w)
    w = [w0(i);w1(i)];
    MSE(i) = Edk2 + w'*R*w - 2*Pt*w; % MSE = E[dk^2] + wt*R*w - 2*Pt*w
end
figure
k = 2:I;
plot(k,(MSE(2:I)))
title('Learning curve LMS Exercise 10 chapter 6')
xlabel('k, Iteration')
ylabel('Mean squared error');