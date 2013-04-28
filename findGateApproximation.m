function [gate, word] = findGateApproximation(search, gDict)

min = 10;
n = 1;

search = rotateToSU2(search);
for k=1:length(gDict{1})
	dist = traceDistance(gDict{1}{k},search);

	if dist < min 
		min = dist;
		n = k;
	end

end

gate = gDict{1}{n};
word = gDict{2}{n};

end
