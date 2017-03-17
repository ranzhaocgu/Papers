% 22/11/2013 - ENS Lyon
% Réalise l'estimation du minimun du paramètre fonctionnel 
% de Hurst d'un LMSM à l'aide de la stat Vn/V2n et
% d'un filtre discret

function [result]=estimHlmsm(N,H,alpha,beta,L,p)
%N : longueur du LFSM
%H : paramètre fonctionnel de Hurst du LMSM
%alpha : paramètre de stabilité du LMSM
%beta : ordre de la statistique
%L : nb de moments du filtre discret
%p : nombre d'estimations

a=rlistcoefdiscret(L);
i0=fix(length(a)/2)+1;

HH=zeros(2,p);


alpha1=alpha+zeros(1,length(H));
    if min(H)<=1/alpha
       disp(['min(H)< 1/\alpha : cas non prévu']);
    else    
      
        for i=1:p
    
        LMSM=msmlinmfrac(N,alpha1,H,12,32)';
        LMSM1=[0,LMSM(2:end)];
        LMSM2=LMSM1(1:2:end);
        LMSM3=LMSM1(2:2:end);

        d1=cconv(LMSM1,a,i0);
        VNBeta1=mean(abs(d1).^(beta));

        d2=cconv(LMSM2,a,i0);
        VNBeta2=mean(abs(d2).^(beta));
        
        d3=cconv(LMSM3,a,i0);
        VNBeta3=mean(abs(d3).^(beta));

        HH(1,i)=log(VNBeta2/VNBeta1)/(beta*log(2));
        HH(2,i)=log((VNBeta2+VNBeta3)/VNBeta1)/(beta*log(2))-1/beta;
        end
 
    end

    result.N=log2(N);
    result.H=H;
    result.alpha=alpha;
    result.beta=beta;
    result.L=L;
    result.p=p;
    result.d1=d1;
    result.d2=d2;
    result.d3=d3;
    result.HH=HH;
    
    
% lepath='/srv/fs/auto/home/jhamonie/Matlab/code_MATLAB/Estimation_lmsm/filtre_discret/';
% filename=['estim' ' _H' num2str(H) 'A ' int2str(Alpha) '_N' int2str(log2(N)) '.mat'];
% save([lepath filename],'result')

end



% Exemple :
p=100; L=30; beta=1/4; N=2^10; t=linspace(0,1,N); 
alpha = 1.6;
H1=eval('0.1.*sin(4*pi*t)+0.8');
[Est]=estimHlmsm(N,H1,alpha,beta,L,p)
hist(Est.HH(2,:),25)







