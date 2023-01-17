function d = point2line(p, a, b)
w = [a.x - b.x; a.y - b.y];
v1 = [p.x - a.x; p.y - a.y];
v2 = [p.x - b.x; p.y - b.y];
d =  [w'*v1, w'*v2];
end
