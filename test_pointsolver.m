##f = @(x) x^2 - 2;
f = @(x) x^2;
xl = 0.1;
xr = 2;
strict = true;
[x, y, it] = pointsolver(xl, xr, f, true, 20, 1e-8, strict);
fprintf('value = %0.3g, iterations = %i\n', f(x), it);

