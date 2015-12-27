%% Problem 9
clc
clear
w = [0 -0.08 -0.14 -1.2 -1.3];
w = [0];
for k = 1:10
    w(k+1)=w(k)-(18*(w(k))^3+36*(w(k))^2+7*w(k)-12)/(54*(w(k))^2+72*w(k)+7);
end
w
%% Problem 11
clc
clear
R = [2 1;1 2];
P = [7;8];
w = [5;2]
for i = 1:20
    wk = w-0.1*inv(R)*(2*R*w-2*P)
    w = wk
end
%% Problem 14
clc
clear
u = 0.1;
w = [5;2];
R = [2 1;1 2];
P = [7;8];
I = [1 0;0 1];
for i = 1:5
    wk = inv(R)*P + (I-2*u*R)^i*(w - inv(R)*P)
end
wk
