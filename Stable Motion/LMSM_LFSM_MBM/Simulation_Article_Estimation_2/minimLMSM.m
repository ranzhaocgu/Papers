% Estimation du minimum du parametre fonctionnel du LMSM
% sur l'intervalle [gamma,delta] a l'aide de p realisations du
% lmsm
%
% 24/12/2013 JH
%%%
% L nombre de moments nuls du filtre discret, de longueur L+1
% p taille de l'echantillon
% H valeur de la fonction parametre du LMSM
% alpha parametre de stabilite du LMSM
% beta ordre de la statistique beta<alpha/4 
% gamma, delta bornes de l'intervalle ou l'on cherche le minimum
%%%
% Exemples
% 

function [results]=minimLMSM(gamma,delta,p,L,beta,alpha,H)
    N=length(H);
    KK1=0:N-L;
    kk1= N*gamma<= KK1 & KK1<=N*delta;

    KK2=0:N/2-L;
    kk2= N*gamma<= KK2 & KK2<=N*delta;


    [a]=rlistcoefdiscret(L);
    i0=1;
    %i0=fix(length(a)/2)+1;

    alpha1=alpha+zeros(1,length(H));
    
    HH=zeros(3,p);

        for i=1:p

        signal=msmlinmfrac(N,alpha1,H,12,32)';
        signal1=[0,signal(2:end)];
        signal2=signal1(1:2:end);
        signal3=signal1(2:2:end);

        d1=abs(cconv(signal1,a,i0)).^(beta);
        VNBeta1=mean(d1(kk1));

        d2=abs(cconv(signal2,a,i0)).^(beta);
        VNBeta2=mean(d2(kk2));
    
        d3=abs(cconv(signal3,a,i0)).^(beta);
        VNBeta3=mean(d3(kk2));
   

        HH(1,i)=log2(VNBeta2/VNBeta1)./beta;
        HH(2,i)=log2(VNBeta3/VNBeta1)./beta;
        HH(3,i)=log2((VNBeta2+VNBeta3)/VNBeta1)./(beta)-1/beta;

        end
    
    results.signal=signal1;
    results.N=log2(N);
    results.H=H;
    results.minH=min(H);
    results.alpha=alpha;
    results.beta=beta;
    results.L=L;
    results.p=p;
    results.d1=d1;
    results.d2=d2;
    results.d3=d3;
    results.HH=HH;


end








