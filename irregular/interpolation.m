function x0=interpolation(x1,x2,x3,id0,id1,id2,id3,alpha1,alpha2,alpha3)

% Inverse distance weighted interpolation
% Yu Hang, Mar. 2012, NTU

if nargin < 8
    error('Invalid number of parameters.');
elseif nargin == 8
    alpha2=alpha1;
    alpha3=alpha1;
end

w1=alpha1/sum((id0-id1).^2);
w2=alpha2/sum((id0-id2).^2);
w3=alpha3/sum((id0-id3).^2);
    
x0=(x1*w1+x2*w2+x3*w3)/(w1+w2+w3);

if isnan(x0)==1
    fprintf('nan');
end
