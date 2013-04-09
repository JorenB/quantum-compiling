function gate = rotateToSU2(in) 

ublock = in(1:2,1:2);

gate = in / round(sqrt(det(ublock)));

end

