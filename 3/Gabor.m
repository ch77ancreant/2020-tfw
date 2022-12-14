function y = Gabor(x, tau ,t ,f ,sgm)

dt = t(2) - t(1);
df = f(2) - f(1);
dtau = tau(2) - tau(1);
S = dt/dtau;
N = round(1/(dtau*df));

m = f/df;
m1 = round(mod(m,N) + 1);
B = 1.9143/sqrt(sgm);
Q = round(B/dtau);

k = 1;

for nS = 1:S:length(x)
    
    % generate x1(q)
    x1 = zeros(1, N);
    for q = 1:2*Q+1
        a = nS - Q + q;
        if a>=1 && a<=length(x)
            x1(q) = x(a) .* (sgm.^(1/4)) * exp(-pi*sgm*((Q-q)*dtau).^2);
        end
    end
    
    % FFT(x1)
    X1 = fft(x1);
    
    % output STFT
    y(:, k) = X1(m1) .* dtau .* exp((1i*2*pi*(Q-nS)*m)/N);
    k = k + 1;
end   

end

