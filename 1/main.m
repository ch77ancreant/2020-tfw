
% Define a,b,c
a = 5;
b = 10;
c = 15;

% The length of the file: T (second)
T = 6;

% Sampling frequency: Fs (Hz)
Fs = 8000;

signal = generate_wav(a, b, c, T, Fs);
audiowrite('my_wave.wav', signal, Fs);
