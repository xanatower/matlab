function y = powerseries(n,a,yo)
y = yo;
for i = 0:1:n
    u = a^i;
    y = y + u;
end