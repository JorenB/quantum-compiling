function [v, w] = GCDecompose(uu0h, rdn)

min = 10;

for k=1:length(rdn)
		vt = rdn{k}{1}(1:2,1:2);
	for j=1:length(rdn)
		wt = rdn{j}{1}(1:2,1:2);

		vtwt = vt*wt*conj(transpose(wt*vt));

		n = traceDistance(vtwt, uu0h);
		if n < min && n > constants.RE
			min = n;
			v = rdn{k};
			w = rdn{j};
		end
	end
end

end
