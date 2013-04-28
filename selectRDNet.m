function [gates words] = selectRDNet(gDict, gate, r) 
	gate = rotateToSU2(gate);
	gates = {};
	words = {};

	for k=1:length(gDict{1})
		m = gDict{1}{k};
		trd = traceDistance(m,gate); 
		if trd < r && trd > constants.RE
			gates{length(gates)+1} = gDict{1}{k};
			words{length(words)+1} = gDict{2}{k};
		end
	end

end

