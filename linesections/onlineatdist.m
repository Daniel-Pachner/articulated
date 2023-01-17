% Searches for a point p on a section line [a, b], which is at distance dist from
% a point c. There are between 0 and 2 such points. The function returns all of
% them and indicates their actual number. If the points are two, the one closer
% to point a is returned first.
function [p, q, n] = onlineatdist(a, b, c, dist, lextrap=false, rextrap=false)
C = zeros(1, 3);
C(1) = (b.x - a.x)^2 + (b.y - a.y)^2;
C(2) = -2*((c.x - a.x)*(b.x - a.x) + (c.y - a.y)*(b.y - a.y));
C(3) = (c.x - a.x)^2 + (c.y - a.y)^2 - dist^2;
D = C(2)^2 - 4*C(1)*C(3);
if D >= 0
    t = zeros(2, 1);
    t(1) = (-C(2) + sqrt(D)) / (2*C(1));
    t(2) = (-C(2) - sqrt(D)) / (2*C(1));
    t(t < -0.0 & ~lextrap | t > 1.0 & ~rextrap) = NaN;
else
    t = NaN(2, 1);
end
if isnan(t(1)) && ~isnan(t(2))
    t = t([2, 1]);
elseif ~isnan(t(1)) && ~isnan(t(2))
    t = sort(t);                                               
end
n = sum(~isnan(t));
p = point(a.x + t(1)*(b.x - a.x), a.y + t(1)*(b.y - a.y));
q = point(a.x + t(2)*(b.x - a.x), a.y + t(2)*(b.y - a.y));
p.s = a.s + t(1)*(b.s - a.s);
q.s = a.s + t(2)*(b.s - a.s);
end