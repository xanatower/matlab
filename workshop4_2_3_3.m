% Q2.3.3
% All the equations are derived from previous questions
a = 1; h = 2;
k = h/a + sqrt((h/a)^2-1); s = (k^2-1)/k*a/2; 
x = -4:.25:4; y = x;
[xx,yy] = meshgrid(x,y);
outofleftcirc = ((xx+h).^2 + yy.^2 - a*a)>=0; 
outofrightcirc = ((xx-h).^2 + yy.^2 - a*a)>=0; 
cc = outofleftcirc.*outofrightcirc;
den = ((s-xx).^2 + yy.^2).*((s+xx).^2 + yy.^2);
numxx = s*(s^2 - xx.^2 + yy.^2);
numyy=-2*xx.*yy.*s;
Exx = -numxx./den.*cc;
Eyy = -numyy./den.*cc;
figure(1);
quiver(xx,yy,Exx,Eyy);
xlabel('x'); ylabel('y');
grid on;