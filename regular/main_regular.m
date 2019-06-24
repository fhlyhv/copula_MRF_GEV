clear all;
%clc;
%matlabpool 4

%% read data
load artiData(16x16)_L; %column-major index
Xtrain=XDat(:,1:256);
[n,p]=size(Xtrain);
s1=16;
s2=16;
Jp=thin_membrane(s1,s2); %s1 num of rows, s2 num of cols
   
%% bootstrapping
N=3000;   %no. of bootstrap subsets
Id=bootstrap(Xtrain,N);

%% GEV fitting and smoothing
[L0,G0,S0,L_Var,G_Var,S_Var] = GEVPrm_bootstrap (Xtrain,N,Id);
[Lh,alpha_u]=EM_Smth(L0,L_Var,Jp);
[Gh,alpha_g]=EM_Smth(G0,G_Var,Jp);
[Sh,alpha_s]=EM_Smth(S0,S_Var,Jp);

%% couple waveheights for all the sites using copula Gaussian thin-membrane model
GXtrain = gcopula(Xtrain,Lh,Gh,Sh);
Semp=cov(GXtrain,1);
K=gaussIPF(Jp,Semp,1);  %1e-4,50

%% interpolation
Xtrue=XDat(:,257:end);
Ltttest=Ltt(257:end);
Lngtest=Lng(257:end);


%% interpolating parameters using IDW: only consider four nearest neighbours
Gtest=Prm_interpolation(Ltttest,Lngtest,Gh,alpha_g,s1); %only num of rows needed due to the col-major index
Stest=Prm_interpolation(Ltttest,Lngtest,Sh,alpha_s,s1);
Ltest=Prm_interpolation(Ltttest,Lngtest,Lh,alpha_u,s1);

%% interpolating waveheights in the latent Gaussian layer using MIDW
GXtest=Val_interpolation(Ltttest,Lngtest,GXtrain,K,s1);

%% convert to GEV
Xtest=gevinv(normcdf(GXtest),repmat(Gtest,n,1),repmat(Stest,n,1),repmat(Ltest,n,1));

%% save result
% save result_artiData(16x16)_L L0 G0 S0 L_Var G_Var S_Var Lh Gh Sh alpha_u alpha_g alpha_s K Xtrue Ltttest Lngtest Xtest Xtrue Xtrain;