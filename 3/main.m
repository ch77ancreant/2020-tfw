
% The signal that will be transformed
[z, fs] = audioread('Chord.wav');
x = z(:, 1);

% delta t and delta f
dt = 0.01;
df = 1;

% Define input
sgm = 200;
tau = (0:length(x)-1)/fs;
t = 0:dt:max(tau);
f = 20:df:1000;

tic;
y = Gabor(x, tau, t, f, sgm);
toc;

%plot
image(t, f, abs(y)/max(max(abs(y)))*400);
colormap(gray(256));
set(gca,'Ydir','normal');
set(gca,'Fontsize',12);
xlabel('Time (sec)');
ylabel('Frequenzy (Hz)');
title('Gabor transform of Chord.wav');    

