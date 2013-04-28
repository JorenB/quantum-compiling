function [v w] = BGCDecompose(u)

x = matToCart3(u);

n = norm(x);

a = [n;0;0];

xu = cart3ToMat(a);

s = similarityMatrix(u,xu);

as = conj(transpose((s)));

[vs ws] = xGroupFactor(xu);

v = s*vs*as;
w = s*ws*as;

end



function x = matToCart3(u)

sx1 = -1 * imag(u(1,2));
sx2 = real(u(2,1));
sx3 = 1/2 * imag(u(2,2)-u(1,1));

costh = 1/2*real(u(1,1)+u(2,2));
sinth = sqrt(sx1^2 + sx2^2+sx3^2);

x = [0; 0; 0];
if sinth == 0
    x(1) = 2*acos(costh);
else
    th = atan2(sinth,costh);
    
    x(1) = 2*th*sx1/sinth;
    x(2) = 2*th*sx2/sinth;
    x(3) = 2*th*sx3/sinth;
    
end
end



function U = cart3ToMat(x)

th = sqrt(dot(x,x));

if th == 0
    U = eye(2);
else
    U = cos(th/2)*eye(2) - 1i*sin(th/2)/th*(x(1) * [0 1; 1 0] + x(2)*[0, -1i; 1i, 0] + x(3)*[1, 0; 0, -1]);
end

end



function S = similarityMatrix(u, xu)

a = matToCart3(u);
b = matToCart3(xu);

na = norm(a);
nb = norm(b);

ab = 0;

for j=1:3
    ab = ab + a(j)*b(j);
end

s = [0;0;0];

s(1) = b(2)*a(3) - a(2)*b(3);
s(2) = a(1)*b(3)-b(1)*a(3);
s(3) = b(1)*a(2)-b(2)*a(1);

ns = norm(s);

if abs(ns) < constants.RE
    S = eye(2);
    
else
    for j=1:3
        s(j) = s(j) * acos(ab/(na*nb)) / ns;
    end
    
    S = cart3ToMat(s);
end

end




function [V W] = xGroupFactor(xu)

a = matToCart4(xu);

st = (0.5 - 0.5*a(1))^(1/4);

ct = sqrt(1-st^2);

theta = 2*asin(st);
alpha = atan(st);

b = [0;0;0]; c = [0;0;0];

b(1) = theta*st*cos(alpha);
c(1) = b(1);

b(2) = theta*st*sin(alpha);
c(2) = b(2);

b(3) = theta*ct;
c(3) = -b(3);


B = cart3ToMat(c);
W = cart3ToMat(b);

aB = conj(transpose(B));

V = B;

W = similarityMatrix(W, aB);

end




function x = matToCart4(u)

x = [0;0;0;0];

x(1) = real(u(1,1));
x(2) = -1*imag(u(1,2));
x(3) = real(u(2,1));
x(4) = imag(u(2,2));

for j=1:4
    if abs(x(j)) < 0.0000001
        x(j) = 0;
    end
end

end
