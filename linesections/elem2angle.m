function [n, R] = elem2angle(R, ds, A)
n = round(A/atan(ds/R));
R = ds/tan(A/n);
