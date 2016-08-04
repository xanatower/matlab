% Workshop Report 3

%Question 6
n_x = [0:1:14];
n_h = [-2:1:14];

x = ((1/2).^(n_x-2)).*heaviside(n_x-2);
h = heaviside(n_h+2);
y = conv(h,x);
n_conv = [n_x(1) + n_h(1):1:n_x(length(n_x)) + n_h(length(n_h))];

stem(n_conv,y);