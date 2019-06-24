% artificial data generation for copula MRF-GEV
% Yu Hang, Mar.2012, NTU

clear all;
%% predine
model=1;
s1=16;  %num of rows
s2=16;  %num of cols
numrnd= 400; %number of unobserved random sites
nsample= 315; %sample size



%% generate underlying covariance for Gaussian layer
Phi=180; %range parameter
[col,row]=meshgrid(1:s2,1:s1);
Ltt=row(:);
Lng=col(:);

rrnd=rand(numrnd,1)*(s1-1)+1;
crnd=rand(numrnd,1)*(s2-1)+1;
Ltt=[Ltt;rrnd];
Lng=[Lng;crnd];
p=length(Lng);

Strue=expcor(Ltt,Lng,Phi);

% GXDat=zeros(nsample,p);
% for i=1:315
% rand('state',sum(10000*clock)); 
% GXDat(i,:)=mvnrnd(zeros(1,p),Strue,1);
% end
% I=randperm(1000);
% GXDat=GXall(I(1:315),:);
GXDat=mvnrnd(zeros(1,p),Strue,nsample);
%GXDat=(GXDat-repmat(mean(GXDat),nsample,1))./repmat(var(GXDat,1),nsample,1);

% if model==1
    G=0.4;
    S=2;
    L=5-0.1*(Lng-3)+0.1*(Ltt-7)+0.1*((Lng-15).^2-5.5^2)-0.05*(Lng-4.5).*(Ltt-10.5)-0.06*((Ltt-5).^2-2.5^2);
    XDat=gevinv(0.5*empcdf(GXDat)+0.5*normcdf(GXDat),G,S,repmat(L',nsample,1)); %(empcdf(GXDat)+normcdf(GXDat))/2
%     XDat=gevrnd(G*ones(nsample,p),S*ones(nsample,p),repmat(L',nsample,1));
    save artiData(16x16)_L XDat Lng Ltt;
    save initialVal_L G S L;
% elseif model==2
    G=0.4;
    S=2-0.005*(Lng-8)-0.004*(Ltt-8)+0.03*((Lng-6).^2-1.5^2)-0.02*(Lng-3).*(Ltt-13)-0.01*((Ltt-10).^2-1.5^2);
    L=5-0.1*(Lng-3)+0.1*(Ltt-7)+0.1*((Lng-15).^2-5.5^2)-0.05*(Lng-4.5).*(Ltt-10.5)-0.06*((Ltt-5).^2-2.5^2);
    XDat=gevinv(0.5*empcdf(GXDat)+0.5*normcdf(GXDat),G*ones(nsample,p),repmat(S',nsample,1),repmat(L',nsample,1)); %(empcdf(GXDat)+normcdf(GXDat))/2
    save artiData(16x16)_SL XDat Lng Ltt;
    save initialVal_SL G S L;
% else
%     G=0.2-0.05*(Lng-5)-0.005*(Ltt-5)+0.001*((Lng-5).^2-1.2^2)-0.005*(Lng-5).*(Ltt-5)-0.002*((Lng-5).^2-1.2^2);
%     S=2-0.005*(Lng-5)-0.04*(Ltt-5)+0.01*((Lng-6.5).^2-7.5^2)-0.05*(Lng-3).*(Ltt-5.5)-0.01*((Ltt-4.5).^2-1.5^2);
%     L=4+0.002*(Lng-3)+0.002*(Ltt-7)+0.01*((Lng-5).^2-5.5^2)-0.005*(Lng-4.5).*(Ltt-6.5)-0.01*((Ltt-5).^2-2.5^2);
%     XDat=gevinv(normcdf(GXDat),repmat(G',nsample,1),repmat(S',nsample,1),repmat(L',nsample,1)); %(empcdf(GXDat)+normcdf(GXDat))/2
%     save artiData(16x16)_GSL XDat Lng Ltt;
%     save initialVal_GSL G S L;
% end