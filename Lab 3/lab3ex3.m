% 2.
% Poisson approximation of the Binomial distribution: If n >= 30 and p <= 0.05, then
% Bino(n, p) ~ Poission(lambda = np)

p = input("p [0, 0.05]: ");

n = 100;

for step = 1:3:n
  lambda = step*p;

  k = step;  % number of successes

  result = (lambda^k * exp(-lambda)) / factorial(k);

  plot(k, result, '*');

  hold on;
  pause(0.1);
endfor

hold off;

