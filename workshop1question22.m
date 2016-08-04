

% Q22 
% The plot for the step response of bank loan system for two years
figure;

n2 = [0:1:24];% n represents months in two years
yo = 0;% The initial condition is zero

r = 0.05;% Monthly interest rate is %5 
a = 1+r;
ysBL = zeros(size(n2));

for n = 0:1:24
ysBL(n+1) = powerseries(n,a,yo);
end

stem(n2,ysBL);
xlabel('n(month)');
ylabel('ysBL(account balance)');
