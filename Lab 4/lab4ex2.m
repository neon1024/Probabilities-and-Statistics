clear all;

% a.

% ask user for the probability (0.3)
p = input("probability: ");

% ask user for the number of simulations (100)
N = input("simulations: ");

U = rand(1, N);

X = (U < p)

U_X = [0 1];

n_X = hist(X, length(U_X));

% divide them by N in order to obtain probabilities
rel_freq = n_X / N;

X = [
      n_X;
      rel_freq
    ]

