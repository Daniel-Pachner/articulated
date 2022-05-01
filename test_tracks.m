r = 20;
d = 60;
p = circularpath(r, d, 30);
[pl, pr] = pathtracks(p);

close('all')
figure(1)
ax = plotpath([], p, 'b');
hold(ax, 'on')
ax = plotpath([], pr, 'r');
ax = plotpath([], pl, 'g');