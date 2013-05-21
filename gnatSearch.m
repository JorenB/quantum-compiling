function hit = gnatSearch(gate, gnat)

v = matToCart4(gate);

min = 10;
for j=1:length(gnat)
	dst = norm(v-matToCart4(gnat{j}{1}));

	if dst < min
		min = dst;

		n = j;
	end
end

sub = gnat{n};

if length(sub{2}) > 1
	if iscell(sub{2}{2})
		hit = gnatSearch(gate, sub{2});
		return;
	end
end

min = 10;
for j=1:length(sub{2})
	dst = norm(v-matToCart4(sub{2}{j}));

	if dst < min
		min = dst;

		n = j;
	end
end

hit = sub{2}{n};



end

