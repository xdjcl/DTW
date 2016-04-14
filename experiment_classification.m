% An experiment of classification
% the data is getting from experiment_data.m
%
% Jingchang Liu
% 2016/04/14

%% get data from experiment_data.m
run experiment_data.m;
data = [A_1,A_2,A_3,A_4,B_1,B_2,B_3,B_4,...
     C_1,C_2,C_3,C_4,D_1,D_2,D_3,D_4];

%% classifing by euclidean distance
% classify sequence to *_train
%
% euclidean_dist:euclidean for each label
% classify_result:result of each sequence
% count: correct classification number
euclidean_dist = ones(4,1);
count = 0;
classify_result = repmat(['A'],[16 1]);
for k = 1:16
    euclidean_dist(1) = norm(data(:,k)-A_train(1));
    euclidean_dist(2) = norm(data(:,k)-B_train(1));
    euclidean_dist(3) = norm(data(:,k)-C_train(1));
    euclidean_dist(4) = norm(data(:,k)-D_train(1));
    temp = find(euclidean_dist == min(euclidean_dist),1);
    
    % correct classification
    if((k==1 || k==2 || k==3 || k==4) && temp==1) ||...
            ((k==5 || k==6 || k==7 || k==8) && temp==2) ||...
            ((k==9 || k==10 || k==11 || k==12) && temp==3)||...
            ((k==13 || k==14 || k==15 || k==16) && temp==4)
        count = count+1;
    end
    
    classify_result(k) = labels(temp);
    fprintf('%s : %c \n',test_set{k},classify_result(k))
end
fprintf('By euclidean distance,the accuracy is: %f \n',count/16)
fprintf('\n##################################################\n\n')

%% classifing by dtw distance
dtw_dist = ones(4,1);
count2 = 0;
classify_result2 = repmat(['A'],[16 1]);
for k = 1:16
    dtw_dist(1) = dtw(data(:,k),A_train(1));
    dtw_dist(2) = dtw(data(:,k),B_train(1));
    dtw_dist(3) = dtw(data(:,k),C_train(1));
    dtw_dist(4) = dtw(data(:,k),D_train(1));
    temp = find(dtw_dist == min(dtw_dist),1);
    
    % correct classification
    if((k==1 || k==2 || k==3 || k==4) && temp==1) ||...
            ((k==5 || k==6 || k==7 || k==8) && temp==2) ||...
            ((k==9 || k==10 || k==11 || k==12) && temp==3)||...
            ((k==13 || k==14 || k==15 || k==16) && temp==4)
        count2 = count2+1;
    end
    
    classify_result2(k) = labels(temp);
    fprintf('%s : %c \n',test_set{k},classify_result2(k))
end
fprintf('By dtw distance,the accuracy is: %f \n',count2/16)
