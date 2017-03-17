% 21/11/2013 - ENS Lyon
% Réalise l'estimation du paramètre de stabilité alpha
% d'un LFSM de paramètres H et alpha à l'aide des
% coefficients d'ondelettes 


%%
p=1; 
L=30; 
beta=1/4; 
N=2^12;t=linspace(0,1,N); 
alpha = 1.6;
H1=eval('0.15.*sin(4*pi*t)+0.8');
Alpha=alpha+zeros(1,length(H1));

Nwt=4;
AA=zeros(3,p);

for i=1:p

LMSM=msmlinmfrac(N,Alpha,H1,12,32)';
LMSM1=[0,LMSM(2:end)];
N1=floor(log2(length(LMSM1)));
LMSM2=LMSM1(1:2:end);
N2=floor(log2(length(LMSM2)));

coef1=FDWT(LMSM1,Nwt,N1,1);
coef2=FDWT(LMSM2,Nwt,N2,1);


Al1=1/(log2(max(abs(coef1(1).decime)))/N1 +H-0.5);
Al2=1/(log2(max(abs(coef2(1).decime)))/N2 +H-0.5);
Al3=(Al1+Al2)/2;

AA(:,i)=[Al1;Al2;Al3]

end

% figure;
% subplot(311)
% hist(AA(1,:),25)
% subplot(312)
% hist(AA(2,:),25)
% subplot(313)
% hist(AA(3,:),25)




%%