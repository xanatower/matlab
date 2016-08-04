t = [0:1/8000:8191/8000];
x = sin(2*pi*100*t + 2*pi*100*(t.*t));
xfft = fft(x);
xfftm = abs(fft(x)); 
f1 = (0:length(t)-1)*0.9766;
f2 = (-4096:(length(t)-4097))*0.9766;
figure;
plot(f1,xfftm);
figure;
plot(f2,xfftm);
title('shifted');
figure;
plot(f1,fftshift(xfftm));
title('fftshifted');
figure;
plot(f2,fftshift(xfftm));
y = x.*sin(2*pi*1000*t);
z = y.*sin(2*pi*1000*t);
yfftm = abs(fft(y));
figure;
plot(f2,fftshift(yfftm));
zfftm = abs(fft(z));
figure;
plot(f2,fftshift(zfftm));


[B,A] = butter(10,0.25);
zfiltered = filter(B,A,z);
zfilteredm = abs(fft(zfiltered));
figure;

plot(f2,fftshift(zfilteredm));