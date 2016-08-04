% Q11 
% The plot for the natural response of bank loan system for two years

r = 0.05;% Monthly interest rate 
a = 1+r;

y0 = -10;% initial condition
n = 0:1:24;% months in two years
yzBL = (a.^(n+1))*y0;

stem(n,yzBL);
xlabel('n(months)');
ylabel('yzBL(account balance)');