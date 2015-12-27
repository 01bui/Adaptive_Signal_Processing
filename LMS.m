clc; close all; clear all;

w(:,1) = [0 0]';
mu = 0.05;
I = 500;
N = 16;
varn = 0.01;
fi = varn;

%LMS Method
j = [1:I];
    x = sin(2*pi*j/N)+randn(1,I).*sqrt(varn);
    xd = [0 x(1:I-1)];
    XX = [x;xd];
for i = 2:I
    X = XX(:,i-1);
    e = 2*cos(2*pi*(i-1)/N) - X'*w(:,i-1);
    w(:,i) = w(:,i-1) + 2*mu*e.*X;
end

scatter(w(1,:),w(2,:),'filledd','r')
xlim([-2 8]); ylim([-10 0])
hold on

[w0 w1] = meshgrid(-2:.2:8,-10:.2:0);
zeta = (0.5+fi)*(w0.^2+w1.^2)+w0.*w1.*cos(2*pi/N)+2*w1.*sin(2*pi/N)+2;
[C,h] = contour(w0,w1,zeta,0:5:20);
set(h,'ShowText','on','LabelSpacing',500)
title('LMS Method');
xlabel('w0')
ylabel('w1')
hold on

R = .5*[1+2*fi cos(2*pi/N);cos(2*pi/N) 1+2*fi];
P = [0 -sin(2*pi/N)];
wopt = inv(R)*P';
scatter(wopt(1,:),wopt(2,:),'filled','g')
hold on

w(:,1) = [4 -10]';

for i = 2:I
    X = XX(:,i-1);
    e = 2*cos(2*pi*(i-1)/N)-X'*w(:,i-1);
    w(:,i) = w(:,i-1) + 2*mu*e.*X;
end

scatter(w(1,:),w(2,:),'filled','b')