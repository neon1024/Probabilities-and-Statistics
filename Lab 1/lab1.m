% 1.

A = [
  1 0 -2;
  2 1 3;
  0 1 0
]

B = [
  2 1 1;
  1 0 -1;
  1 1 0
]

printf("C = A - B:\n");

C = A - B

printf("D = A*B\n");

D = A * B

printf("E = A_i * B_j\n");

E = A .* B

% 2.
% For x ∈ [0, 3], graph on the same set of axes the functions x^5 / 10,
% x*sin(x) and cos(x), in different colors and linestyles.
% Display a title and a legend on your graph. Then plot them on
% different pictures, but in the same window.

x = [ 0:.1:3 ];  % or x = linspace(0, 3, 100)

% plotting all 3 plots in the same picture
figure;  % creates a new window

plot(x, function1(x), "y-");

hold on;

plot(x, function2(x), "r-o");

hold on;

plot(x, function3(x), "g-.");

hold off;

grid on;  % display grid lines

xlabel("x");
ylabel("y");
title("functions");
legend("x^5 / 10", "x*sin(x)", "cos(x)");

% plotting all 3 plots in the same windows, different pictures
figure;  % creates a new window

subplot(3, 1, 1);  % 3 rows, 1 column, 1st plot
plot(x, function1(x), "y-");
title("x^5 / 10");
xlabel("x");
ylabel("y");
grid on;  % display grid lines

% hold on;  % allow multiple plots in the same grid

subplot(3, 1, 2);  % 3 rows, 1 column, 2nd plot
plot(x, function2(x), "r-o");
title("x*sin(x)");
xlabel("x");
ylabel("y");
grid on;  % display grid lines

subplot(3, 1, 3);  % 3 rows, 1 column, 3rd plot
plot(x, function3(x), "g-.");
title("cos(x)");
xlabel("x");
ylabel("y");
grid on;  % display grid lines

% hold off;

