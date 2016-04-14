% An experiment of classification with different warp window
% the data is getting from experiment_data.m
%
% Jingchang Liu
% 2016/04/14

%% classifing by dtw distance with different warp window
% precision_result: record precision for different warp window
% t:repeat time of classification
% count: record number of correct classification
precision_result = ones(500,1);
for w = 1:500
    count = 0;
    for t = 1:100
        run experiment_data.m;
        data = [A_1,A_2,A_3,A_4,B_1,B_2,B_3,B_4,...
            C_1,C_2,C_3,C_4,D_1,D_2,D_3,D_4];
        dtw_dist = ones(4,1);
        classify_result2 = repmat(['A'],[16 1]);
        
        for k = 1:16
            dtw_dist(1) = dtw(data(:,k),A_train(1),w);
            dtw_dist(2) = dtw(data(:,k),B_train(1),w);
            dtw_dist(3) = dtw(data(:,k),C_train(1),w);
            dtw_dist(4) = dtw(data(:,k),D_train(1),w);
            temp = find(dtw_dist == min(dtw_dist),1);
            
            % correct classification
            if((k==1 || k==2 || k==3 || k==4) && temp==1) ||...
                    ((k==5 || k==6 || k==7 || k==8) && temp==2) ||...
                    ((k==9 || k==10 || k==11 || k==12) && temp==3)||...
                    ((k==13 || k==14 || k==15 || k==16) && temp==4)
                count = count+1;
            end
        end
    end
    precision_result(w) = count/1600;
end
