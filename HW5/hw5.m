%% Problem 2
clear, clc, close all;
MSE = [];
w = -10:0.1:10;
for i = 1:length(w)
    MSE(i) = 5*w(i).^2-20*w(i)+23;
end
figure, plot(w, MSE), title('Performance function - Problem 2'), ylabel('MSE'), xlabel('w')
hold on
[minMSE, optimum_w_index] = min(MSE);
plot(w(optimum_w_index),minMSE,'o', 'MarkerEdgeColor','k', 'MarkerFaceColor','g', 'MarkerSize',10);
hold on
text(w(optimum_w_index) - 4, minMSE + 10, ['Optimumw1 = ' num2str(w(optimum_w_index))])
text(w(optimum_w_index) + 1, minMSE + 10, ['MSE = ' num2str(min(MSE))])

%%P8
mu=2;sigma2=0.333;
fun=@(x) (x.^4).*(1/sqrt(2*pi*sigma2)).*exp((-(x-mu).^2)./(2*sigma2))
q=integral(fun,-Inf,Inf)