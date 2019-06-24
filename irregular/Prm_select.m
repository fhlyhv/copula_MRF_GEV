function X1=Prm_select(S,K_est)


%%*************************************************************************
%% Solve: 
%% min { <X1,Sigma> - logdetX1 + M<K_est,Xs>
%%
%% X1 - Xs = 0. 
%% X1 positive definite
%%
%%*************************************************************************

   HOME = '.\LogdetPPA-0'; 
   addpath(strcat(HOME,'/solver/'))
   addpath(strcat(HOME,'/solver/mexfun'))
   addpath(strcat(HOME,'/util/'))
   ttime  = clock;
%% set up SDP data in SDPT3 format
%%
     n = length(S); 
     invD = speye(n,n);
     C{1} = S; 
     blk{1,1}= 's'; blk{1,2} = n;
     n2 = n*(n+1)/2; 
     %%
     %% generate At corresponding to X_Omega  
     %%
     [Iomega, Jomega] = find(triu(K_est==0)); 
     m = length(Iomega);
     b = zeros(m,1);
     if (length(Iomega))
        Itmp = Iomega + Jomega.*(Jomega-1)/2; 
        At{1} = spconvert([Itmp,[1:m]',ones(m,1); n2,m,0]); 
     else
         At{1} = [];
     end
     mu = 1; 
      
      %% 
%       blk{2,1} = 's'; blk{2,2} = n;
%       At{2,1}  = Identity; 
%       C{2,1}   = lambda*speye(n,n); 
      %%
%       blk{2,1} = 'l'; blk{2,2} = n2;  
%       At{2,1} = -Identity;
%       [row, col] = find(triu(K_est==1)); 
%       idx = row + col.*(col-1)/2;
%       ee  = 1e10*ones(n2,1);
%       ee(idx) = zeros(length(idx),1); 
%       C{2,1} = ee;
      fprintf('\n Set up data time = %3.2f',etime(clock,ttime)); 
      runPPA = 1; 
      if (runPPA)
         OPTIONS.smoothing  = 1;
         OPTIONS.scale_data = 0; %% or 2;
         OPTIONS.plotyes    = 0; 
         OPTIONS.tol        = 1e-6;
         [obj,X,y,Z,runhist] = logdetPPA(blk,At,C,b,mu,OPTIONS);
         %obj = sum(sum(Sigma.*X{1}))-sum(log(eig(X{1})))+rho*sum(sum(abs(X{1}))); 
         X1 = invD*X{1}*invD; X1 = 0.5*(X1+X1');   
%          X2 = invD*X{2}*invD; X2 = 0.5*(X2+X2');   
      end
%%*************************************************************************
