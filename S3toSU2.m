function matrices = S3toSU2(tuples)

matrices = {};

for k=1:length(tuples)
	tuple = tuples{k};
	psi = tuple(1);
	theta = tuple(2);
	phi = tuple(3);
	matrices{length(matrices)+1} = [(cos(psi) + i*sin(psi)*cos(theta)) ...
	(-sin(psi)*sin(theta)*cos(phi)+i*sin(psi)*sin(theta)*sin(phi)) ; ...
	(sin(psi)*sin(theta)*sin(phi) + i*sin(psi)*sin(theta)*sin(phi)) ...
	(cos(psi) - i*sin(psi)*cos(theta))];
end

end

