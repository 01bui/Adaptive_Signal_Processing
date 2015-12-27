clear 
clc
R = [2 1;1 2];
P = [7;8];
Edk2 = 4^2;
[w0,w1] = meshgrid(-5:.2:10, -5:.2:10);
for i = 1:length(w0)
    for j = 1:length(w1)
        W = [w0(i,i);w1(j,j)];
        Z(i,j) = Edk2 + W'*R*W -2*P'*W;
    end
end
Wopt = inv(R)*P;
[c, h] = contour(w0, w1, Z, 10); clabel(c, h); colormap cool;
[Q, lamda] = eig(R);