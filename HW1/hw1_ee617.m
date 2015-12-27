% Homework 1 - EE617
% Vy Bui
clear all  
clc
%% Problem 6
Edk2 = 4;
R = [1 0.5; 0.5 1];
Pt = [-1 1];
MSE = [];
w1 = -10:0.1:10;
for i = 1:length(w1)
    w = [0;w1(i)];
    MSE(i) = Edk2 + w'*R*w - 2*Pt*w; % MSE = E[dk^2] + wt*R*w - 2*Pt*w
end
figure, plot(w1, MSE), title('Performance function - Problem 6'), ylabel('MSE'), xlabel('w1')
hold on
[minMSE, optimum_w1_index] = min(MSE);
plot(w1(optimum_w1_index),minMSE,'o', 'MarkerEdgeColor','k', 'MarkerFaceColor','g', 'MarkerSize',10);
%% Problem 8
hold on
text(w1(optimum_w1_index) - 4, minMSE + 10, ['Optimumw1 = ' num2str(w1(optimum_w1_index))])
text(w1(optimum_w1_index) + 1, minMSE + 10, ['MSE = ' num2str(min(MSE))])
%% Problem 7
Edk2 = 4;
R = [1 0.5; 0.5 1];
Pt = [-1 1];
MSE = [];
w1 = -10:0.1:10;
for i = 1:length(w1)
    w = [1;w1(i)];
    MSE(i) = Edk2 + w'*R*w - 2*Pt*w; % MSE = E[dk^2] + wt*R*w - 2*Pt*w
end
figure, plot(w1, MSE), title('Performance function - Problem 7'), ylabel('MSE'), xlabel('w1')
hold on
[minMSE, optimum_w1_index] = min(MSE);
plot(w1(optimum_w1_index),minMSE,'o', 'MarkerEdgeColor','k', 'MarkerFaceColor','g', 'MarkerSize',10);
hold on
text(w1(optimum_w1_index) - 4, minMSE + 10, ['Optimumw1 = ' num2str(w1(optimum_w1_index))])
text(w1(optimum_w1_index) + 1, minMSE + 10, ['MSE = ' num2str(min(MSE))])
%% Problem 9
clear all
clc
N = 5;
xk = @(k) sin(2*pi*k/N);
dk = @(k) 2*cos(2*pi*k/N);
Edk2 = 0;
R11 = 0;
R12 = 0;
R22 = 0;
P11 = 0;
P12 = 0;
for i = 1:N
    Edk2 = Edk2 + dk(i)*dk(i);
    R11 = R11 + xk(i)*xk(i);
    R12 = R12 + xk(i)*xk(i-1);
    R22 = R22 + xk(i-1)*xk(i-1);
    P11 = P11 + dk(i)*xk(i);
    P12 = P12 + dk(i)*xk(i-1);
end
Edk2 = Edk2/N;
R21 = R12;
R = [R11 R12;R21 R22]/N;
Pt = [P11 P12]/N;

MSE = [];
w1 = -10:0.1:10;
for i = 1:length(w1)
    w = [0;w1(i)];
    MSE(i) = Edk2 + w'*R*w - 2*Pt*w; % MSE = E[dk^2] + wt*R*w - 2*Pt*w
end
figure, plot(w1, MSE), title('Performance function - Problem 9'), ylabel('MSE'), xlabel('w1')
hold on
[minMSE, optimum_w1_index] = min(MSE);
plot(w1(optimum_w1_index),minMSE,'o', 'MarkerEdgeColor','k', 'MarkerFaceColor','g', 'MarkerSize',10);
hold on
text(w1(optimum_w1_index) - 4, minMSE + 10, ['Optimumw1 = ' num2str(w1(optimum_w1_index))])
text(w1(optimum_w1_index) + 1, minMSE + 10, ['MSE = ' num2str(min(MSE))])








