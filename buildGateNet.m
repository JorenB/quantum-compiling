%recursive function for computing matrix product in tree up to specific depth.
%if a previously encountered matrix is calculated, the algorithm exits the branch and backtracks in order to generate new matrices
function gates = buildGateNet(depth, base, collection, net)
	gates = collection;
	
	disp('---');
	disp(depth);
	disp(size(collection,2));

	new_gates = {};
	t = tic;
	for j = 1:length(base)
        for k = 1:length(collection)
            candidate = base{j} * collection{k}{1}; 

            % check whether gate already appeared in history
            unique = true;
			ln = length(net);
            for l = 1:ln
				%n = traceDistance(candidate,net{l});
				n = norm(candidate - net{l});
                if n < constants.RE
                    unique = false;
                    break;
                end
            end

            %candidate matrix is unique so far: add it to the list
            if unique == true
                new_gates{length(new_gates)+1} = {candidate, [int2str(j), collection{k}{2} ]};
                net{length(net)+1} = candidate;
            end
        end
	end

	disp(toc(t));

	%halt if depth limit has been reached
    if depth > 1 && size(new_gates, 2) > 0
		new_gates = buildGateNet(depth - 1, base, new_gates, net);
	end
    
	gates = [ gates new_gates ];
end
