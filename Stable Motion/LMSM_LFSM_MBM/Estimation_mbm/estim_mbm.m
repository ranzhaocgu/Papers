%%
p=10;
N=2^14; t=linspace(0,1,N); 
%H = eval('0.1+0.8*t');
%H=eval('0.5+0.3*sin(4*pi*t)');

H=eval('3*(t-.5).^2+.2');
L=20;
[a]=rlistcoefdiscret(L);
i0=fix(length(a)/2)+1;

HH=zeros(3,p);

for i=1:p

signal=mBmQuantifKrigeage(N,H,10,'support',1,'sigma',1);


signal1=[0,signal(1:end-1)'];
signal2=signal1(1:2:end);
signal3=signal1(2:2:end);

    d1=cconv(signal1,a,i0);
    VNBeta1=mean(abs(d1).^(2));

    d2=cconv(signal2,a,i0);
    VNBeta2=mean(abs(d2).^(2));
    
    d3=cconv(signal3,a,i0);
    VNBeta3=mean(abs(d3).^(2));

    HH(1,i)=log2(VNBeta2/VNBeta1)/2;
    HH(2,i)=log2(VNBeta3/VNBeta1)/2;
    HH(3,i)=log2((VNBeta2+VNBeta3)/VNBeta1)/2-1/2;

end

    result.N=log2(N);
    result.H=H;
    result.alpha=2;
    result.beta=2;
    result.L=L;
    result.p=p;
    result.d1=d1;
    result.d2=d2;
    result.d3=d3;
    result.HH=HH;

figure;
subplot(411);
hist(result.HH(1,:),25)
subplot(412)
hist(result.HH(2,:),25)
subplot(413)
hist(result.HH(3,:),25)

% lepath= '/Users/hamonier/Documents/ARTICLE(estimH)/EstimH(nouvelle-version)/simulation/MBM/cas_periodique/'
% filename=['results.mat']
% save([lepath filename],'results')


%%