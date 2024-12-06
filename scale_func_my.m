 function [data M m] =scale_func_my(data)
%
% function data =rescale(data)
%
% This function rescale the input data between -1 and 1
%
% INPUT
%
% data: the data to rescale
% max: the maximum value of the ouput data
% min: the minimum value of the output data
% 
% OUTPUT
%
% data: the rescaled data

[Nb_s Nb_b]=size(data);
if nargin == 1
    M = max(max(max(data)));
    m = min(min(min(data)));
end;

data = ((data-repmat(m,Nb_s,Nb_b))./repmat(M-m,Nb_s,Nb_b));

 end