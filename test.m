figure;
s = tf('s');
L1 = 2;
C1 = 2;
%C2 = 4;
R = 1/2;
omega1 = 1/sqrt(L1*C1);
Q1 = 1/(omega1*R*C1);

fprintf('Q = %f\nomega = %f\nQtest = %f\n',Q1,omega1,(R/(L1))*Q1);
H1 = (omega1)^2/(s^2 + (R/L1)*s +omega1^2);
bode(H1);
