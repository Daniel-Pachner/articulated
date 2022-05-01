v = readvdata('tram34Tdata.tabulka');

nsegments = 50;
verbose = false;
plotfigure = true;

figure(1)
ax = gca;
n = 11;
d = 2*v.marks(end).dim;
dr_data = zeros(1, n);
dl_data = zeros(1, n);
c_data = linspace(0, 100/20, n);

for i = 1 : n
  r = 100/c_data(i);
  p = circularpath (r, d, 30);
  plotpath(ax, p, 2, 'k');
  tu = passsection(p, v, -1, verbose, plotfigure);
  dr_data(i) = tu.dr;
  dl_data(i) = tu.dl;
  text(p(end).x+3, p(end).y+3, ['C=', num2str(c_data(i))]);
  drawnow;
end

##
figure(2)
plot(c_data, dl_data, 'bo', c_data, dr_data, 'ro')
xlabel('curvature')
ylabel('tunnel')

A = ones(n, 2);
A(:, 1) = c_data;
xl = A \ dl_data';
xr = A \ dr_data';

hold on;
plot(c_data, A*xl, 'b:', c_data, A*xr, 'r:')

fprintf('Outer margin = %0.4g*C + %0.4g\n', xr(1), xr(2));
fprintf('Inner margin = %0.4g*C + %0.4g\n', xl(1), xl(2));