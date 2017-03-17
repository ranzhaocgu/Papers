

%function [HH,d1,d2]=estimAlphalfsm(N,H,Alpha,L,p)
% N : longueur du LFSM
% H : paramètre de Hurst du LFSM
% Alpha : paramètre de stabilité du LFSM
% beta : ordre de la statistique
% L : nb de moments du filtre discret
% p : nombre d'estimations

%%
N=2^12;
H=0.8;
Alpha=1.8;
L=10;
p=1;

a=rlistcoefdiscret(L);
i0=fix(length(a)/2)+1;

    

  
%   if H<=1/Alpha
%     disp(['H <= 1/\alpha : cas non prévu']);
%   else
    for i=1:p
    LFSM=asmlinfrac(N,Alpha,H,12,32)';
    LFSM1=[0,LFSM(2:end)];
    LFSM2=LFSM1(1:2:end);
    LFSM3=LFSM1(2:2:end);
    
    d1=cconv(LFSM1,a,i0);
    AA=1./(log(abs(d1))/log(N)+H)
    

    
    
   end

figure;
hist(AA)
%end

%%[HH,d1,d2]=estimHlfsm(2^12,0.8,1.8,30,10);