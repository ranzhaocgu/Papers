function [s] = sigma(u,v,alpha)
s=(1+v-1/alpha)^(-1).*( ((u-1).*((u-1)>0)).^(1+v-1/alpha)-((u).*(u>0)).^(1+v-1/alpha) );
end

