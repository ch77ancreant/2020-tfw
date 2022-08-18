
% delta t and delta f
dt = 0.05; 
df = 0.05;

% Define input
B = 1;
t = 0:dt:30;
f = -5:df:5;

t1 = 0:dt:10-dt; 
t2 = 10:dt:20-dt; 
t3 = 20:dt:30;

x = [cos(2*pi*t1), cos(6*pi*t2), cos(4*pi*t3)];

tic;
y = recSTFT(x, t, f, B);
toc;

%plot
image(t, f, abs(y)/max(max(abs(y)))*400);
colormap(gray(256));
set(gca,'Ydir','normal');
set(gca,'Fontsize',12);
xlabel('Time (sec)');
ylabel('Frequenzy (Hz)');
title('STFT of x(t), B = 1');    

 
