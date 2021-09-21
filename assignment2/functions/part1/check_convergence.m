function [has_converged, tol_iter] = check_convergence(Mu, Mu_previous, iter, tol_iter, MaxIter, MaxTolIter, tolerance)
%CHECK_CONVERGENCE Check if the kmeans main loop has converged to a
%solution
er=norm(Mu-Mu_previous,'fro');


if (iter>MaxIter)||(tol_iter>MaxTolIter)
    has_converged=true;
   % tol_iter=0;
else
    if er<tolerance
    iter=iter+1;
    tol_iter=tol_iter+1;
    
    end
   has_converged=false;
end
%
%   input -----------------------------------------------------------------
%   
%       o Mu : Current value of the centroids
%       o Mu_previous : Previous value of the centroids
%       o iter : Current number of iterations
%       0 tol_iter : Number of iterations since Mu = Mu_previous
%       o MaxIter : Maximum number of iterations
%       o MaxTolIter : Maximum number of iterations for stabilization (Mu =
%       Mu_previous)
%       o tolerance : tolerance for considering Mu = Mu_previous
%
%   output ----------------------------------------------------------------
%
%       o has_converged : true if one of the convergence situation is met
%       o tol_iter : previous tol_iter incremented if stabilization but no
%       convergence, 0 otherwise
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tol=MaxTolIter;
% LM=MaxIter;
% count=0;
% for i=1:1:LM+1
% count=count+1;
% Mu_previous=Mu;
% Mu
% if (count==LM)||(er<=tol)
%     has_converged= true;
%     tol_iter=0;
%     break;
% end
% 
% if count<=LM
%   has_converged=true;
%   tol_iter=0;
% else 
%   has_converged=false;
%   tol_iter=er;
% end
%     

    
    




end
