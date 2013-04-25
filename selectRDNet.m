function net = selectRDNet(full_net, gate, r) 
	net = {};
	for k=1:length(full_net)
		m = full_net{k}{1};
		trd = traceDistance(m,rotateToSU2(gate)); 
		if trd < r && trd > constants.RE
			net = [net {full_net{k}}];
		end
	end

end

