r = 500;
nsegments = 30;
d = 500;
p = circularpath (r, d, nsegments);

close('all')
figure(1)
ax = plotpath([], p, 'b');
hold(ax, 'on')

h0 = p(end).s/2;
b = pointonpath(p, h0);
plotpath(ax, b, 'ro');

verbose = true;

for d = 0 : 50 : 250
  a = findpointatdist(p, b, d, h0+1.0*d, h0+1.5*d, verbose);
  plotpath(ax, a, 'rs');
  text(ax, a.x, a.y, num2str(d, 3));
end

for d = 0 : 50 : 250
  a = findpointatdist(p, b, d, h0+1.0*d, h0-1.5*d, verbose);
  plotpath(ax, a, 'gs');
  text(ax, a.x, a.y, num2str(d, 3));
end
