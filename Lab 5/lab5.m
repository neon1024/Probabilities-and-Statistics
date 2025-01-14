% A.
X_values = [20, 21, 22, 23, 24, 25, 26, 27];
X_frequencies = [2, 1, 3, 6, 5, 9, 2, 2];

Y_values = [75, 76, 77, 78, 79, 80, 81, 82];
Y_frequencies = [3, 2, 2, 5, 8, 8, 1, 1];

% Repeat each value according to its frequency
X = repelem(X_values, X_frequencies);
Y = repelem(Y_values, Y_frequencies);

% a) Find the means
mean_X = mean(X);
mean_Y = mean(Y);

printf("Mean of X: %d\n", mean_X);
printf("Mean of Y: %d\n", mean_Y);

% Compute the variances
var_X = var(X, 1);  % The '1' specifies population variance
var_Y = var(Y, 1);

# Calculate covariance
N = length(X);
cov_XY = sum((X - mean_X) .* (Y - mean_Y)) / N;

# Calculate correlation coefficient
corrcoef_XY = cov_XY / (sqrt(var_X) * sqrt(var_Y));

# Output results
mean_X, mean_Y, var_X, var_Y, cov_XY, corrcoef_XY

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

sp = sqrt(((n1 - 1)*s1 + (n2 - 1)*s2)/(n1 + n2 - 2));

left_side = x1_bar - x2_bar - s/sqrt(n1) * tinv(1 - alpha/2, n1 - 1) * sp * sqrt(1/n1 + 1/n2);
right_side = x1_bar - x2_bar + s/sqrt(n2) * tinv(1 - alpha/2, n - 1) * sp * sqrt(1/n1 + 1/n2);

printf("The confidence interval for the population mean when sigma is known is (%4.3f, %4.3f)\n", left_side, right_side);
% b)
% use 3.c

% c)
% user 4

% x1 = [22.4 21.7 24.5 23.4 21.6 23.3 22.4 21.6 24.8 20.0];
% x2 = [17.7 14.8 19.6 19.6 12.1 14.8 15.4 12.6 14.0 12.2];
% n1 = length(x1);
% n2 = length(x2);

% conflevel = input ('C:');
% alpha= 1 - conflevel;
% m1 = mean(x1);
% m2 = mean(x2);
% m = m1 - m2;
% v1 = var(x1);
% v2 = var(x2);

%% a) sigma1 == sigma
% sp = sqrt(((n1-1)*v1 + (n2-1)*v2)/(n1+n2-2));
% t1 = tinv(1 - alpha/2, n1+n2-2);
% t2 = tinv(alpha/2, n1+n2-2);
% ci1 = m - t1 * sp * sqrt(1/n1+1/n2);
% ci2 = m - t2 * sp * sqrt(1/n1+1/n2);
% fprintf('CI (sigma1 == sigma2): (%.3f, %.3f)\n', ci1, ci2);

%% b) sigma1 != sigma2
% c = (v1/n1) / (v1/n1+ v2/n2);
% n = 1/(c^2/(n1-1) + (1-c)^2/(n2-1));
% t1 = tinv(1- alpha/2, n);
% t2 = tinv(alpha/2, n);
% ci1 = m - t1 * sqrt(v1/n1+ v2/n2);
% ci2 = m - t2 * sqrt(v1/n1+ v2/n2);
% fprintf('CI (sigma1 != sigma2): (%.3f, %.3f)\n', ci1, ci2);

%% c)
% f1 = finv(1- alpha/2, n1-1, n2-1);
% f2 = finv(alpha/2, n1-1, n2-1);
% ci1 = 1/f1* v1/v2;
% ci2 = 1/f2* v1/v2;
% fprintf('CI ratio of variances: (%.3f, %.3f)\n', ci1, ci2);
% fprintf('CI ratio of std. deviations: (%.3f, %.3f)\n', sqrt(ci1), sqrt(ci2));

