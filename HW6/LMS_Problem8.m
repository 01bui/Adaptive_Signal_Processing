clc; close all; clear all;

w(:,1) = [0 0]';
mu = 0.05;
I = 2000;
N = 7;

%LMS Method
j = [1:I];
    x = cos(pi*j/N);
    xd = [0 x(1:I-1)];
    XX = [x;xd];
for i = 2:I
    X = XX(:,i-1);
    e = sin(pi*(i-1)/N)-X'*w(:,i-1);
    w(:,i) = w(:,i-1) + 2*mu*e.*X;
    w0 = w(1,i);
    w1 = w(2,i);
    MSE1(i) = 0.5*(w0^2+w1^2)+w0*w1*cos(pi/N)-w1*sin(pi/N)+0.5;
end
figure
scatter(w(1,:),w(2,:),'filled','b')
hold on
[w0 w1] = meshgrid(-10:.2:8,-5:.2:10);
zeta = 0.5*(w0.^2+w1.^2)+w0.*w1*cos(pi/N)-w1.*sin(pi/N)+0.5;
[C,h] = contour(w0,w1,zeta,0:5:20);
set(h,'ShowText','on','LabelSpacing',500)
title('LMS Method');
xlabel('w0')
ylabel('w1')
hold on
R = [0.5 0.5*cos(pi/N);0.5*cos(pi/N) 0.5];
P = [0 sin(pi/N)];
wopt = inv(R)*P';
scatter(wopt(1,:),wopt(2,:),'filled','g')

w(:,1) = [0 0]';
mu = 0.005;
for i = 2:I
    X = XX(:,i-1);
    e = sin(pi*(i-1)/N)-X'*w(:,i-1);
    w(:,i) = w(:,i-1) + 2*mu*e.*X;
    w0 = w(1,i);
    w1 = w(2,i);
    MSE2(i) = 0.5*(w0^2+w1^2)+w0*w1*cos(pi/N)-w1*sin(pi/N)+0.5;
end
% Learning curve LMS
figure
k = 2:I;
plot(k,(MSE1(2:I)), k,(MSE2(2:I)))
title('Learning curve')
xlabel('Interation, k')
ylabel('MSE');

figure
scatter(w(1,:),w(2,:),'filled','b')
hold on
[w0 w1] = meshgrid(-10:.2:8,-5:.2:10);
zeta = 0.5*(w0.^2+w1.^2)+w0.*w1*cos(pi/N)-w1.*sin(pi/N)+0.5;
[C,h] = contour(w0,w1,zeta,0:5:20);
set(h,'ShowText','on','LabelSpacing',500)
title('LMS Method');
xlabel('w0')
ylabel('w1')
hold on
R = [0.5 0.5*cos(pi/N);0.5*cos(pi/N) 0.5];
P = [0 sin(pi/N)];
wopt = inv(R)*P';
scatter(wopt(1,:),wopt(2,:),'filled','g')





