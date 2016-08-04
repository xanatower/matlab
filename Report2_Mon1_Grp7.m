Vs = 2;
y0 = 1;
R = 1000;
C = 100*10^(-6);
t = 0:0.0001:1;
yoRC = Vs - (Vs- y0)*exp((-1/(R*C)).*t);
plot(t,yoRC);



figure;

n = 0:1:24;
r = 0.05;
yo = -10;
a = 1 + r;
yoBL = (a.^n)*yo + (1-a.^(n+1))/(1-a);
stem(n,yoBL);