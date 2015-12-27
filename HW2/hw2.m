% Vy Bui 
% Homework 2 - EE617
clear 
clc
close all
%% Problem 4
R4 = [3 2; 2 3];
eig(R4)
%% Problem 5
R5 = [3 1; 1 3];
eig(R5)
%% Problem 12
% a
[V4 Q4] = eig(R4)
% b
[V5 Q5] = eig(R5)
%% Problem 14
R = [2 1;1 3];
P = [6;4];
Edk2 = 36;
[w0,w1] = meshgrid(-5:.2:10, -5:.2:10);
for i = 1:length(w0)
    for j = 1:length(w1)
        W = [w0(i,j);w1(i,j)];
        MSE(i,j) = Edk2 + W'*R*W -2*P'*W;
    end
end
minMSE = min(MSE(:));
Wopt = inv(R)*P;
figure
[c, h] = contour(w0, w1, MSE, 10); clabel(c, h); colormap cool;
[Q, lamda] = eig(R);


