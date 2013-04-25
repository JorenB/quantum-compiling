function b = time_netbuild(depth)  
s = tic;
dimension = size(constants.MATRICES{1}, 1);
b = buildGateNet(depth, constants.MATRICES, {{eye(dimension), ''}}, {eye(dimension)});
toc(s)
end
