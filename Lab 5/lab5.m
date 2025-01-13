% B. Confidence intervals
% use the conf_int PDF
% 1. In a study of the size of various computer storage systems, the random variable X, the number of medium-sized files (in millions) that can be stored is considered. These data are obtained:
x = [ 7, 7, 4, 5, 9, 9,...
      4, 12, 8, 1, 8, 7,...
      3, 13, 2, 1, 17, 7,...
      12, 5, 6, 2, 1, 13,...
      14, 10, 2, 4, 9, 11,...
      3, 5, 12, 6, 10, 7
    ];

n = length(X);

% ex: 0.95, 0.9, 0.99, 0.995
one_minus_alpha = input("confidence level: ");

alpha = 1 - one_minus_alpha;

% a) Assuming that past experience indicates that sigma = 5, find a 100*(1 - alpha)% confidence interval for the average number of files stored.
% use 1.a

sigma = 5;

x_bar = mean(x);

% left side
m1 = x_bar - sigma/sqrt(n) * norminv(1 - alpha/2, 0, 1);

% right side
m2 = x_bar + sigma/sqrt(n) * norminv(1- alpha/2, 0, 1);

printf("The confidence interval for the population mean when sigma is known is (%4.3f, %4.3f)\n", m1, m2);

% b) Assuming nothing is known about sigma, find a 100*(1 - alpha)% confidence interval for the average number of files stored.
% use 1.b

s = std(x);

m1b = x_bar - s/sqrt(n) * tinv(1 - alpha/2, n - 1);
m2b = x_bar + s/sqrt(n) * tinv(1 - alpha/2, n - 1);

printf("The confidence interval for the population mean when sigma is known is (%4.3f, %4.3f)\n", m1b, m2b);

% c) Assuming the number of files stored are approximately normally distributed, find 100*(1 - alpha)% confidence intervals for the variance and for the standard variation.
% use 2

v = var(x);  % s^2

v1 = (n - 1)*v / chi2inv(1 - alpha/2, n - 1);
v2 = (n - 1)*v / chi2inv(alpha/2, n - 1);

printf("The confidence interval for the population mean when sigma is known is (%4.3f, %4.3f)\n", v1, v2);

% 2. It is thought that the gas mileage obtained by a particular model of automobile will be higher if unleaded premium gasoline is used in the vehicle rather than regular unleaded gasoline. To gather evidence in this matter, 10 cars are randomly selected from the assembly line and tested using a specified braond of premium gasoline; 10 others are randomly selected and tested using hte brand's regular gasoline. Tests are conducted under identical controlled conditions and gas mileages for both types of gas are assumed independend and (approximately) normally distributed. These data result:

premium_gas = [
  22.4, 21.7;
  24.5, 23.4;
  21.6, 23.3;
  22.4, 21.6;
  24.8, 20
];

regular_gas = [
  17.7, 14.8;
  19.6, 19.6;
  12.1, 14.8,
  15.4, 12.6,
  14, 12.2
];

% a) Assuming sigma1 = sigma2, find a 100*(1 - alpha)% confidence interval for the difference of the true means
% user 3.b

x1_bar = mean(premium_gas);
x2_bar = mean(regular_gas);

s1 = var(premium_gas);
s2 = var(regular_gas);

n1 = length(premium_gas);
n2 = length(regular_gas);

sp = sqrt(((n1 - 1)*s1*s1 + (n2 - 1)*s2*s2)/(n1 + n2 - 2));

left_side = x1_bar - x2_bar - s/sqrt(n1) * tinv(1 - alpha/2, n1 - 1) * sp * sqrt(1/n1 + 1/n2);
right_side = x1_bar - x2_bar + s/sqrt(n2) * tinv(1 - alpha/2, n - 1) * sp * sqrt(1/n1 + 1/n2);

printf("The confidence interval for the population mean when sigma is known is (%4.3f, %4.3f)\n", left_side, right_side);
% b)
% use 3.c

% c)
% user 4

