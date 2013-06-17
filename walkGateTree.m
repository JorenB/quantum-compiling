%recursive function for computing matrix product in tree up to specific depth.
%if a previously encountered matrix is calculated, the algorithm exits the branch and backtracks in order to generate only new matrices

% 'depth' is the maximum tree depth walked
% 'base' is the base generating set of gates
% 'upper_gates' is the collection of gates generated in the level above this one
% 'upper_words' is the collection of words associated with upper_gates
% 'full_gates' is the complete collection of gates, necessary to check whether a newly generated gate has already been encountered
function [total_gates, total_words] = walkGateTree(depth, base, upper_gates, upper_words, full_gates, full_words)
    
	if nargin < 3 
        if nargin < 2
			base = constants.MATRICES;
		end	
		upper_gates = base;
		upper_words = {'1','2','3','4'};
		full_gates = base;
        full_words = {'1','2','3','4'};
					
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
            
            candidate = base{j} * upper_gates{k}; 

            % check whether gate already appeared in history
            unique = true;
            if norm(candidate-eye(3)) < constants.RE
                continue;
            end
            
            for l = 1:length(full_gates)
				n = norm(candidate- full_gates{l});
                
                if( strcmp(upper_words{k}, '21') && j == 3 )
                    n
                    l
                    full_words{l}
                end
                if n < constants.RE
                   unique = false;
                   break;
                end
            end

            %candidate matrix is unique so far: add it to the list
            if unique
                new_gates{length(new_gates)+1} = candidate;
				new_words{length(new_words)+1} = [int2str(j), upper_words{k} ];
                
                full_gates{length(full_gates)+1} = candidate;
                full_words{length(full_words)+1} = [int2str(j), upper_words{k} ];
            end
		
        end
	end

	disp(size(full_gates));
	disp(toc(t));

	%full_gates = [ full_gates upper_gates ];
    %full_words = [ full_words upper_words ];
	% if we haven't reached the bottom level, apply the function recursively
    if depth > 1 && size(new_gates, 2) > 0
		[new_gates new_words] = walkGateTree(depth - 1, base, new_gates, new_words, full_gates, full_words);
	end
    
	total_gates = [ upper_gates new_gates ];
	total_words = [ upper_words new_words ];
end
