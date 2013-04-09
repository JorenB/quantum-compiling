function net = selectRDNet(full_net, r) 
	net = {};
	for k=1:length(full_net)
		m = full_net{k}{1};
		trd = traceDistance(m,[1 0; 0 1]); 
		if trd < r && trd > constants.RE
			net = [net {full_net{k}}];
		end
	end

end

