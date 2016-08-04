% This MATLAB command sequence is designed to plot a magnetic field which
% is defined as I*r^2/(2*pi*a^3) in side the cylinder and
% I/(2*pi*r) outside the cylinder. The original equations are
% wriiten in cylindrical coordinate system. The first step of ploting the
% vector field is converting the cylindrical system to rectangular one, 
% using formulae proved in previous workshop. Next step is to define the 
% vector field with two parts. The first part is when magnetic field 
% is inside the cylinder and the second part is when magnetic field 
% is outside the cylinder.Finally, quiver3 command is used to plot 
% the complete magnetic field in the dimension defined by the first four 
% lines in this file.

phi = (0:0.25:2)*pi;
z = -2:1:2;
r = [0:.2:.8 1:.5:3];
[pp,zz,rr] = meshgrid(phi,z,r);
% Meshgrid creates a coordinate system which is defined by phi, z and
% r;
xx = rr.*cos(pp);
yy = rr.*sin(pp);
% The magnitude of rr,tt and pp which are in cylindrical coordinate are 
% converted to xx, yy,zz whcih are in rectangular coordinate;
% The z dimension in cylindrical coordinates is the same as that in
% rectangular, therefore, there is no need to do the convertion on z 
xxn = -sin(pp);
yyn = cos(pp);
% xxn and yyn define the compositions of the direction of unit vector phi
% in x and y directions in terms of phi.
Bxx = zeros(size(xx));
Byy = zeros(size(yy));
Bzz = zeros(size(zz));
for i = 1:1:length(xx(:,1,1))  
    for j = 1:1:length(xx(1,:,1))
        for k = 1:1:length(xx(1,1,:))
            if rr(i,j,k) >= 0 && rr(i,j,k) <= 1
                Bxx(i,j,k) = ((rr(i,j,k)^2)/(2*pi))*(xxn(i,j,k));
                Byy(i,j,k) = ((rr(i,j,k)^2)/(2*pi))*(yyn(i,j,k));
                % under this if statement, the magnetic field inside the
                % cylinder is defined (in rectangular coordinate);
            else
                Bxx(i,j,k) = (1/(2*pi*rr(i,j,k)))*(xxn(i,j,k));
                Byy(i,j,k) = (1/(2*pi*rr(i,j,k)))*(yyn(i,j,k));
                % under this else statement, the magnetic field outside the
                % cylinder is defined (in rectangular coordinate);
            end
        end
    end
end
quiver3(xx,yy,zz,Bxx,Byy,Bzz,0.5);
% Plot the magnetic field
axis([-3 3 -3 3 -2 2]);
xlabel('x');ylabel('y');zlabel('z');