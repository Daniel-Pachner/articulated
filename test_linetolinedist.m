% test 1

a = pointpath(0, 0);
b = pointpath(1, 0);
x = pointpath(0.5, -1.0);
y = pointpath(-0.8, -0.9);

figure(1);
hax = gca;
delete(get(gca, 'children'))
plotpath(hax, [a, b], 1, 'linewidth', 3, 'k');
hold(hax, 'on');
plotpath(hax, [x, y], 1, 'linewidth', 3, 'r');

[d, found, cross] = linetolinedist (a, b, x, y);
plot(cross.x, cross.y, 'rp', 'markersize', 16)
found

% test 2

%%a = pointpath(1, 0);
%%b = pointpath(1, 1);
%%x = pointpath(3, 2);
%%y = pointpath(3, 3);
%%
%%figure(2);
%%hax = gca;
%%delete(get(gca, 'children'))
%%plotpath(hax, [a, b], 1, 'linewidth', 3);
%%hold(hax, 'on');
%%plotpath(hax, [x, y], 1, 'linewidth', 3);
%%
%%[d, found, cross] = linetolinedist (a, b, x, y);
%%plot(cross.x, cross.y, 'rp', 'markersize', 16)
%%found