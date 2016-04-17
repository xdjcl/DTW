accuracy = ones(20,1);%% TO get accuracy in different intervals by Euclid distance
% intervals:intervals to generate data for experiment_data.m
% repeat: repeat number
% accuracy:record accuracy for each interval

accuracy = ones(20,1);
for interval = 0.005:0.005:0.2
    i = 1;
    % recorde corret_num in each interval
    record = ones(100,1);
    for rep = 1:100
        %% get data from experiment_data.m
        run experiment_data.m;
        data_test = [A_1,A_2,A_3,A_4,B_1,B_2,B_3,B_4,...
            C_1,C_2,C_3,C_4,D_1,D_2,D_3,D_4];
        data_train = [A_train1,A_train2,A_train3,A_train4,...
            B_train1,B_train2,B_train3,B_train4,...
            C_train1,C_train2,C_train3,C_train4,...
            D_train1,D_train2,D_train3,D_train4];
        
        %% classifing by dtw distance
        % k:k-th test data
        % t:t-th train data
        % classify_result: recorde the classify result
        classify_result = ones(16,1);
        for k = 1:16
            % record distance between k-th test data and t-th train data
            dist_k_t = ones(16,1);
            for t = 1:16
                dist_k_t(t) = dtw(data_test(:,k),data_train(:,t));
            end
            % get the nearest train_data
            classify_result(k) = find(dist_k_t==min(dist_k_t),1);
        end
        
        % print the result
        compare_array = [1,1,1,1,5,5,5,5,9,9,9,9,13,13,13,13]';
        % accuracy
        record(rep) = sum((abs(classify_result-compare_array)<4) == 1);
    end
    accuracy(i) = sum(record)/1600;
    fprintf('interval = %f, accuracy = %f \n',interval,accuracy(1))
    i = i+1;
end