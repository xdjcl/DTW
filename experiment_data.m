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
disturbance = rand(100,32);

A_1 = disturbance(:,1);
A_2 = disturbance(:,2);
A_3 = disturbance(:,3);
A_4 = disturbance(:,4);
A_train1 = disturbance(:,5);
A_train2 = disturbance(:,6);
A_train3 = disturbance(:,7);
A_train4 = disturbance(:,8);

B_1 = interval+disturbance(:,9);
B_2 = interval+disturbance(:,10);
B_3 = interval+disturbance(:,11);
B_4 = interval+disturbance(:,12);
B_train1 = interval+disturbance(:,13);
B_train2 = interval+disturbance(:,14);
B_train3 = interval+disturbance(:,15);
B_train4 = interval+disturbance(:,16);    

C_1 = interval*2+disturbance(:,17);
C_2 = interval*2+disturbance(:,18);
C_3 = interval*2+disturbance(:,19);
C_4 = interval*2+disturbance(:,20);
C_train1 = interval*2+disturbance(:,21);
C_train2 = interval*2+disturbance(:,22);
C_train3 = interval*2+disturbance(:,23);
C_train4 = interval*2+disturbance(:,24);
    
D_1 = interval*3+disturbance(:,25);
D_2 = interval*3+disturbance(:,26);
D_3 = interval*3+disturbance(:,27);
D_4 = interval*3+disturbance(:,28);
D_train1 = interval*3+disturbance(:,29);
D_train2 = interval*3+disturbance(:,30);
D_train3 = interval*3+disturbance(:,31);
D_train4 = interval*3+disturbance(:,32);
    
test_set = {'A_1','A_2','A_3','A_4','B_1','B_2','B_3','B_4',...
    'C_1','C_2','C_3','C_4','D_1','D_2','D_3','D_4'}';
labels = ['A','B','C','D']';
