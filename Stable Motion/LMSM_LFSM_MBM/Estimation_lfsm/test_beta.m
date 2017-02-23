N=2^(12);
H=0.8;
alpha=1.8;
beta=2.^(-[2:10]);
L=10;
p=1000;

%%
[HH1]=estim1(N,H,alpha,1/4,L,p);
[HH2]=estim1(N,H,alpha,1/2^3,L,p);
[HH3]=estim1(N,H,alpha,1/2^4,L,p);
[HH4]=estim1(N,H,alpha,1/2^5,L,p);
[HH5]=estim1(N,H,alpha,1/2^6,L,p);
[HH6]=estim1(N,H,alpha,1/2^7,L,p);
[HH7]=estim1(N,H,alpha,1/2^8,L,p);
[HH8]=estim1(N,H,alpha,1/2^9,L,p);
[HH9]=estim1(N,H,alpha,1/2^(10),L,p);
%%

%%
figure;
subplot(331)
hist(HH1,25)
title('H=0.8, \alpha= 1.8, \beta = 2^{-2}, N=2^{12}, L=10, p=1000')
subplot(332)
hist(HH2,25)
title('H=0.8, \alpha= 1.8, \beta = 2^{-3}, N=2^{12}, L=10, p=1000')
subplot(333)
hist(HH3,25)
title('H=0.8, \alpha= 1.8, \beta = 2^{-4}, N=2^{12}, L=10, p=1000')
subplot(334)
hist(HH4,25)
title('H=0.8, \alpha= 1.8, \beta = 2^{-5}, N=2^{12}, L=10, p=1000')
subplot(335)
hist(HH5,25)
title('H=0.8, \alpha= 1.8, \beta = 2^{-6}, N=2^{12}, L=10, p=1000')
subplot(336)
hist(HH6,25)
title('H=0.8, \alpha= 1.8, \beta = 2^{-7}, N=2^{12}, L=10, p=1000')
subplot(337)
hist(HH7,25)
title('H=0.8, \alpha= 1.8, \beta = 2^{-8}, N=2^{12}, L=10, p=1000')
subplot(338)
hist(HH8,25)
title('H=0.8, \alpha= 1.8, \beta = 2^{-9}, N=2^{12}, L=10, p=1000')
subplot(339)
hist(HH9,25)
title('H=0.8, \alpha= 1.8, \beta = 2^{-10}, N=2^{12}, L=10, p=1000')
%%
