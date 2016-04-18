function d  = dtw(Q,C,w)
% Dynamic Time Warping
% get the distance of two sequences 
% Q,C: two sequences  
% w: window parameter
%      if Q(i) is matched with C(j) then |i-j|<=w
% d: resulting distance
%
% Jingchang Liu 2016/04/11

    if nargin<3
        w=Inf;
    end

    %% initialize DTW
    % DTW(i+1,j+1): The accumulated distance between
    %   Q(1) to Q(i) and C(1) to C(j)
    % M: the length of sequence Q
    % N: the length of sequence C
    M = length(Q);
    N = length(C);
    w_value = M*w;

    DTW = zeros(M+1,N+1);
    w_value = max([w_value,abs(M-N)]);

    for i = 2:M+1
        for j =2:N+1
            DTW(i,j) = inf;
        end
    end
    DTW(1,1) = 0;

    %% DTW algorithm
    % d(i,j):The distance between Q(i) and C(j)
    for i = 2:M+1
        for j = max([2,i-w_value+1]) : min([N+1,i+w_value+1])
            d = norm(Q(i-1)-C(j-1));
            DTW(i,j) = d+ min([DTW(i-1,j),DTW(i,j-1),DTW(i-1,j-1)]);
        end
    end

    d = DTW(M+1,N+1);
end
