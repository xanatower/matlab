% Q12
% the original recording is stored in y
% a is derived in the previous question
load group_7_echo.mat;

sound(y,Fs);
a = [1,zeros(1,4999),0.5];
z = filter(1,a,y);
plot(y);
title('The Original Sound Plot');
figure;
plot(z);
title('The Echo-cancelled Sound Plot');
save('group_7_removed.mat','z','Fs');
