%%% rlistcoefdiscret
%
% 12/11/2013
% J. H
%
% retourne la liste des coefficients
% du filtre discret à K moments nuls
%
% K : nombre de moments nuls i.e. longueur
% du filtre = K+1
%
% a : vecteur réponse.
%
%-------------------------------------

function [a]=rlistcoefdiscret(K);

if ~(K>0),
	mess=[' filtre non implante'];
	disp(mess);
	return;
else
 a=zeros(1,K+1);
 for k=0:K
     a(k+1)=(-1)^(K-k)*nchoosek(K,k);
 end
 
end