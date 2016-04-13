function d = dist_dtw(u,V)
%defined to get the distance handle in next step
% u:1*p vector
% V:m*p matrix
% d:m*1 vector,and
% the k-th element is  the distance between u and k-th row of V
% the function depend on dtw function
    
    temp = size(V);
    m = temp(1);
    d = ones(m,1);
    for k = 1:m
        d(k) = dtw(u,V(k,:));
end

