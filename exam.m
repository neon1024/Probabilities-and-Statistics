% 3. Nickel powders are used in coatings used to shield electronic equipment. A random sample is selected, and
% the sizes of nickel particles in each coating are recorded (they are assumed to be approimately normally
% distributed):

X = [ 3.26 1.89 2.42 2.03 3.07 2.95 1.39 3.06 2.46 3.35 1.56 1.79 1.76 3.82 2.42 2.96 ];

% a. Find a 95% confidence interval for the average size of nickel particles.
mean_X = mean(X);
std_X = std(X);  % Sample standard deviation
n = length(X);
alpha = 0.05;

t_critical = tinv(1 - alpha/2, n - 1);

margin_of_error = t_critical * (std_X / sqrt(n));

confidence_interval = [mean_X - margin_of_error, mean_X + margin_of_error];

fprintf('95%% confidence interval for the average size of nickel: [%.4f, %.4f]\n', confidence_interval);

% b. At 1% significance level, on average, do these nickel particles seem to be smaller than 3?
% One-tailed t-test (H0: mu >= 3, H1: mu < 3)
% At the 1% significance level, on average, do these nickel particles seem to

% alpha = significance level
alpha = 0.01

% average means miu

% H0 - null hypothesis
% H0: The nickle particles are equal to 3
% H0: miu = 3
% H1 - the research hypothesis
% H1: The nickle particles are smaller than 3
% H1: miu < 3
% => we perform a left-tailed test
fprintf("We perform a left-tailed test for the population mean\n");

miu = 3

[H,P,CI,statistics] = ttest(X, miu, 'alpha', alpha, 'tail', 'left');

% result of the test, h = 0, if H0 is NOT rejected,
% h = 1, if H0 IS rejected
fprintf('\n H is %d', H)
if H == 1
  fprintf('\n So the null hypothesis is rejected, \n')
  fprintf('i.e the data suggests that the nickle particles are smaller than 3\n')
else
  fprintf('\nSo the null hypothesis is not rejected,\n')
  fprintf('i.e. the data suggests that the nickle particles are not smaller than 3\n')
end


% building the rejection region
% RR = (-inf, tt_{alpha}) since it's a left-tailed test
% tt_alpha is the quantile for the T(n-1) distribution

tt_alpha = tinv(alpha, n-1)
RR = [-inf, tt_alpha] % vector with 2 positions

fprintf('\nThe rejection region is (%4.4f, %4.4f)\n', RR);
fprintf('The value of the test statistic z is %4.4f\n', statistics.tstat);
fprintf('The P-value of the test is %4.4f\n\n', P);
