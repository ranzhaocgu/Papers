%%%%simulation MSM
debut=cputime;
N1=12;f=12;N2=N1/2;t=[0:2^(-f):1];

%%%exemple 1 : le cas constant
alpha1=1.2;
H1=eval('0.98.*ones(length(t))');
R1=htf3(N1,f,alpha1,H1);
B1=bsf(N2,f,alpha1,H1);
Z1=R1+B1;
% figure;
% plot(t,R1)
% title(['Haute fr�quence de param�tres \alpha=' num2str(alpha1), ' et H(t)=0.7'])
% figure;
% plot(t,B1)
% title(['Basse fr�quence de param�tres \alpha=' num2str(alpha1), ' et H(t)=0.7'])
figure;
plotyy(t,Z1,t,H1)
title(['MFSL de param�tres \alpha=' num2str(alpha1), ' et H=' num2str(H1(1))])
% figure;
% plot(t,H1)
% title('Param�tre de Hurst')

%%%%%exemple 2 : le cas 0.15.*sin(4*pi*t)+0.8
 %H2=eval('0.15.*sin(4*pi*t)+0.8');
 %alpha2=1.6;
 %R2=htf(N1,f,alpha2,H2);
 %B2=bsf(N2,f,alpha2,H2);
 %Z2=R2+B2;
% figure;
% plot(t,R2)
% title(['Haute fr�quence de param�tres \alpha=' num2str(alpha2), ' et H(t)=0.2 sin(4 \pi t) +0.8'])
% figure;
% plot(t,B2)
% title(['Basse fr�quence de param�tres \alpha=' num2str(alpha2), ' et H(t)=0.2 sin(4 \pi t) +0.8'])
% figure;
%plotyy(t,Z2,t,H2)
%title(['MMSL de param�tres \alpha=' num2str(alpha2), ' et H(t)=0.2 sin(4 \pi t) +0.8'])
% figure;
% plot(t,H2)
% title('Param�tre de Hurst')

% %%%%exemple 3 : logistique 0.75+0.20./(1+exp(-100*(t-0.5)))
%H3=eval('0.65+0.25./(1+exp(100*(t-0.5)))');
%alpha3=1.6;
%R3=htf(N1,f,alpha3,H3);
%B3=bsf(N2,f,alpha3,H3);
%Z3=R3+B3;
%figure;
%plot(t,R3)
%title(['Haute fr�quence de param�tres \alpha=' num2str(alpha3), ' et H(t)=0.65+0.25/(1+exp(100*(t-0.5)))'])
%figure;
%plot(t,B3)
%title(['Basse fr�quence de param�tres \alpha=' num2str(alpha3), ' et H(t)=0.65+0.25/(1+exp(100*(t-0.5)))'])
%figure;
%plotyy(t,Z3,t,H3)
%title(['MMSL de param�tres \alpha=' num2str(alpha3), ' et H(t)=0.65+0.25/(1+exp(100*(t-0.5)))'])
%figure;
%plot(t,H3)
%title('Param�tre de Hurst')

%%%%exemple 4 : le cas lineaire
% H4=eval('0.9-0.10.*t');
% alpha4=1.5;
% R4=htf(N1,f,alpha4,H4);
% B4=bsf(N2,f,alpha4,H4);
% Z4=R4+B4;
% figure;
% plot(t,R4)
% title(['Haute fr�quence de param�tres \alpha=' num2str(alpha4), ' et H(t)=0.9-0.2 t'])
% figure;
% plot(t,B4)
% title(['Basse fr�quence de param�tres \alpha=' num2str(alpha4), ' et H(t)=0.9-0.2 t'])
% figure;
% plot(t,Z4)
% title(['MMSL de param�tres \alpha=' num2str(alpha4), ' et H(t)=0.9-0.2 t'])
% figure;
% plot(t,H4)
% title('Param�tre de Hurst')

%%%%%exemple 5 : le cas du MB
% H5=fbmwoodchan(length(t),0.3,'support',1,'sigma',1);
% alpha5=1.3;
% %%renormalisation
% b=1-0.01; a=1/alpha5+0.01;
% HH5=a+(b-a).*(H5-min(H5))./(max(H5)-min(H5));
% R5=htf(N1,f,alpha5,HH5);
% B5=bsf(N2,f,alpha5,HH5);
% Z5=R5+B5;
% figure;
% plot(t,R5)
% title(['Haute fr�quence de param�tre \alpha=' num2str(alpha5)])
% figure;
% plot(t,B5)
% title(['Basse fr�quence de param�tre \alpha=' num2str(alpha5)])
% figure;
% plot(t,Z5)
% title(['MMSL de param�tre \alpha=' num2str(alpha5)])
% figure;
% plot(t,HH5)
% title('Param�tre de Hurst al�atoire')


%%%%exemple 4 : le cas parabolique

% alpha6=1.4;
% H6=eval('0.7.*(t-0.5).^2+1/alpha6+0.01');
% R6=htf(N1,f,alpha6,H6);
% B6=bsf(N2,f,alpha6,H6);
% Z6=R6+B6;
% figure;
% plot(t,R6)
% title(['Haute fr�quence de param�tres \alpha=' num2str(alpha6), ' et H(t)=0.7(t-0.5)^2+1/ \alpha+0.01'])
% figure;
% plot(t,B6)
% title(['Basse fr�quence de param�tres \alpha=' num2str(alpha6), ' et H(t)=0.7(t-0.5)^2+1/ \alpha+0.01'])
% figure;
% plot(t,Z6)
% title(['MMSL de param�tres \alpha=' num2str(alpha6), ' et H(t)=0.7(t-0.5)^2+1/ \alpha+0.01'])
% figure;
% plot(t,H6)
% title('Param�tre de Hurst')

% figure;
% subplot(221)
% plotyy(t,Z2,t,H2)
% title(['MMSL de param�tres \alpha=' num2str(alpha2), ' et H(t)=0.2 sin(4 \pi t) +0.8'])
% subplot(222)
% plotyy(t,Z3,t,H3)
% title(['MMSL de param�tres \alpha=' num2str(alpha3), ' et H(t)=0.65+0.25/(1+exp(100*(t-0.5)))'])
% subplot(223)
% plotyy(t,Z4,t,H4)
% title(['MMSL de param�tres \alpha=' num2str(alpha4), ' et H(t)=0.9-0.2 t'])
% subplot(224)
% plotyy(t,Z6,t,H6)
% title(['MMSL de param�tres \alpha=' num2str(alpha6), ' et H(t)=0.7(t-0.5)^2+1/ \alpha+0.01'])

%figure;
% subplot(211)
% plotyy(t,Z2,t,H2)
% title(['LMSM of stability parameter \alpha=' num2str(alpha2), ' and H(t)=0.2 sin(4 \pi t) +0.8'])
% subplot(212)
%plotyy(t,Z4,t,H4)
%title(['LMSM of stability parameter \alpha=' num2str(alpha4), ' and H(t)=0.9-0.1 t'])

fin=cputime-debut