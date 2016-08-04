
% Q2.1.6
h = 2; % h is the the distance between the centre of the wire and O 
a = .05:.05:1.95;% a is the radius of the wire
k = h./a + sqrt((h./a).^2-1); % k = r1/r2
s = ((k.^2-1)./k).*(a./2);
% s is the distance between O and the geometry centre of the charge
% distribution
plot(a,s);
xlabel('Wire radius a');
ylabel('Line charge position,s');
grid on;
axis([0 2 0 2]);