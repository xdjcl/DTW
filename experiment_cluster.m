% An experiment of hierarchical clustering
% the data is getting from experiment_data.m
%
% Jingchang Liu
% 2016/04/12

%% get data from experiment_data.m
run experiment_data.m;

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
    'C_1';'C_2';'C_3';'C_4';'D_1';'D_2';'D_3';'D_4'};
H = dendrogram(Z,'orientation','right','labels',obslabel,...
    'colorthreshold','default');
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
    'colorthreshold','default');
title('clustering by the dtw distance')
set(H2,'LineWidth',2,'color','r')
