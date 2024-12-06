function Var = MaxVBP( data, D, U )

[N,no_bands] = size(data);
Var = zeros(no_bands,1);

for l = 1:no_bands
    dl = D';
    dl(l,:)=[];
    ul = U';
    ul(l,:)=[];
    Ml = data';
    Ml(l,:) = [];
    Var(l) = calculateVar(Ml,dl',ul);
end
end

