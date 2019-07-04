function m = PyramidPooling(a,PoolingType)
[r, c] = size(a);
level_1 = ones(r,c);

level_2 = zeros(r,c);
level_2(: , 1:floor(c/2)) = 1;

level_3 = zeros(r,c);
level_3(: , floor(c/2):end) = 1;

level_4 = zeros(r,c);
level_4(: , 1:floor(c/4)) = 1;

level_5 = zeros(r,c);
level_5(: , floor(c/4):floor(2*c/4)) = 1;

level_6 = zeros(r,c);
level_6(: , floor(2*c/4) : floor(3*c/4)) = 1;

level_7 = zeros(r,c);
level_7(: , floor(3*c/4) : end) = 1;
switch PoolingType
    case 'Max'
        m(1:r) = max(a.*level_1,[],2);
        m(r+1:2*r) = max(a.*level_2,[],2);
        m(2*r+1:3*r) = max(a.*level_3,[],2);
        m(3*r+1:4*r) = max(a.*level_4,[],2);
        m(4*r+1:5*r) = max(a.*level_5,[],2);
        m(5*r+1:6*r) = max(a.*level_6,[],2);
        m(6*r+1:7*r) = max(a.*level_7,[],2);
end
end