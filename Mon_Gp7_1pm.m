% Q5 Use dlsim and your state representation to plot the zero input
% response of the system for 10 month

% the state representation: A,B,C,D
A = [0 1 ;1 1];
B = [0;0];
C = [1,0];
D = 0;

% V input sequence
% X0 the initial condition of the system

V = [0,zeros(1,10)];
X0 = [1;1];

[Yzi,Xzi] = dlsim(A,B,C,D,V,X0);

stem([0:10],Yzi);

xlabel('month(n)');
ylabel('poplulation of rabbits');
title('The zero input response of the rabbit popluation system');

% Q18
% Use dlsim to plot the system response y[n] in Question 17
A = [0 1 ;1 1];
Bzs = [0;1];
C = [1,0];
D = 0;
X0zs = [0;0];
Vzs = [1,ones(1,10)];

[Yzs,Xzs] = dlsim(A,Bzs,C,D,Vzs,X0zs);

figure;
stem([0:10],Yzs);

xlabel('month(n)');
ylabel('poplulation of rabbits');
title('The zero state response of the rabbit popluation system');

% Q23
% Use lsim to plot the system response y(t) in Question 22.
%A = [0 1;-2 -2];
%B = [0;2];
%C = [1,0];
%D = 0;
Arlc = [1i-1 0;0 -1-1i];
Brlc = [-1i;1i];
Crlc = [1 1];
Drlc = 0;

sys = ss(Arlc,Brlc,Crlc,Drlc);
T = [0:0.01:10];
V = ones(1,length(T));

X0 = [0.5*(-1+1i),0.5*(-1-1i)];
%X0 = [1,0];
[Yrlc,Xrlc] = lsim(sys,V,T,X0);
figure;
plot(T,Yrlc);
xlabel('t(s)');
ylabel('System Response');
