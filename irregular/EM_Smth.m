function [valh,alphah]=EM_Smth(val0,Noise_Var,Jp)

% smoothing observed parameters val0 using EM algorithm 
% Yu Hang, Mar. 2012, NTU

p=size(Jp,1);
alpha0=0;
Rinv=sparse(diag(Noise_Var.^-1));
pp=1;
while 1
    x=(alpha0*Jp+Rinv)\Rinv*val0';
    alphah=p/(trace(Jp/(alpha0*Jp+Rinv))+x'*Jp*x);
    if abs(alphah-alpha0)<1e-4 || rcond(full(alpha0*Jp+Rinv))<5e-16 || pp>1000
        break;
    else
        alpha0=alphah;
    end
    pp=pp+1;
end

if rcond(full(alpha0*Jp+Rinv))<5e-16 ||pp>1000
    valh=val0*Noise_Var'/sum(Noise_Var)*ones(1,p);
    alphah=Inf;
else
    valh=x';
end