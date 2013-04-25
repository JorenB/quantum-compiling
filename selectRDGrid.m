function grid = selectRDGrid(in, gate, resolution)

	grid = {};
	r = rotateToSU2(gate);
	for k=1:length(in)
		m = in{k};
		trd = norm(m-r); 
		if trd < resolution && trd > constants.RE
			grid = [grid {in{k}}];
		end
	end

end
