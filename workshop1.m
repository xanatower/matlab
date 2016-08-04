% Workshop1 3/8/2015 Monday 9:00 am Visualizing vector field using MATLAB
% Qingyuan YANG(740959)
% Didi Chi(683820)

% Task 1(a)
x = -2:.05:2;
y = -2:.05:2;
[xx,yy] = meshgrid(x,y);
% meshgrid creates a plane with x-axis defined by x and y-axis defined by
% y
size(xx)
size(yy)

% Task 1(b)
zz = xx.^2 + 2*yy.^2; 
figure(1);
surfl(xx,yy,zz);
xlabel('x');
ylabel('y');
zlabel('Function f(x,y)'); 
grid on;
% Question:
% Compare the plotted surface with that included in the lecture notes.
% Answer:
% It is the same surface plot as the plot on Lecture slide Topic 4 page 16

% Task 1(c) 
% Question:
% By selecting c = 1 (for example), 
% what shape do you expect the contours of f to take?
% Answer:
% Ellipse is expected to be the shape of the contour

% Task 1(d) Plot the contours of f in a separate figure.
figure(2);
contour(xx,yy,zz,20);
% Question:
% What is the purpose of the last argument '20' in the contour command
% Answer:
% 20 indicates the number of contour plotted by this command
xlabel('x');
ylabel('y');
grid on;
% Task 1(e)
fxx = 2*xx; fyy = 4*yy; 
% fxx is the gradient in x direction 
% fyy is the gradient in y direction
figure(3); 
quiver(xx,yy,fxx,fyy); 
% Question: What is the problem with this plot?
% Answer: The increments of xx and yy are too small, 
% therefore there are too many points on the plane.
% This makes each gradient label on each point 
% too small to see

% Task 1(f)
xnew = -2:.25:2;
ynew = xnew;
[xxnew, yynew] = meshgrid(xnew,ynew);
% meshgrid creates a new plane with less points defined than the previous 
% one
fxxnew = 2*xxnew;
fyynew = 4*yynew;
figure(4);
quiver(xxnew,yynew,fxxnew,fyynew);
% Question:
% Does this help the problem seen in the previous part?
% Answer:
% Yes. 

% Task 1(g) 
% overlay this vector field plot on top of the earlier contour plot.
figure(2);
hold on;
quiver(xxnew,yynew,fxxnew,fyynew);
% Question:
% By inspection of the overlaid plot obtained, 
% what is the relationship between 
% the gradient vector field and the contours?
% Answer:
% The gradient vector field is normal to the contours.