%% MBM

p=1000;
gamma=0;
delta=1;
N=2^14; 
t=linspace(gamma,delta,N); 
% H=eval('3*(t-.5).^2+.2');
% H = eval('0.1+0.8*t');
% H=eval('0.8+0.1*sin(4*pi*t)');
% H = eval('0.6+0.4./(1+exp(-100*(t-0.3)))');

L=20;
[results]=minimMBM(gamma,delta,p,L,H);
figure;
subplot(311);
hist(results.HH(1,:),25)
grid on;
subplot(312)
hist(results.HH(2,:),25)
grid on;
subplot(313)
hist(results.HH(3,:),25)
grid on;



%% LMSM

p=1000; L=20; beta=1/2^2; 
gamma=0;delta=1;
N=2^10; t=linspace(0,1,N); 

%cas 1
% alpha = 1.6;
% H=eval('0.1.*sin(4*pi*t)+0.8');
%

% cas2
 H=eval('0.9-0.10.*t');
 alpha=1.5;
%

% cas3
% H=eval('0.65+0.25./(1+exp(100*(t-0.5)))');
% alpha=1.6;
%

% cas4
% H=eval('3*(t-.5).^2+0.6');
% alpha=1.8;


[Est]=minimLMSM(gamma,delta,p,L,beta,alpha,H);

figure;
subplot(311);
hist(Est.HH(1,:),25)
grid on;
subplot(312)
hist(Est.HH(2,:),25)
grid on;
subplot(313)
hist(Est.HH(3,:),25)
grid on;