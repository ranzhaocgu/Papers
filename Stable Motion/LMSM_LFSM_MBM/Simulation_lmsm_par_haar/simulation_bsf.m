%%%%simulation du Processus de Riemann-Liouville Multifractionnaire Stable
%%%%dans diff�rents cas.
N=12;t=[0:2^(-10):1];

%%%exemple 1 : le cas fractionnaire
% H1=eval('0.7.*ones(length(t))');
% alpha1=1.8;
% B1=bsf(N,alpha1,H1);
% figure
% %plot(t,B1)
% plotyy(t,B1,t,H1)

%%%%%exemple 2 : le cas 0.2.*t.*sin(4*pi*t)+0.8
%d=cputime;
H2=eval('0.2.*t.*sin(4*pi*t)+0.8');
alpha2=1.7;
B2=bsf(N,alpha2,H2);
figure
%plot(t,B2)
plotyy(t,B2,t,H2)
%f=cputime-d

%%%%exemple 3 : logistique 0.75+0.20./(1+exp(-100*(t-0.5)))
% H3=eval('0.75+0.20./(1+exp(-100*(t-0.5)))');
% alpha3=1.6;
% B3=BFMSM(N,alpha3,H3,f);
% figure
% plot(t,B3)
% plotyy(t,B3,t,H3)

%%%%exemple 3 : lin�aire 0.9+0.05.*t
% H4=eval('0.9+0.05.*t');
% alpha4=1.4;
% B4=BFMSM(N,alpha4,H4,f);
% figure
% plot(t,B4)
% plotyy(t,B4,t,H4)
