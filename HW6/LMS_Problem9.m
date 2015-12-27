clc; close all; clear all;
w(:,1) = [0 0]';
mu = 1/5;
I = 500;
N = 5;
%LMS Method
j = [1:I];
    x = sin(pi*j/N);
    xd = [0 x(1:I-1)];
    XX = [x;xd];
for i = 2:I
    X = XX(:,i-1);
    e = sin(pi*(i-1)/N)-X'*w(:,i-1);
    w(:,i) = w(:,i-1) + 2*mu*e.*X;
    w0 = w(1,i);
    w1 = w(2,i);
    MSE(i) = 0.5*w0^2+w1^2*0.5*sin(pi/N)+w0*w1*(0.5+0.5*sin(pi/N))-2*(w0*0.5*sin(pi/N)+w1*sin(2*pi/N)+0.5);
end
MSE(1:19)
