function pairs = pairSU2withNet(su2, net, resolution)


pairs = {};
for k=1:length(su2)
for j=1:length(net)
n=norm(su2{k}-net{j}{1});
if n < resolution
	pairs{length(pairs)+1} = [k j];
break;
end
end
end

end
