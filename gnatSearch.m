function [hit_g hit_w] = gnatSearch(gate, gnat)

%v = matToCart4(gate);

min = 10;
for j=1:length(gnat)
	dst = traceDistance(gate, gnat{j}{2}(1:2,1:2));
	%dst = norm(v-matToCart4(gnat{j}{1}));

	if dst < min
		min = dst;

		n = j;
	end
end

sub = gnat{n};

if strcmp(sub{1}, 'branch')
	[hit_g hit_w] = gnatSearch(gate, sub{4});
	return;
elseif strcmp(sub{1}, 'leaf')

	min = 10;
	for j=1:length(sub{4})
		dst = traceDistance(gate, sub{4}{j}(1:2,1:2));
		%dst = norm(v-matToCart4(sub{2}{j}));
	
		if dst < min
			min = dst;
	
			n = j;
		end
	end

	hit_g = sub{4}{n};
	hit_w = sub{5}{n};

end


end

