function dy=glfdiff(y,t,r)
%%y:函数值,t：时间，r：阶数
    t=1:length(y);
    if strcmp(class(y),'function_handle')
        y=y(t);
    end
    h=t(2)-t(1);
    w=ones(size(t));
    y=y(:);
    t=t(:);
    for j=2:length(t)
        w(j)=w(j-1)*(1-(r+1)/(j-1));
    end
    dy=zeros(size(y));
    for i=1:length(t)
        dy(i)=w(1:i)*[y(i:-1:1)]/h^r;
    end
end