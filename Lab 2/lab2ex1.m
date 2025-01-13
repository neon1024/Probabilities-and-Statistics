n = input("number of trials: ")  % positive integers

p = input("probability of success: ")  % between 0 and 1, always

x = 0:n;

px = binopdf(x, n, p)

clf  % clear figure

plot(x, px, '*')

hold on  % keep the figures

xx = 0:0.01:n;

cx = binocdf(xx, n, p);

plot(xx, cx, 'r')

legend('pdf', 'cdf')

% n = 10
% p = 0.2

