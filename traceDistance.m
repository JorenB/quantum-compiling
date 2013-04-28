function norm = traceDistance(m1, m2)

diff = rotateToSU2(m1) - rotateToSU2(m2);

norm = traceNorm(diff);



end
