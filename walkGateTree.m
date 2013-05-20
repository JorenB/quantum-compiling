%recursive function for computing matrix product in tree up to specific depth.
%if a previously encountered matrix is calculated, the algorithm exits the branch and backtracks in order to generate only new matrices

% 'depth' is the maximum tree depth walked
% 'base' is the base generating set of gates
% 'upper_gates' is the collection of gates generated in the level above this one
% 'upper_words' is the collection of words associated with upper_gates
% 'full_gates' is the complete collection of gates, necessary to check whether a newly generated gate has already been encountered
function [total_gates, total_words] = buildGateNet(depth, base, upper_gates, upper_words, full_gates)

	if nargin < 3 
		upper_gates = {eye(2)};
		upper_words = {''};
		full_gates = {eye(2)};
		if nargin < 2
			base = constants.MATRICES;
		end				
	end

	% display progress at every level
	disp('---');
	disp(depth);
	disp(size(upper_gates,2));

	new_gates = {};
	new_words = {};
	t = tic;
	

	for j = 1:length(base)
        for k = 1:length(upper_gates)
            candidate = rotateToSU2(base{j}) * upper_gates{k}; 

            % check whether gate already appeared in history
            unique = true;
            for l = 1:length(full_gates)
				n = traceDistance(candidate, full_gates{l});

                if n < constants.RE
                    unique = false;
                    break;
                end
            end

            %candidate matrix is unique so far: add it to the list
            if unique == true
                new_gates{length(new_gates)+1} = candidate;
				new_words{length(new_words)+1} = [int2str(j), upper_words{k} ];
            end
        end
	end

	disp(toc(t));

	full_gates = [ full_gates upper_gates ];
	% if we haven't reached the bottom level, apply the function recursively
    if depth > 1 && size(new_gates, 2) > 0
		[new_gates new_words] = buildGateNet(depth - 1, base, new_gates, new_words, full_gates);
	end
    
	total_gates = [ upper_gates new_gates ];
	total_words = [ upper_words new_words ];
end
