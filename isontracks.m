function ison = isontracks(p, v)
s_pivots = [v.backbone([v.marks.type] == 1).s];
ison = (s_pivots <= p(end).s && s_pivots >= p(1).s);
end
