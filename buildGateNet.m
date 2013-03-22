%recursive function for computing matrix product in tree up to specific depth.
%if a previously encountered matrix is calculated, the algorithm exits the branch and backtracks in order to generate new matrices
function gates = buildGateNet(depth, tightness, base, collection, net)
	gates = collection;
	
	new_gates = {};
	for j = 1:length(base)
        for k = 1:length(collection)
            candidate = base{j} * collection{k}; 

            % check whether gate already appeared in history
            unique = true;
            for l = 1:length(net)
                if norm(candidate-net{l}) < tightness
                    unique = false;
                    break;
                end
            end

            %current matrix has already appeared somewhere - walking this branch any further is useless
            if unique == true
                new_gates{length(new_gates)+1} = candidate;
                net{length(net)+1} = candidate;
            end
        end
	end

	%halt if depth limit has been reached
    if depth > 1  
		new_gates = buildGateNet(depth - 1, tightness, base, new_gates, net);
	end
    
	gates = [ gates new_gates ];
end
