%function for computing the symbolic inverse of a path. 'n' is the total number of distinct matrices in the generating set.
function inverted = invertPath(path, n) 

flip = n / 2;
inverted = [];
for i=1:length(path)
	el = str2num(path(i));
	
	if el <= flip
		inverted = [inverted, num2str(el+flip)];
	else
		inverted = [inverted, num2str(el-flip)];
	end
end

inverted = fliplr(inverted);
end
