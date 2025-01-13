% A coin is tossed 3 times. Let X denote the number of heads that appear.

% a) Find the probability distribution of function X. What type of distribution
% does X have?

% n = 3 (number of trials)
% p = 0.5 (probability of success of each trial)
% X = ( 0   1   2   3   )
%     ( 1/8 3/8 3/8 1/8 )

% b) Find the cumulative distribution function of X, Fx. See the previous exercise.

% c) Find P(X = 0) and P(X <> 1).

% P(X = 0) -> definition of the pdf in X = 0.
p1 = binopdf(0, 3, 0.5);

% P(X <> 1) = 1 - P(X = 1)\
p2 = 1 - binopdf(1, 3, 0.5);

printf("P(X = 0) = %1.6f\n", p1);
printf("P(X <> 1) = %1.6f\n", p2);

% d) P(X <= 2) and P(X < 2).

% P(X <= 2) -> definition of the cdf in x = 2.
 p3 = binocdf(2, 3, 0.5);

 % P(X < 2) = P(X <= 1) -> definition of the cdf in x = 1.
 p4 = binocdf(1, 3, 0.5);

printf("P(X <= 2) = %1.6f\n", p3);
printf("P(X < 2) = %1.6f\n", p4);

% e) P(X >= 1) = 1 - P(X < 1) = 1 - P(X <= 0)
p5 = 1 - binocdf(0, 3, 0.5);

% P(X > 1) = 1 - P(X <= 1) = 1 - (1 - P(X <= 0)) = P(X <= 0)
% P(X > 1) = 1 - P(X <= 1) = 1 - binocdf(1, 3, 0.5), as P(X <= 1) is the definition
% of the cdf in x = 1, meaning that P(X <= 1) = binocdf(1, 3, 0,5).
p6 = binocdf(0, 3, 0.5);

printf("P(X >= 1) = %1.6f\n", p5);
printf("P(X > 1) = %1.6f\n", p6);

