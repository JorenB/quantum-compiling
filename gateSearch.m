%recursive function for computing matrix product in tree up to specific depth.
%if a previously encountered matrix is calculated, the algorithm exits the branch and backtracks in order to generate new matrices
function b = gateSearch(search, depth, precision, current, path, history)
	b = {};
	
	%retrieve base matrices
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

		%current matrix has already appeared somewhere - walking this branch any further is useless
		if c
			continue;
		end	

		history{length(history)+1} = test;

		currentPath = path;
		currentPath{length(currentPath)+1} = j;
		b{length(b)+1} = currentPath;

		%if desired gate has been found within specified precision, display it
		if norm(test(1:2, 1:2) - refGates(search)) < precision 
			%disp(test);
			%disp(currentPath);
			%disp(norm(test(1:2, 1:2) - refGates(search))); 
		end

		%halt if depth limit has been reached
		if depth > 1 
			b = [ b gateSearch(search, depth-1, precision, test, currentPath, history)];
		end

	end
end
