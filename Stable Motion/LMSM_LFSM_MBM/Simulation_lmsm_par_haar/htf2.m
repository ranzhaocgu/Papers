function [R,t]=htf2(J,f,alpha,H)
%%%% J : niveau de troncature de la serie
%%%% f : finesse de la grille
%%%% alpha : indice de stabilite entre ]1,2[
%%%% H : un reel entre ]1/alpha,1[
t=[0:2^(-f):1];
R=zeros(1,length(t));

X=[0,stblrnd(alpha,0,1,0,1,2^J-1)];
L=[0:1:2^J-1];

for i=1:length(t)
R(i)=2.^(-J.*H).*(sigma(2^J.*t(i)-L,H,alpha)*X');
end
t=t(1:end-1);
R=R(1:end-1);
end