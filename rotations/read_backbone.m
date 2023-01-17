function s = read_backbone(fname)
[s, header] = readfcsv(fname, {'distance', 'type'}, 'fs');
n = numel(s);
s = struct('x', {s.distance}, 'y', num2cell(zeros(1, n)), 'type', {s.type});
end
