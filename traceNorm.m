function norm = traceNorm(matrix)

a = real(matrix(1,1));
bx = imag(matrix(1,2));
by = real(matrix(1,2));
bz = imag(matrix(1,1));

norm = 2*sqrt(a^2+bx^2+by^2+bz^2);

end

