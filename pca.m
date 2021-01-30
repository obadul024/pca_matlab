clear all, close all, clc 

%T = readtable('iris.csv');
##
##T = dataframe('iris.csv');
##
##T = T(:,1:4);
##iris = table2array(T);
##plot(iris)

iris = [ 5.1,3.5,1.4,0.2; 
4.9,3.0,1.4,0.2;
4.7,3.2,1.3,0.2;
4.6,3.1,1.5,0.2;
5.0,3.6,1.4,0.2;
5.4,3.9,1.7,0.4;
4.6,3.4,1.4,0.3;
5.0,3.4,1.5,0.2;
4.4,2.9,1.4,0.2;
4.9,3.1,1.5,0.1;
5.4,3.7,1.5,0.2;
4.8,3.4,1.6,0.2;
4.8,3.0,1.4,0.1;
4.3,3.0,1.1,0.1;
5.8,4.0,1.2,0.2;
5.7,4.4,1.5,0.4;
5.4,3.9,1.3,0.4 ];


% mean subtract Iris Data from itself
irisMean = mean(iris,2);
 [m,n] = size(irisMean);
 nPoints  = m*n;
 Z = iris - irisMean*ones(1,n);
 
 % Calculate Z'Z 
 B =  Z*Z';
 % Get eigen Vectors and Eigen Values of Z'Z
 [V, D, W] = eig(B);
 
 % Sort the Diagonal eigen Values into descending order
 DSorted = diag(D);
 
[D_new, idx ] = sort(DSorted, "descend");

% Arrange Eigen Vectors according to order of Eigen Values
D_new = diag(D_new);
P_star  = V(:,idx); 
 
% Calculate the Z* = ZP* ==> where P* is the eigen vectors

 Z_star = P_star*Z;
 
 % To get PCA =1 
 Z_star(:,1);
 
 % Plotting PCA = 1,2,3 
 scatter3(Z_star(:,1),Z_star(:,2),Z_star(:,3));
 