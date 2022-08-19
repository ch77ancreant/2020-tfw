function y = recSTFT(x, t, f, B)

dt = t(2) - t(1);
df = f(2) - f(1);
N = round(1/(dt*df));

m = f/df;
m1 = round(mod(m,N) + 1);
Q = round(B/dt);

for n = 1:length(t)
    
    % generate x1(q)
    x1 = zeros(1, N);
    for q = 1:2*Q+1
        a = n - Q + q;
        if a>=1 && a<=length(t)
            x1(1, q) = x(a);
        end
    end
    
    % FFT(x1)
    X1 = fft(x1);
    
    % output STFT
    y(:, n) = X1(m1) .* dt .* exp((1j*2*pi*(Q-n)*m)/N);
end

end

