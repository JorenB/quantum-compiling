function net = telescopeNet(g0, g1) 

start = tic;
net = {};

for k=1:length(g0)
	loop = tic;
	m1 = g0{k}{1};
	for j=1:length(g1)
		m2 = g1{j}{1};

		m = m1*m2;

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


		
		net{length(net)+1} = {m, [g0{k}{2}, g1{j}{2}]};
	end
	toc(loop)
end


toc(start)
end
