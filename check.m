t = 0:0.00000000000001:0.00005;
y = 3.43513*exp(-3.811e8 * t) - 0.13513*exp(-1.312e10 *t);

plot(t,y);
hold on
t = 0:0.00000000000001:0.00005;
z = 3.3*exp(-(1/2.7e-9)*t);

plot(t,z);