%recursive function for computing matrix product in tree up to specific depth.
%if a previously encountered matrix is calculated, the algorithm exits the branch and backtracks in order to generate new matrices
function b = gateSearch(depth, current, history)
	b = {};
	%retrieve base matrices
	matrices = constants.MATRICES;

	for j = 1:length(matrices)
		test = current * matrices{j}; 

		% check whether gate already appeared in history
		c = false;
		for k = 1:length(history)
			if norm(test-history{k}) < 0.14 
 				c = true;
				break;
			end
		end

		%current matrix has already appeared somewhere - walking this branch any further is useless
		if c
			continue;
		end	

		history{length(history)+1} = test;

		%halt if depth limit has been reached
		if depth > 0  
			history = gateSearch(depth-1, test, history);
		end

		b = history;
	end
end
