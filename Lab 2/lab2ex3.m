N = input("number of simulations: ");

U = rand(3, N)

Y = ( U < 0.5);  % 1 - heads, 0 - tails

X = sum(Y);  % sum of each column

clf

hist(X)

