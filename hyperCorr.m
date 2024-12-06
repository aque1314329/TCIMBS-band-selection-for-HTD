function [R] = hyperCorr(M)
% HYPERCORR Computes the sample autocorrelation matrix
% hyperCorr compute the sample autocorrelation matrix of a 2D matrix.
%   M - 2d matrix of HSI data (p x N)

[p,N] = size(M);
R = (M*M.')/N;

end

