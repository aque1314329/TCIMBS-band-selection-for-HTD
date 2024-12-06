function Var = calculateVar(HIM, D, U)

[L, N] = size(HIM);
[p,L] = size(D);
[L,q] = size(U);
DC = ones(p,1);

UC = zeros(q,1);
C = [DC;UC];

R_hat = hyperCorr(HIM);    
Rinv = pinv(R_hat);  

target = [D' U];
tmp = target'*Rinv*target; 
Var = C'*pinv(tmp)*C; 
end