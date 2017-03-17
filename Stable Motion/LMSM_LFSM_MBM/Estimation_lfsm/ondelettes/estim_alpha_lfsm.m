% 21/11/2013 - ENS Lyon
% Réalise l'estimation du paramètre de stabilité alpha
% d'un LFSM de paramètres H et alpha à l'aide des
% coefficients d'ondelettes 


%%
N=2^12;
H=0.8;
Alpha=1.8;
Nwt=8;
p=1000;
AA=zeros(3,p);

for i=1:p

LFSM=asmlinfrac(N,Alpha,H,12,32)';
LFSM1=[0,LFSM(2:end)];
N1=floor(log2(length(LFSM1)));
LFSM2=LFSM1(1:2:end);
N2=floor(log2(length(LFSM2)));

wt1=LxEx1d(LFSM1,Nwt,[],[],[],[],[],1);
wt2=LxEx1d(LFSM1,Nwt,[],[],[],[],[],1);

D1max=max(wt1.coefs(1).value);
D2max=max(wt2.coefs(1).value);

Al1=1/(H+log2(D1max)/N1);
Al2=1/(H+log2(D2max)/N2);
Al3=(Al1+Al2)/2;

AA(:,i)=[Al1;Al2;Al3];

end

figure;
subplot(311)
hist(AA(1,:),25)
subplot(312)
hist(AA(2,:),25)
subplot(313)
hist(AA(3,:),25)




%%