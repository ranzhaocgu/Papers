%%
%estimation de H(t)
clear all
close all
clc


%%
%procedure pour determiner N0

L=6;
[a]=rlistcoefdiscret(L);
i0=fix(length(a)/2)+1;
%i0=1;

N1=2^16;
N2=N1/2;

f= ((log(2:N1)).^2)./(2:N1);
index=find(f<=1/(20*(L+1)));
b=index(1);

%%

%la suite theta_N
theta=2^(-10)*(b:N1).^(-(L-2)/(8*L-6))+4*(L+1)*((log(b:N1)).^2)./(b:N1);

%inverse de theta_N
Invtheta=1./theta;

%partie entiere de l'inverse de theta_N
PEInvtheta=fix(Invtheta);
%[PE,ia,ic]=unique(PEInvtheta,'first');

%% suite des intervalles et ensembles des indices k
%INn=zeros(length(PE),2);
% discretisation 
tic
d=2^1;

Inter=struct([]);

for N=1:length(theta);
    Inter(N).discret=[];
        for n=0:PEInvtheta(N)-2
        Inter(N).value(n+1,1:d)=linspace(n*theta(N),(n+1)*theta(N),d);
        Inter(N).discret=[Inter(N).discret Inter(N).value(n+1,1:d)];
        end
Inter(N).value(PEInvtheta(N),1:d)=linspace((PEInvtheta(N)-1)*theta(N),1,d);
Inter(N).discret=[Inter(N).discret Inter(N).value(PEInvtheta(N),1:d)];
end


toc
%%
tic
KK1=(0:N1-L);
KK2=(0:N2-L);
lesK=struct([]);


for N=1:length(Inter)
    Sinter=size(Inter(N).value);
    for n=1:Sinter(1)
    lesK(N).ensK1(n).value=N1*Inter(N).value(n,1)<= KK1 & KK1<=N1*Inter(N).value(n,end);
    lesK(N).ensK2(n).value=N2*Inter(N).value(n,1)<= KK2 & KK2<=N2*Inter(N).value(n,end);
    end
end
toc

%%
t=linspace(0,1,N1); 
H=eval('3*(t-.5).^2+.2');
signal=mBmQuantifKrigeage(N1,H,10,'support',1,'sigma',1);

plot(t,signal)
grid on;

signal1=[0,signal(1:end-1)'];
signal2=signal1(1:2:end);
signal3=signal1(2:2:end);

d1=abs(cconv(signal1,a,i0)).^2;
d2=abs(cconv(signal2,a,i0)).^2;
d3=abs(cconv(signal3,a,i0)).^2;

Hbeta=struct([]);
for N=1:length(Inter)
    Sinter=size(Inter(N).value);
    for n=1:Sinter(1)
        VNBeta1=mean(d1(lesK(N).ensK1(n).value));
        VNBeta2=mean(d2(lesK(N).ensK2(n).value));
        %VNBeta3=mean(d3(lesK(N).ensK2(n).value));
        Hbeta(N).estim(n).value1=log2(VNBeta2/VNBeta1)/2;
        %Hbeta(N).estim(n).value2=log2(VNBeta3/VNBeta1)/2;
        %Hbeta(N).estim(n).value3=log2((VNBeta2+VNBeta3)/VNBeta1)/2-1/2;
        
    end
end
%%
Htilde=struct([]);
Htildediscret=struct([]);
for N=1:length(Inter)
    Sinter=size(Inter(N).value);
    Htildediscret(N).value=[];
    for n=1:Sinter(1)-1
    Htilde(N).theta(n).value=(1-PEInvtheta(N).* ...
    (Inter(N).value(n,:)-n.*theta(N))).* Hbeta(N).estim(n).value1+...
    PEInvtheta(N).*(Inter(N).value(n,:)-n.*theta(N)).* ...
    Hbeta(N).estim(n+1).value1;
    Htildediscret(N).value=[Htildediscret(N).value Htilde(N).theta(n).value];
    end
    Htilde(N).theta(Sinter(1)).value=Hbeta(N).estim(Sinter(1)).value1.*...
            ones(1,length(Inter(N).value(end,:)));
    Htildediscret(N).value=[Htildediscret(N).value Htilde(N).theta(Sinter(1)).value];
end







% %%
% results.L=L;
% results.filtre=a;
% results.N0=b;
% results.N1=N1;
% results.N2=N2;
% results.H=H;
% results.minH=min(H);


