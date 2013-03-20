function b = generateGates(search, depth, precision) 
if nargin < 1
	depth = 6;
end


s = tic;
b = gateSearch(search, depth, precision, eye(3),{}, {});
toc(s)
end
