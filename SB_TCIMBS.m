function band_set = SB_TCIMBS( data, D, U, band_num)
% SB_TCIMFBS for band selection
% 
% Inputs
%   Data - 3D data matrix (num_row x num_col x num_dim)
%   D - Target spectral matrix (p x L)
%   U - Non-target spectral matrix (q x L)
%   band_num - Number of bands to select
% Outputs
%   band_set - Index of the number of bands required (1 x band_num)

[witdh,height,no_bands] = size(data);
data = reshape(data,witdh*height,no_bands);

Var = []; dl = []; ul = []; Ml = []; 
value = []; band_set = [];  
j=1;

while (j<=band_num)
           Ml = data;
       if (j==1)
             dl = D;
             Ml = data;
             ul = U;
             Var = MaxVBP( Ml ,dl, ul );
       end
       if (j>1)
          for l = 1:no_bands
              if (ismember(l,band_set))  
                 Var(l) = -inf;     
                 continue;
              else
                 dl = D';
                 Ml = data;
                 ul = U';
                 location = [band_set(1:j-1) l];
                 dl(location,:) = [];
                 ul(location,:) = [];
                 Ml(:,location) = [];
                 Var(l) = calculateVar(Ml',dl', ul);  
              end
          end
       end
          [value(j), band_set(j)] = max(Var);
          j = j+1;
end
         band_set = band_set(1:band_num);
end

