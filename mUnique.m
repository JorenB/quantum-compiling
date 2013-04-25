function u = mUnique(in)

ins = cellfun(@(x)(mat2str(x)),in,'uniformoutput',false);

[a,b,c] = unique(ins);

u = {};
for k=1:length(b)
	u{k} = in{b(k)};
end

end
