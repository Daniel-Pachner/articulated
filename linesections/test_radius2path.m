R = 10;
ds = 1.0;
[n, R] = elem2angle(R, ds, pi);
r = [...
inf(1, ceil(20/ds)), ...
R*ones(1, n), ...
inf(1, ceil(20/ds))];
pc = radius2path(r, ds);

figure
plotpath(pc, '- o')
