function net = selectRDNet(full_net, r) 
	net = {};
	for k=1:length(full_net)
		m = full_net{k}{1}(1:2,1:2);
		if norm(m - [1 0; 0 1]) < r
			net = [net {full_net{k}}];
		end
	end

end

