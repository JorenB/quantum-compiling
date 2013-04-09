function net = shrinkNet(base_net, n)
total = tic;
net = {};

for k=1:length(base_net)
	loop = tic;
	m1 = base_net{k}{1};
	for j=1:length(base_net)
		m2 = base_net{j}{1};

		m = m1*m2*conj(transpose((m1)))*conj(transpose((m2)));

		unique = true;
		for l=1:length(net)
			dist = 2*traceDistance(m,net{l}{1});
			if dist > 0 && dist < constants.RE 
				unique = false;
				continue;
			end
		end

		if ~unique
			continue;
		end

		net{length(net)+1} = {m, ...
			[base_net{k}{2}, base_net{j}{2}, ...
			invertPath(base_net{j}{2}, n) ...
			invertPath(base_net{k}{2}, n)]};
	end
	toc(loop)
end
toc(total)
end

