%%%N : nb de niveaux de résolution
%%%alpha : indice de stabilité de la mesure sas alpha in (1,2)
%%%H un vecteur contenant les valeurs du paramètre fonctionnel
function [B,t]=bsf(N,f,alpha,H)
t=[0:2^(-f):1];
B=zeros(1,length(t));

s1=(-2^(2*N):1:-2^N-1);
s2=(-2^N:2^(-N):0);
s=[s1,s2];
p=length(s);
beta=0;
La=[0;asmlevy(p,alpha,beta)];


E=zeros(2*N-1,2^N);
for j=-N+1:-1
    for k=1:2^(N-abs(j))
       E(j+N,k)=-2^(j/alpha)*(La(find(s==(-k).*2^(-j)))-2*La(find(s==(-k+0.5).*2^(-j)))+La(find(s==(-k+1)*2^(-j))));
    end
end

J1=2.^repmat([-N+1:N-1]',1,2^N);

for i=1:length(t)
    U=t(i)*ones(2*N-1,2^N);
    L=repmat([1:2^N],2*N-1,1);
    J2=2.^(-repmat([-N+1:N-1]',1,2^N).*H(i));
    Lambda1=J2.*(theta(J1.*U+L,H(i),alpha)-theta(L,H(i),alpha));
    B(i)=sum(sum(Lambda1.*E,1),2);
end
end