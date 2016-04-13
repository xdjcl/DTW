% An experiment by hierarchical clustering
%
% Jingchang Liu
% 2016/04/12

%% generate four kinds sequences A,B,C,D
% To A Gauss Distribution
% suppoose, mu:The average delta:The variance
% A_1,A_2,A_3,A_4:four sequences,Gauss distribution with mu=0,dalta^2=1
% B_1,B_2,B_3,B_4:four sequences Gauss distribution with mu=1,dalta^2=1
% C_1,C_2,C_3,C_4:four sequences Gauss distribution with mu=4,dalta^2=1
% D_1,D_2,D_3,D_4:four sequences Gauss distribution with mu=5,dalta^2=1
A = normrnd(0,1,200,4);
    A_1 = A(:,1);
    A_2 = A(:,2);
    A_3 = A(:,3);
    A_4 = A(:,4);


B = normrnd(0.5,1,200,4);
    B_1 = B(:,1);
    B_2 = B(:,2);
    B_3 = B(:,3);
    B_4 = B(:,4);
    
C = normrnd(1.5,1,200,4);
    C_1 = C(:,1);
    C_2 = C(:,2);
    C_3 = C(:,3);
    C_4 = C(:,4);
    
D = normrnd(2,1,200,4);
    D_1 = D(:,1);
    D_2 = D(:,2);
    D_3 = D(:,3);
    D_4 = D(:,4);

%% clustering by euclidean distance
% observation data
x = [A_1,A_2,A_3,A_4,B_1,B_2,B_3,B_4,...
     C_1,C_2,C_3,C_4,D_1,D_2,D_3,D_4]';
% euclidean distance
y = pdist(x);
% get the cluster tree
Z = linkage(y);
% graph the dendrogram
obslabel = {'A_1';'A_2';'A_3';'A_4';'B_1';'B_2';'B_3';'B_4';...
    'C_1';'C_2';'C_3';'C_4';'D_1';'D_2';'D_3';'D_4'}
H = dendrogram(Z,'orientation','right','labels',obslabel,...
    'colorthreshold','default')
title('clustering by the euclidean distance')
set(H,'LineWidth',2,'color','k')

%% clustering by DTW
% dtw distance
y2 = pdist(x,@dist_dtw);
% get the cluster tree
Z2 = linkage(y2);
% graph the dendrogram
figure;
H2 = dendrogram(Z2,'orientation','right','labels',obslabel,...
    'colorthreshold','default')
title('clustering by the dtw distance')
set(H2,'LineWidth',2,'color','r')