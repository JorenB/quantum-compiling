function norm = traceNorm(matrix)

norm = 1/2 * abs(trace(sqrt(conj(transpose(matrix))*matrix)));


end

