function b = gateSearch(search, depth, precision, current, path, history)
	b = {};

	matrices = braidMatrices();

	for j = 1:length(matrices)
		test = current * matrices{j}; 

		% check whether gate already appeared in history
		c = false;
		for k = 1:length(history)
			if norm(test - history{k}) < 1 
				disp(path);
				disp(j);
				disp(history{k});
				c = true;
				break;
			end
		end

		if c
			continue;
		end	
		history{length(history)+1} = test;

		currentPath = path;
			currentPath{length(currentPath)+1} = j;
			b{length(b)+1} = currentPath;

			if norm(test(1:2, 1:2) - refGates(search)) < precision 
				%disp(test);
				%disp(currentPath);
				%disp(norm(test(1:2, 1:2) - refGates(search))); 
			end

			if depth > 1 
				b = [ b gateSearch(search, depth-1, precision, test, currentPath, history)];
			end
	end
end
