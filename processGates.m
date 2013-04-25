function pMatrices = processGates(matrices)

pMatrices = {};
for k=1:length(matrices)
	pMatrices{k} = rotateToSU2(matrices{k}(1:2,1:2));
end

end

