%%%%simulation du Processus de Riemann-Liouville Multifractionnaire Stable
%%%%dans diff�rents cas.
N=12;f=12;t=[0:2^(-f):1];

%%%exemple 1 : le cas fractionnaire
H1=eval('0.7.*ones(length(t))');
alpha1=1.6;
R1=htf3(N,f,alpha1,H1);
figure
plot(t,[R1;H1])

%%%%%exemple 2 : le cas 0.2.*t.*sin(4*pi*t)+0.8
%d=cputime;
% H2=eval('0.2.*t.*sin(4*pi*t)+0.8');
% alpha2=1.7;
% R2=htf(N,f,alpha2,H2);
% figure
% plotyy(t,R2,t,H2)

% W1=htf(N,alpha2,H2);
% W2=htf(N,alpha2,H2);
% W3=htf(N,alpha2,H2);
% W4=htf(N,alpha2,H2);
% W5=htf(N,alpha2,H2);
% plot(t,[W1;W2;W3;W4;W5])
%f=cputime-d

%%%%exemple 3 : logistique 0.75+0.20./(1+exp(-100*(t-0.5)))
% H3=eval('0.75+0.20./(1+exp(-100*(t-0.5)))');
% alpha3=1.6;
% R3=htf3(N,f,alpha3,H3);
% figure
% plotyy(t,R3,t,H3)

%%%%exemple 3 : lin�aire 0.9+0.05.*t
% H4=eval('0.9+0.05.*t');
% alpha4=1.4;
% R4=htf(N,f,alpha4,H4);
% figure
% plotyy(t,R4,t,H4)

%%%%exemple 5 : lin�aire 0.9+0.05.*t
alpha5=1.6;
H5=eval('((t-0.3)/0.7).^2+1/alpha5+0.01');
R5=htf3(N,f,alpha5,H5);
figure
plotyy(t,R5,t,H5)

