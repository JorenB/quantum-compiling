function [gate, word] = linearSearch(search, gates, words)

min = 10;
n = 1;

search = rotateToSU2(search);
for k=1:length(gates)
	dist = traceDistance(gates{k}(1:2,1:2),search);

	if dist < min 
		min = dist;
		n = k;
	end

end

gate = gates{n};
word = words{n};

end
