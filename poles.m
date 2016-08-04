
Q1 = 1/4;
Q2 = 1/2;
Q3 = 2;
Q4 = 10;

s = tf('s');
H1 = 1/(s^2 + (1/Q1)*s + 1);
H2 = 1/(s^2 + (1/Q2)*s + 1);
H3 = 1/(s^2 + (1/Q3)*s + 1);
H4 = 1/(s^2 + (1/Q4)*s + 1);

pzmap(H1);
legend('H1');
title('Poles of H1,H2,H3,H4');
hold on;
pzmap(H2);
hold on;
pzmap(H3);
hold on;
pzmap(H4);

omega5 = 1;
omega6 = 2;
omega7 = 4;
omega8 = 8;
H5 = ((omega5)^2)/(s^2 + (omega5/2)*s + ((omega5)^2));
H6 = ((omega6)^2)/(s^2 + (omega6/2)*s + ((omega6)^2));
H7 = ((omega7)^2)/(s^2 + (omega7/2)*s + ((omega7)^2));
H8 = ((omega8)^2)/(s^2 + (omega8/2)*s + ((omega8)^2));

figure;
pzmap(H5);
legend('H5');
title('Poles of H5,H6,H7,H8');
hold on;
pzmap(H6);
hold on;
pzmap(H7);
hold on;
pzmap(H8);
