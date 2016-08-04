% This MATLAB command sequence is designed to plot an electric field which
% is defined as r^2/(4*epsilon_r*epsilon_o) in side the shpere and
% a^4/(4*epsilon_o*r^2) outside the shpere. The original equations are
% wriiten in spherical coordinate system. The first step of ploting the
% vector field is converting the shperical system to rectangular one, using
% formulae proved in previous questions. Next step is to define the vector
% field with two parts. The first part is when electric field is inside the
% sphere and the second part is when electric field is outside the shpere.
% Finally, quiver3 command is used to plot the complete electric field in
% the dimension defined by the first four lines in this file.

theta = (0:0.25:1)*pi;
phi = (0:0.25:2)*pi;
r = [0:.2:.8 1:.5:3];
[tt,pp,rr] = meshgrid(theta,phi,r);
% Meshgrid creates a coordinate system which is defined by theta, phi and
% r;
xx = rr.*sin(tt).*cos(pp);
yy = rr.*sin(tt).*sin(pp);
zz = rr.*cos(tt);
% The magnitude of rr,tt and pp which are in spherical coordinate are 
% converted to xx, yy,zz whcih are in rectangular coordinate;
xxt = sin(tt).*cos(pp);
yyt = sin(tt).*sin(pp);
zzt = cos(tt);
%xxt,yyt,zzy define the direction of unit vectors r in rectangular 
% coordinate in terms of theta, phi and r.
epsilon = 8.854187*10^-12; % permittivity
a = 1; % (radius) unit: mm
Exx = zeros(size(xx));
Eyy = zeros(size(yy));
Ezz = zeros(size(zz));
for i = 1:1:length(xx(:,1,1))% size of radius
    for j = 1:1:length(xx(1,:,1)) % size of theta
        for k = 1:1:length(xx(1,1,:))% size of phi
            if rr(i,j,k) >= 0 && rr(i,j,k) <= 1
                Exx(i,j,k) = ((rr(i,j,k)^2)/(4*epsilon))*xxt(i,j,k);
                Eyy(i,j,k) = ((rr(i,j,k)^2)/(4*epsilon))*yyt(i,j,k);
                Ezz(i,j,k) = ((rr(i,j,k)^2)/(4*epsilon))*zzt(i,j,k);
                % under this if statement, the electric field inside the
                % sphere is defined (in rectangular coordinate);
            elseif rr(i,j,k) > 1;
                Exx(i,j,k) = a^4/((rr(i,j,k)^2)*4*epsilon)*xxt(i,j,k);
                Eyy(i,j,k) = a^4/((rr(i,j,k)^2)*4*epsilon)*yyt(i,j,k);
                Ezz(i,j,k) = a^4/((rr(i,j,k)^2)*4*epsilon)*zzt(i,j,k);
                % under this elseif statement, the electric field out side
                % the sphere is defined (in rectangular coordinate);
            end
        end
    end
end
quiver3(xx,yy,zz,Exx,Eyy,Ezz,0.5);
% plot the electric field 
axis([-3 3 -3 3 -3 3]);
grid on;
xlabel('x');ylabel('y');zlabel('z');