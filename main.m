%     demo for TCIMFBS algorithm
%--------------Brief description-------------------------------------------
%
% This demo implements the TCIMFBS for hyperspectral image band selection [1]
%
% More details in:
% [1] X. Shang et al., Target-Constrained Interference-Minimized 
% Band Selection for Hyperspectral Target Detection. 
% IEEE Transactions on Geoscience and Remote Sensing, vol. 59, no. 7, pp. 
% 6044-6064, July 2021.
%
%--------------------------------------------------------------------------

VD_num = 18;

pos = 1;
d = D(pos,:);
U = D;
U(pos,:) = [];

% band selection
SF_TCIMFBS = [];
SB_TCIMFBS = [];
SB_TCIMFBS_Ver2 = [];

SF_TCIMFBS = SF_TCIMBS( HIM, d, U, VD_num);
SB_TCIMFBS = SB_TCIMBS( HIM, d, U, VD_num);
SB_TCIMFBS_Ver2 = SB_TCIMBS_ver2(HIM, d, U, VD_num);

