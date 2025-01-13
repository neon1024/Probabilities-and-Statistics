% 2.
p = input("p [0.05, 0.95]: ");

n = 100;

for step = 1:3:n
  mean = step * p;
  deviation = sqrt(mean * (1 - p));

  k = 0:step;

  result = binopdf(k, step, p);

  plot(k, result, '*');

  pause(0.1);
endfor

