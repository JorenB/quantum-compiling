function norm = traceDistance(m1, m2)

diff = m1(1:2,1:2) - m2(1:2,1:2);

a = real(diff(1,1));
bx = imag(diff(1,2));
by = real(diff(1,2));
bz = imag(diff(1,1));

norm = 2*sqrt(a^2+bx^2+by^2+bz^2);
%sq = sqrt( conj(transpose(diff)) * diff );

%norm = trace(sq) / 2;

end
