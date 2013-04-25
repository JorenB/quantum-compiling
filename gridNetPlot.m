function n = gridNetPlot( net, grid_resolution )

nVectors = {}; gVectors = {};
for k=1:length(net)
	nVectors{k} = unitaryTo4Vector(net{k});
end

SU2g = SU2Grid(grid_resolution);
for k=1:length(SU2g)
	gVectors{k} = unitaryTo4Vector(SU2g{k});
end


x1n=[];y1n=[]; x2n=[];y2n=[];
for k=1:length(nVectors)
x1n(k) = nVectors{k}(1);
x2n(k) = nVectors{k}(3);
end
for k=1:length(nVectors)
y1n(k) = nVectors{k}(2);
y2n(k) = nVectors{k}(4);
end

x1g=[];y1g=[]; x2g=[];y2g=[];
for k=1:length(gVectors)
x1g(k) = gVectors{k}(1);
x2g(k) = gVectors{k}(3);
end
for k=1:length(gVectors)
y1g(k) = gVectors{k}(2);
y2g(k) = gVectors{k}(4);
end


figure(1);
clf;
scatter(x1g,y1g,4,'red','.');
hold on;
scatter(x1n,y1n,20,'s','blue','fill');

figure(2);
clf;
scatter(x2g,y2g,4,'red','fill');
hold on;
scatter(x2n,y2n,20,'s','blue', 'fill');

end

