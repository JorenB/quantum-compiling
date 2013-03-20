function b = gateSearch(n, gate, path, matrices)
	b = {};

	for j=1:length(matrices)
		test = gate * matrices{j};
		currentPath = path;
		currentPath{length(currentPath)+1} = j;

		b{length(b)+1} = currentPath;
		if n > 0
			if norm(test - eye(3)) < 0.001
				%disp('identity: ');
				%disp(currentPath);
			else
				b = [b gateSearch(n-1, test, currentPath, matrices)];
			end
		end
	end
end
