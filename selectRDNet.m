% select the gates from a gate/word collection that have a maximum trace distance 'r' from the input 'gate'
function [gates words] = selectRDNet(net, gate, r) 
	gate = rotateToSU2(gate);
	gates = {};
	words = {};

	for k=1:length(net{1})
		m = net{1}{k};
		trd = traceDistance(m,gate); 

		if trd < r && trd > constants.RE
			gates{length(gates)+1} = net{1}{k};
			words{length(words)+1} = net{2}{k};
		end
	end

end

