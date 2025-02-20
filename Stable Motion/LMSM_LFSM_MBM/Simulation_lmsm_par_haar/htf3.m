%%%2^f+1 points
function [R,t]=htf3(N,f,alpha,H)
    %%%%%on discrétise finement [0,1]  
    t=[0:2^(-f):1];
    %%taille du vecteur reponse
    R=zeros(1,length(t));
    %%%%les variables aléatoires
    s=[0:2^(-N):1];
    L=monlevy(alpha,length(s));
    E=zeros(N,2^(N-1));
    for j=0:N-1
        for k=0:2^j-1
            E(j+1,k+1)=-2^(j/alpha)*(L(find(s==k*2^(-j)))-2*L(find(s==(k+0.5)*2^(-j)))+L(find(s==(k+1)*2^(-j))));
        end
    end
    E0=L(end);
     
    %%%%%%%%%%%%coefficients d'ondelettes
    Theta=zeros(size(E));
    %%%%%%%%%%%%%%%%%%%
    K0=repmat([0:(2^(N-1))-1],N,1);
    J1=2.^(-[0:N-1]);
    J2=2.^(repmat([0:N-1]',1,2^(N-1)));
    
   for i=1:length(t)
            v=1+H(i)-1/alpha;
            Theta=theta(J2*t(i)-K0,H(i),alpha);
            Sigma=(J1.^(H(i)))*sum(Theta.*E,2);
            R(i)=E0*(t(i))^(v)/(v)+Sigma;
    end
end 


