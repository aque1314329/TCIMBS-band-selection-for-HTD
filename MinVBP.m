function Var = MinVBP( data, D, U)

[N, no_bands] = size(data);
Var = zeros(no_bands, 1);

for l = 1:no_bands
   dl = D(:,l);
   Ml = data(:,l); 
   ul = U(:,l);
   Var(l) = calculateVar(Ml', dl, ul'); 
end

end
