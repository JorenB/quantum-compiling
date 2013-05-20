function x = matToCart4(u)

x = [0;0;0;0];

x(1) = real(u(1,1));
x(2) = -1*imag(u(1,2));
x(3) = real(u(2,1));
x(4) = imag(u(2,2));

for j=1:4
    if abs(x(j)) < constants.RE
        x(j) = 0;
    end
end

end
