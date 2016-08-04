nx = -2;
Nx = 1;
nh = 0;
Nh = 5;
n = [(nx+nh):1:(Nx+Nh)];
x = ones(1,length(-1:1:2));
h = [0,1,2,3,4,5];

ny = conv(h,x);
stem(n,ny);
axis([-3 7 0 16]);