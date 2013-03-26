function b = time_netbuild(depth, tightness)  
s = tic;
dimension = size(constants.MATRICES{1}, 1);
b = buildGateNet(depth, tightness, constants.MATRICES, {{eye(dimension), ''}}, {eye(dimension)});
toc(s)
end
