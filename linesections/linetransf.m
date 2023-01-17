% Returns the lengths preserving affine transform, which maps a pair of points
% (line) [r, s] to another pair of points (another line) [a, b]. Both lines are
% input arguments. Both lines must be equal length but it is now verfied. The
% transform is a combination of translation and rotation.
%
% The returned matrix T maps [r, s] to [a, b]:
% [ax; ay] = T * [rx; ry; 1]
% [bx; by] = T * [sx; sy; 1]
function T = linetransf(r, s, a, b)
  A = ones(3, 3);
  A(1, 1) = r.x;
  A(2, 1) = r.y;
  A(1, 2) = s.x;
  A(2, 2) = s.y;
  A(1, 3) = s.x - (r.y - s.y);
  A(2, 3) = s.y + (r.x - s.x);
  B = ones(3, 3);
  B(1, 1) = a.x;
  B(2, 1) = a.y;
  B(1, 2) = b.x;
  B(2, 2) = b.y;
  B(1, 3) = b.x - (a.y - b.y);
  B(2, 3) = b.y + (a.x - b.x);
  T = B / A;
  T = T(1 : 2, :);
end
