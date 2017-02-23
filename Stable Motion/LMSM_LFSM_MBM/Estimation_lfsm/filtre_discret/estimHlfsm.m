% 22/11/2013 - ENS Lyon
% Réalise l'estimation du paramètre de Hurst d'un LFSM
% à l'aide de la stat Vn/V2n et d'un filtre discret
function [result]=estimHlfsm(N,H,Alpha,beta,L,p)
% N : longueur du LFSM
% H : paramètre de Hurst du LFSM
% Alpha : paramètre de stabilité du LFSM
% beta : ordre de la statistique
% L : nb de moments du filtre discret
% p : nombre d'estimations

a=rlistcoefdiscret(L);
i0=fix(length(a)/2)+1;

    HH=zeros(2,p);

  
  if H<=1/Alpha
    disp(['H <= 1/\alpha : cas non prévu']);
  else
    for i=1:p
    LFSM=asmlinfrac(N,Alpha,H,12,32)';
    LFSM1=[0,LFSM(2:end)];
    LFSM2=LFSM1(1:2:end);
    LFSM3=LFSM1(2:2:end);

    d1=cconv(LFSM1,a,i0);
    VNBeta1=mean(abs(d1).^(beta));

    d2=cconv(LFSM2,a,i0);
    VNBeta2=mean(abs(d2).^(beta));
    
    d3=cconv(LFSM3,a,i0);
    VNBeta3=mean(abs(d3).^(beta));

    HH(1,i)=log(VNBeta2/VNBeta1)/(beta*log(2));
    HH(2,i)=log((VNBeta2+VNBeta3)/VNBeta1)/(beta*log(2))-1/beta;
    
    end
  end
  
result.N=log2(N);
result.H=H;
result.alpha=Alpha;
result.beta=beta;
result.L=L;
result.p=p;
result.d1=d1;
result.d2=d2;
result.d3=d3;
result.HH=HH;



% lepath='/srv/fs/auto/home/jhamonie/Matlab/code_MATLAB/Estimation_lfsm/filtre_discret/';
% filename=['estim' ' _H' num2str(H) 'A ' int2str(Alpha) '_N' int2str(log2(N)) '.mat'];
% save([lepath filename],'result')


end

%%[result]=estimHlfsm(2^12,0.8,1.8,1/4,30,10);










