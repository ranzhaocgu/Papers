function [R,t]=htf(N,f,alpha,H)
    %%%%%on discrétise finement [0,1]  
    t=[0:2^(-f):1];
    %%taille du vecteur reponse
    R=zeros(1,length(t));
    %%%%les variables aléatoires
    s=[0:2^(-N):1];
    beta=0;
    L=[0;asmlevy(2^N,alpha,beta)];
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
    J1=2.^(-repmat([0:N-1]',1,2^(N-1)));
    J2=2.^(repmat([0:N-1]',1,2^(N-1)).*(1-1/alpha));
    K2=(K0).*J1;   %2k/2^(j+1)
    K3=(K0+.5).*J1;   %2k+1/2^(j+1)
    K4=(K0+1).*J1;   %2k+2/2^(j+1)
   
    for i=1:length(t)
            T=t(i)*ones(N,2^(N-1));
            P1=T-K2;
            P2=T-K3;
            P3=T-K4;
            Theta=((P1).*(P1>0)).^(H(i)+1-1/alpha)-2*((P2).*(P2>0)).^(H(i)+1-1/alpha)+((P3).*(P3>0)).^(H(i)+1-1/alpha);
            Sigma=J2.*Theta.*E./(H(i)+1-1/alpha);
            R(i)=E0*(t(i))^(H(i)+1-1/alpha)/(H(i)+1-1/alpha)+sum(sum(Sigma,2),1);
    end
end 


