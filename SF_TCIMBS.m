function band_set = SF_TCIMBS( data, D, U, band_num )
% SF_TCIMFBS for band selection
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

% 参数初始化
Var = []; dl = []; Ml = []; ul = []; 
value = []; band_set = []; d_minus = []; u_minus = []; M_minus = []; 
j=1;

while (j<=band_num )
       if (j==1)
           Var = MinVBP( data,D,U); 
       end
       if (j>1)
          for l = 1:no_bands
              if (ismember(l,band_set)) 
                 Var(l) = inf;     
                 continue;
              else
                 dl = [d_minus(:,1:j-1) D(:,l)];
                 ul = [u_minus(:,1:j-1) U(:,l)];
                 Ml = [M_minus(:,1:(j-1)) data(:,l)];  
                 Var(l) = calculateVar(Ml',dl,ul');  
              end
          end
       end  
          [value(j), band_set(j)] = min(Var);
          M_minus(:,j) = data(:,band_set(j));
          d_minus(:,j) = D(:,band_set(j));
          u_minus(:,j) = U(:,band_set(j));
          j = j+1;
end
end

