% generate four kinds sequences A,B,C,D
%
% JingChang Liu
% 2016/04/14
%
% To A Gauss Distribution
% suppoose, mu:The average delta:The variance
% A_1,A_2,A_3,A_4:four sequences,Gauss distribution with mu=0,dalta^2=1
% B_1,B_2,B_3,B_4:four sequences Gauss distribution with mu=1,dalta^2=1
% C_1,C_2,C_3,C_4:four sequences Gauss distribution with mu=4,dalta^2=1
% D_1,D_2,D_3,D_4:four sequences Gauss distribution with mu=5,dalta^2=1
% *_train:train set for classification

ctime = datestr(now, 30);
tseed = str2num(ctime((end - 5):end));
rand('seed', tseed);
disturbance = rand(1000,20);

A_1 = disturbance(:,1);
A_2 = disturbance(:,2);
A_3 = disturbance(:,3);
A_4 = disturbance(:,4);
A_train = disturbance(:,5);

B_1 = 0.3+disturbance(:,6);
B_2 = 0.3+disturbance(:,7);
B_3 = 0.3+disturbance(:,8);
B_4 = 0.3+disturbance(:,9);
B_train = 0.3+disturbance(:,10);
    
C_1 = 0.5+disturbance(:,11);
C_2 = 0.5+disturbance(:,12);
C_3 = 0.5+disturbance(:,13);
C_4 = 0.5+disturbance(:,14);
C_train = 0.5+disturbance(:,15);
    
D_1 = 1+disturbance(:,16);
D_2 = 1+disturbance(:,17);
D_3 = 1+disturbance(:,18);
D_4 = 1+disturbance(:,19);
D_train = 1+disturbance(:,20);
    
test_set = {'A_1','A_2','A_3','A_4','B_1','B_2','B_3','B_4',...
    'C_1','C_2','C_3','C_4','D_1','D_2','D_3','D_4'}';
labels = ['A','B','C','D']';
