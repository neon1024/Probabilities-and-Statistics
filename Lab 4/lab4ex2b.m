% b.

clear all;

% ask user for the probability (0.4)
p = input("probability: ");

% ask user for the number of trials (20)
n = input("trials: ");

% ask user for the number of simulations (100)
N = input("simulations: ");

U = rand(n, N);

X = sum(U < p);

k = 0:n;

px = binopdf(k, n, p);

U_X = unique(X);

n_X = hist(X, length(U_X));

rel_freq = n_X / N;

clf;

plot(U_X, rel_freq, "*", k, px, "ro")

legend("sim", "bino")

