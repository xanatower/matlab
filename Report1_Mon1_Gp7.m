% Workshop Report 1
% Monday 1 pm
% Group 3: Sijie Liu, Didi Chi, Mun Hoe Wong

% Q3
% the natural response of the system
R = 1000; % Resistor
C = 100*10^-6; % Capacitor
v0 = 1; % the initial condition of the system
t = 0:0.0001:1;% time

yzRC = v0 * exp(-1/(R*C)*t);

plot(t,yzRC);
xlabel('t(s)');
ylabel('voltage across capacitor(V)');

% Q11 
% The plot for the natural response of bank loan system for two years
figure;
r = 0.05;% Monthly interest rate 
a = 1+r;

y0 = -10;% initial condition
n = 0:1:24;% months in two years
yzBL = (a.^(n))*y0;

stem(n,yzBL);
xlabel('n(months)');
ylabel('yzBL(account balance)');

% Q16
% the step response of the system
figure;

Vs = 2;% the constant input of the system
ysRC = Vs - Vs *exp(-1/(R*C)*t);
plot(t,ysRC);
xlabel('t(s)');
ylabel('voltage cross the capacitor(V)');


% Q22
% The plot for the step response of bank loan system for two years
figure;
ysBL = (a.^(n+1)-1)./r;
stem(n,ysBL);
xlabel('n(months)');
ylabel('ysBL(account balance)');