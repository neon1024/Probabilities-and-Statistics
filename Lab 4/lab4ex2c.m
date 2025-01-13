% c.

clear all

% ask user for the probability (0.4)
p = input("probability: ");

% ask user for the nubmer of simulations (100)
N = input("number of simulations: ");

x = zeros(1, N);

for i = 1:N
  x(i) = 0;
  while rand >= p
    x(i) = x(i) + 1;
  endwhile
endfor

k = 0:20;

px = geopdf(k, p);

U_X = unique(x);

n_X = hist(x, length(U_X));

rel_freq = n_X / N;

clf

plot(U_X, rel_freq, "*", k, px, "ro")

