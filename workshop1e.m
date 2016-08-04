% Task 2(b)
% create and plot the epllisoid
% XC = 0, YC = 0, ZC = 0, XR = 1,YR = 1, ZR = 2, N = 50
[xx,yy,zz] = ellipsoid(0,0,0,1,1,2,50);
Fxx = 2*xx;
Fyy = 2*yy;
Fzz = zz/2;
figure(11);
surfl(xx,yy,zz);
axis([-2 2 -2 2 -2 2]);
% Task 2(d)
x = -2:.5:2;
y = x ;z = x;
[xxnew,yynew,zznew] = meshgrid(x,y,z);
Fxxnew = 2*xxnew;
Fyynew = 2*yynew;
Fzznew = 0.5*zznew;
figure (12);
quiver3(xxnew,yynew,zznew,Fxxnew,Fyynew,Fzznew);
% Task 2(e)
[xx3,yy3,zz3] = ellipsoid(0,0,0,1,1,2,20);
Fxx3 = 2*xx3;
Fyy3 = 2*yy3;
Fzz3 = zz3/2;
figure(13);
quiver3(xx3,yy3,zz3,Fxx3,Fyy3,Fzz3);
axis([-2 2 -2 2 -2 2]);
% Task 2(f)
[xx2,yy2,zz2] = ellipsoid(0,0,0,1,1,2,10);
Fxx2 = 2*xx2;
Fyy2 = 2*yy2;
Fzz2 = zz2/2;
figure(11);
hold on;
quiver3(xx2,yy2,zz2,Fxx2,Fyy2,Fzz2);
axis([-2 2 -2 2 -2 2]);

% Question:
% What is the key difference between this plot and the one obtained in
% (d)?
% Answer:
% The plot obtained in (d) shows gradient of each point in a cube defined 
% by xxnew,yynew and zznew
% while the plot obtained in (f) shows gradient of each point 
% on the surface of a ellpoid 
