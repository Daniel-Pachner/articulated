n = 30;
xp = linspace(-1.0, 1.0, n);
yp = (xp + 1).^2.*(xp - 1).^2;
S = 1.5;
p = pointpath(S*xp, S*yp);

dl = -0.15*ones(1, n);
dr = +0.50*ones(1, n);

figure
plotpath(gca, p)
plotoccupiedarea(p, dl, dr)
