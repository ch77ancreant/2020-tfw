function signal = generate_wav(a, b, c, T, Fs)

t = 0 : 1/Fs : T;
f = 1/3 * a .* t.^3 + 1/2 * b .* t.^2 + c .* t;
signal = cos(2 * pi * f);

end


