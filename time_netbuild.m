function b = time_netbuild(depth, tightness)  
if nargin < 1
	depth = 6;
end


s = tic;
b = buildGateNet(depth, tightness, constants.MATRICES, {eye(3)}, {eye(3)});
toc(s)
end
