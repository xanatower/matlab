he = [1,zeros(1,4999),0.5];

d = [1 zeros(1,20000)];
b = 1;
a = [1,zeros(1,4999),0.5];

her = filter(b,a,d);

stem((0:20000),her);

hoa = conv(her,he);
figure;
stem([0:25000],hoa);

