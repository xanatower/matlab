% Task 1(h)
x = -2:.05:2;
y = -2:.05:2;
[xx,yy] = meshgrid(x,y);
% meshgrid creates a plane with x-axis defined by x and y-axis defined by
% y
zz = xx.^2 + 2*yy.^2;
figure(5);
contour(xx,yy,zz,20);
% Plot the contour of the plane
xlabel('x');
ylabel('y');

xnew = -2:.25:2;
ynew = xnew;
[xxnew,yynew] = meshgrid(xnew,ynew);

grid on;
fxxnew = 2*yynew;
fyynew = -xxnew;
% fxxnew and fyynew define the tangent vector to any contour
figure(5);
hold on;
quiver(xxnew,yynew,fxxnew,fyynew);
% plot the tangent vectors of any contour on the plane.

