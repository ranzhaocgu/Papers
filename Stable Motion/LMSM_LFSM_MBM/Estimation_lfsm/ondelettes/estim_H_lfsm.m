%%
N=2^14;
H=0.8;
Alpha=1.8;
beta=1/4;
Nwt=4;
p=100;
HH=zeros(1,p);

for i=1:p
LFSM=asmlinfrac(N,Alpha,H,12,32)';
LFSM1=[0,LFSM(2:end)];
N1=floor(log2(length(LFSM1)));
LFSM2=LFSM1(1:2:end);
N2=floor(log2(length(LFSM2)));

coef1=FDWT(LFSM1,Nwt,N1,0);
coef2=FDWT(LFSM2,Nwt,N2,0);

V1beta= mean(abs(coef1(1).decime).^(beta));
V2beta= mean(abs(coef2(1).decime).^(beta));
V3beta=V2beta/V1beta;

HH(i)=(log2(V1beta)/(N1*beta))-1/2;
end


hist(HH,25)