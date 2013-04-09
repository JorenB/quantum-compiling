function best = findGateApproximation(collection, gate)

min = 10;
n = 1;

gate = rotateToSU2(gate);
for k=1:length(collection)
	dist = traceDistance(collection{k}{1}(1:2,1:2),gate);

	if dist < min
		min = dist;
		n = k;
	end

end

best = collection{n};

end
