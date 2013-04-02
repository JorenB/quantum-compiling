function collection = processMatrices(input)

collection = {};
for k=1:length(input)
	rotated = rotateToSU2(input{k}{1});
	vector = unitaryTo4Vector(rotated);
	tuple = vectorTo3Spherical(vector);
	collection{k} = {rotated, input{k}{2}, vector, tuple};
end

end

