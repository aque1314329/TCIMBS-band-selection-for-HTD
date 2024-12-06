function band_set = SB_TCIMBS_ver2( data, D, U, band_num)
% SF_TCIMFBS for band selection
% 
% Inputs
%   Data - 3D data matrix (num_row x num_col x num_dim)
%   D - Target spectral matrix (p x L)
%   U - Non-target spectral matrix (q x L)
%   band_num - Number of bands to select
% Outputs
%   band_set - Index of the number of bands required (1 x band_num)

[width, height, no_bands] = size(data);
data = reshape(data, width*height, no_bands);

loc1 = []; loc2 = []; vl = []; dl = []; Ml = []; 
l1 = 1:no_bands;
j = 1;

while (j <= (no_bands-band_num))
       for l2 = 1:length(l1)
           Ml = data;
           dl = D';
           ul = U';
           vl = l1(l2);                 
           loc2 = [loc1 vl];
           dl(loc2,:) = [];
           ul(loc2,:) = [];
           Ml(:,loc2) = [];
           Var(l2) = calculateVar(Ml', dl', ul);         
       end           
          [~, min_loc] = min(Var);
          loc1(j) = l1(min_loc);
          l1 = 1:no_bands;
          l1(loc1) = [];
          Var = [];
          j = j+1;  
end      
    band_set = l1;
end

