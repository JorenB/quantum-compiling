function tree = gnat(net, n_nodes)

vectors = {};
for j=1:length(net)
	vectors{j} = matToCart4(net{j});
end

nodes = {};
subcoll = {};
for j=1:n_nodes
	n = ceil(length(vectors)*rand(1));


	nodes{j} = {};
	nodes{j}{1} = net{n};
%	net(n) = []; vectors(n) = [];

	subcoll{j} = {};
end


for j=1:length(vectors)
	min = 10;

	for k=1:n_nodes
		dst = norm(vectors{j}-matToCart4(nodes{k}{1}));

		if dst < min
			min = dst;

			n = k;
		end
	end

	subcoll{n}{length(subcoll{n})+1} = net{j};

end


for j=1:length(nodes)
	if length(subcoll{j}) > n_nodes
		subcoll{j} = gnat(subcoll{j},n_nodes);
	end
	nodes{j}{2} = subcoll{j};
end



tree = nodes;

end
