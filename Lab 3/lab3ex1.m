% 1.
% a)
% P(X <= 0) = P(X=0)
% P(X >= 0) = 1 - P(X < 0) = 1 - P(X = 0)

printf("a):\n");

x = 1:1:10;

% Normal
printf("Normal:\n");

p1 = normcdf(x, 0, 1);

printf("P(X <= 0): %f\n", p1);

p2 = 1 - normcdf(0, x);

printf("P(X >= 0): %f\n", p2);

% Student
printf("Student:\n");

degrees_of_freedom = 10;

p1 = tcdf(x, degrees_of_freedom);

printf("P(X <= 0): %f\n", p1);

p2 = 1 - tcdf(x, degrees_of_freedom);

printf("P(X >= 0): %f\n", p2);

% Fisher
printf("Fisher:\n");

p1 = fcdf(x, 5, 10);

printf("P(X <= 0): %f\n", p1);

degrees_of_freedom1 = 5;
degrees_of_freedom2 = 10;

p2 = 1 - fcdf(x, degrees_of_freedom1, degrees_of_freedom2);

printf("P(X >= 0): %f\n", p2);

% b)
% P(-1 <= X <= 1) and P(X <= -1 or X >= 1)

printf("b)\n");

% Normal
printf("Normal:\n");

p1 = normcdf(1, x) - normcdf(-1, x);

for i = 1 : length(p1)
  printf("P(-1 <= X <= 1): %f\n", p1(i));
end

p2 = 1 - p1;  % inverse of P(-1 <= X <= 1)

for i = 1 : length(p1)
  printf("P(X <= -1 or X >= 1): %f\n", p2(i));
end

% c)
% the value x_alpha such that  P(X < x_alpha) = P(X <= x_alpha) = alpha, for alpha in (0, 1), (x_alpha is called the quantile of order alpha)

printf("c):\n");

% Normal
printf("Normal:\n");

% norminv(alpha, mean, deviation)

alpha = input("alpha (0, 1): ");

mean = 0;
deviation = 1;

result = norminv(alpha, mean, deviation);

printf("x_alpha: %f\n", result);

% Student
printf("Student:\n");

% tinv(alpha, degrees_of_freedom)

degrees_of_freedom = 10;

result = tinv(alpha, degrees_of_freedom);

printf("x_alpha: %f\n", result);

% Fisher
printf("Fisher:\n");
% finv(alpha, degrees_of_freedom1, degrees_of_freedom2)

degrees_of_freedom1 = 5;
degrees_of_freedom2 = 10;

result = finv(alpha, degrees_of_freedom1, degrees_of_freedom2);

printf("x_alpha: %f\n", result);

% d)
% the value of x_beta such that P(X > x_beta) = P(X >= x_beta) = beta, for beta in (0, 1), (x_beta is called the quantile of order 1 - beta)

printf("d)\n");

% Normal
printf("Normal:\n");

% norminv(1 - beta, mean, deviation)

beta = input("beta (0, 1): ");

result = norminv(1 - beta, mean, deviation);

printf("x_beta: %f\n", result);

% Student
printf("Student:\n");

% tinv(1 - beta, degrees_of_freedom)

degrees_of_freedom = 10;

result = tinv(1 - beta, degrees_of_freedom);

printf("x_beta: %f\n", result);

% Fisher
printf("Fisher:\n");

% finv(1 - beta, degrees_of_freedom1, degrees_of_freedom2)

degrees_of_freedom1 = 5;
degrees_of_freedom2 = 10;

result = finv(1 - beta, degrees_of_freedom1, degrees_of_freedom2);

printf("x_beta: %f\n", result);

