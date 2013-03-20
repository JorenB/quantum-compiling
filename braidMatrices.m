function m = braidMatrices()

tau = (sqrt(5) - 1)/2;
ipi = sqrt(-1) * pi;

matrices = cell(1,4);
matrices{1} = [exp(4 * ipi / 5) 0 0; 0 -exp(-2 * ipi / 5) 0; 0 0 -exp(-2 * ipi / 5)];
matrices{3} = [(-tau*exp(-ipi/5)) (-i * sqrt(tau) * exp(-ipi / 10)) 0; (-i * sqrt(tau) *exp(-ipi/10)) (-tau) 0; 0 0 (-exp(2*ipi/5))];
matrices{2} = inv(matrices{1});
matrices{4} = inv(matrices{3});

m = matrices; 
end

