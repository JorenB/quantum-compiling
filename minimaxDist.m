function [mx, mn] = minimaxDist(collection)

mx = 0;
mn = 1000;

for k=1:length(collection)
	for j=1:length(collection)
		n = norm(collection{k}{1} - collection{j}{1});

		if n > mx
			mx = n
		end

		if n < mn && j~=k && n > 0.01
			mn = n
		end
	end
end

end

