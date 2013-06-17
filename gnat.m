function tree = gnat(gates, words, n_branch)

%vectors = {};
%for j=1:length(net)
%	vectors{j} = matToCart4(net{j});
%end

nodes = {};
subgates = {};
subwords = {};

rnds = [];
while length(rnds) < n_branch
	    rnds = unique([rnds ceil(length(gates)*rand(1))]);
end

for j=1:n_branch

	n = rnds(j);


	nodes{j} = {};
	nodes{j}{1} = 'branch';
	nodes{j}{2} = gates{n};
	nodes{j}{3} = words{n};
%	net(n) = []; vectors(n) = [];

	subgates{j} = {};
	subwords{j} = {};
end


for j=1:length(gates)
	min = 10;

	for k=1:n_branch
		dst = traceDistance(gates{j}(1:2,1:2),nodes{k}{2});
		%dst = norm(vectors{j}-matToCart4(nodes{k}{1}));

		if dst < min
			if dst == 0
				n=k;
				break;
			end
			min = dst;

			n = k;
		end
	end

	subgates{n}{length(subgates{n})+1} = gates{j};
	subwords{n}{length(subwords{n})+1} = words{j};

end


for j=1:length(nodes)
	if length(subgates{j}) > 50
		nodes{j}{1} = 'branch';
		nodes{j}{4} = gnat(subgates{j}, subwords{j}, n_branch);
	else
		nodes{j}{1} = 'leaf';
		nodes{j}{4} = subgates{j};
		nodes{j}{5} = subwords{j};
	end
end



tree = nodes;

end
