figure;
Q1 = 1/4;
Q2 = 1/2;
Q3 = 2;
Q4 = 10;
Q5 = 1/sqrt(2);
s = tf('s');
H1 = 1/(s^2 + (1/Q1)*s + 1);
H2 = 1/(s^2 + (1/Q2)*s + 1);
H3 = 1/(s^2 + (1/Q3)*s + 1);
H4 = 1/(s^2 + (1/Q4)*s + 1);
H5 = 1/(s^2 + (1/Q5)*s + 1);

step(H1);
legend('H1');
title('Step Responses of H1,H2,H3,H4');
hold on;
step(H2);
hold on;
step(H3);
hold on;
step(H4);
hold on;
step(H5);
omega5 = 1;
omega6 = 2;
omega7 = 4;
omega8 = 8;
H5 = ((omega5)^2)/(s^2 + (omega5/2)*s + ((omega5)^2));
H6 = ((omega6)^2)/(s^2 + (omega6/2)*s + ((omega6)^2));
H7 = ((omega7)^2)/(s^2 + (omega7/2)*s + ((omega7)^2));
H8 = ((omega8)^2)/(s^2 + (omega8/2)*s + ((omega8)^2));
figure;
step(H5);
legend('H5');
title('Step Responses of H5,H6,H7,H8');
hold on;
step(H6);
hold on;
step(H7);
hold on;
step(H8);
