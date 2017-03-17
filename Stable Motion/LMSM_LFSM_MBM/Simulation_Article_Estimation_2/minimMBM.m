% Estimation du minimum du parametre fonctionnel du MBM
% sur l'intervalle [gamma,delta] a l'aide de p realisations du
% mbm
%%%
% L nombre de moments nuls du filtre discret, de longueur L+1
% p taille de l'echantillon
% H valeur de la fonction parametre du MBM
% gamma, delta bornes de l'intervalle ou l'on cherche le minimum
%%%


function [results]=minimMBM(gamma,delta,p,L,H)
    N=length(H);
    KK1=0:N-L;
    kk1= N*gamma<= KK1 & KK1<=N*delta;

    KK2=0:N/2-L;
    kk2= N*gamma<= KK2 & KK2<=N*delta;


    [a]=rlistcoefdiscret(L);
    i0=1;
    %i0=fix(length(a)/2)+1;

    HH=zeros(3,p);

        for i=1:p

        signal=mBmQuantifKrigeage(N,H,10,'support',1,'sigma',1);
        signal1=[0,signal(1:end-1)'];
        signal2=signal1(1:2:end);
        signal3=signal1(2:2:end);

        d1=abs(cconv(signal1,a,i0)).^2;
        VNBeta1=mean(d1(kk1));

        d2=abs(cconv(signal2,a,i0)).^2;
        VNBeta2=mean(d2(kk2));
    
        d3=abs(cconv(signal3,a,i0)).^2;
        VNBeta3=mean(d3(kk2));
    
        HH(1,i)=log2(VNBeta2/VNBeta1)/2;
        HH(2,i)=log2(VNBeta3/VNBeta1)/2;
        HH(3,i)=log2((VNBeta2+VNBeta3)/VNBeta1)/2-1/2;

        end

    results.signal=signal1;
    results.N=log2(N);
    results.H=H;
    results.minH=min(H);
    results.alpha=2;
    results.beta=2;
    results.L=L;
    results.p=p;
    results.d1=d1;
    results.d2=d2;
    results.d3=d3;
    results.HH=HH;


end







