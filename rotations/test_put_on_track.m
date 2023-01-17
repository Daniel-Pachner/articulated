close all;
b = read_backbone('vehicle1.csv');

t = linspace(0, 0.25, 20);
p = pointpath(20*cos(2*pi*t), 20*sin(2*pi*t));
%p = pointpath(20*t, 20*t - 5*t.^2);

ax = plotpath([], p, 1, '-');
hold(ax, 'on')

b = put_on_track(p, b, 4);
plotpath([], b, 1, '- o', 'markersize', 3);
