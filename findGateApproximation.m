function [gate, word] = findGateApproximation(search, net)

min = 10;
n = 1;

search = rotateToSU2(search);
for k=1:length(net{1})
	dist = norm(net{1}{k}(1:2,1:2)-search);

	if dist < min
		min = dist;
		n = k;
	end

end

gate = net{1}{n};
word = net{2}{n};

end
