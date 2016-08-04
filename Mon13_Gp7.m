% Workshop Report 4
% Monday 13 pm
% Group 7: Sijie Liu, Didi Chi, Mun Hoe Wong

% Q3
% construct a chirp signal x defined by
t = [0:1/8000:8191/8000];
x = sin(2*pi*100*t + 2*pi*100*(t.*t));
% xfft is the DFT of signal x
xfft = fft(x);
% xfftm is the magnitude of xfft
xfftm = abs(fft(x)); 
% convert the unit of horizontal axis to Hz by using equation (7)
% the horizontal axis should vary in frequency from 0 to 8000 Hz
f1 = (0:length(t)-1)*0.9766;
figure ;
plot(f1,xfftm);
title('Question 3 DFT of x');
xlabel('Frequency(Hz)');
ylabel('Magnitude');

% Q4 
% Manipulate the result of the fft function to yield a plot of the DFT of
% the chirp where the horizontal axis is -4000 Hz to 4000 Hz
f2 = (-4096:(length(t)-4097))*0.9766;
xfftm2 = fftshift(xfftm);
figure ;
plot(f2,xfftm2);
title('Question 4 shifted DFT of x');
xlabel('Frequency(Hz)');
ylabel('Magnitude');

% Q5 
% Multiply the above chirp signal by a sinusoidal wave with frequency 1kHz
y = x.*sin(2*pi*1000*t);
yfft = fft(y);
yfftm = fftshift(abs(yfft));
figure ;
plot(f2,yfftm);
title('Question 5 Modulation');
xlabel('Frequency(Hz)');
ylabel('Magnitude');

% Q6 
% demodulate the modulated signal in the previous question by multiplying
% again with a sinusoidal wave with frequency 1kHz
z = y.*sin(2*pi*1000*t);
zfftm = fftshift(abs(fft(z)));
figure;
plot(f2,zfftm);
title('Question 6 Demodulation');
xlabel('Frequency(Hz)');
ylabel('Magnitude');

% Q7
% design the filter to get the demodulated signal more similar to the
% original signal
% the lower frequency content is desirable so that the higher frequency
% should be filtered out
% the majority frequency component  of the signal after filtering should
% varies from -1000Hz to 1000 Hz, which should be the same as the original
% signal. This range of frequency is 1/4 of the whole frequency range of
% the signal being filtered.
% therefore the cutoff frequency of the filter is chosen to be 0.25
[B,A] = butter(10,0.25);
zfiltered = filter(B,A,z);
zfilteredm = fftshift(abs(fft(zfiltered)));
figure;
plot(f2,zfilteredm);
title('Question 7 Filtered Demodulation');
xlabel('Frequency(Hz)');
ylabel('Magnitude');


% Q14 
% According to the answer derived from Q13, 
% poles location are 1, (1+sqrt(5))/2 and (1-sqrt(5))/2
% They were put into a vector P = [1,(1+sqrt(5))/2,(1-sqrt(5))/2]
% residues are -1, 2/(5-sqrt(5)),2/(sqrt(5)+5)
% They were put into a vector R = [-1, 2/(sqrt(5)-5),2/(sqrt(5)+5)]
% Because there were no constant terms, K is a zero vector [0,0,0]

% Vectors B and A specify the coefficients of the numerator and
% denominator polynomials in descending powers of z.

R = [-1, 2/(5-sqrt(5)),2/(sqrt(5)+5)];
P = [1,(1+sqrt(5))/2,(1-sqrt(5))/2];
K = [0,0,0];
[B,A] = residue(R,P,K);




