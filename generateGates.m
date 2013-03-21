function b = generateGates(depth)  
if nargin < 1
	depth = 6;
end


s = tic;
b = gateSearch(depth, eye(3),{}, {});
toc(s)
end
