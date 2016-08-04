x = [1,zeros(1,5000)];
b = [1,zeros(1,4999),0.5];
he = filter(b,1,x);
stem((0:5000),he);
 