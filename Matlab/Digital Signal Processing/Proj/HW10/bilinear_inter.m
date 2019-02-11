function [ new_peppers ] = bilinear_inter( peppers,new_size )

old_size = size(peppers);
rate_y = (old_size(1)-1)/(new_size(1)-1);
rate_x = (old_size(2)-1)/(new_size(2)-1);

for ii = 1 : new_size(1) % y
    for jj = 1 : new_size(2) % x
        n = floor((jj-1)*rate_x+1);
        m = floor((ii-1)*rate_x+1);
        a = (jj-1)*rate_x+1-n;
        b = (ii-1)*rate_x+1-m;
        if n == old_size(2) && m == old_size(1)
            new(jj,ii) = (1-a)*(1-b)*peppers(n,m) ...
                    +a*(1-b)*peppers(n,m) ...
                    +(1-a)*b*peppers(n,m) ...
                    +a*b*peppers(n,m);  
        elseif n == old_size(2)
            new(jj,ii) = (1-a)*(1-b)*peppers(n,m) ...
                    +a*(1-b)*peppers(n,m) ...
                    +(1-a)*b*peppers(n,m+1) ...
                    +a*b*peppers(n,m+1);
        elseif m == old_size(1)
            new(jj,ii) = (1-a)*(1-b)*peppers(n,m) ...
                    +a*(1-b)*peppers(n+1,m) ...
                    +(1-a)*b*peppers(n,m) ...
                    +a*b*peppers(n+1,m);
        else
            new(jj,ii) = (1-a)*(1-b)*peppers(n,m) ...
                    +a*(1-b)*peppers(n+1,m) ...
                    +(1-a)*b*peppers(n,m+1) ...
                    +a*b*peppers(n+1,m+1);
        end
    end
end

new_peppers = new;
end
