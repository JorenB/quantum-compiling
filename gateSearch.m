function gateSearch(n, gate, path, matrices)

	for j=1:length(matrices)
		test = gate * matrices{j};
		currentPath = path;
		currentPath{length(currentPath)+1} = j;

		if n > 0
			if norm(test - eye(3)) < 0.01
				disp('identity: ');
				disp(currentPath);
			else
				gateSearch(n-1, test, currentPath, matrices);
			end
		end
	end
end
