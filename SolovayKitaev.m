function tuple = SolovayKitaev(gate, n, collection, rdn)

if n == 0
	tuple = findGateApproximation(collection, gate);

else
	tuple_lower = SolovayKitaev(gate, n-1, collection, rdn);
	
	u = gate(1:2,1:2);
	u_lower = tuple_lower{1}(1:2,1:2);

	uulh = u*conj(transpose(u_lower));
	[v, w] = GCDecompose(uulh, rdn);

	v_lower = SolovayKitaev(v{1}, n-1, collection, rdn);
	w_lower = SolovayKitaev(w{1}, n-1, collection, rdn);


	m_un = v_lower{1} * w_lower{1} * conj(transpose(v_lower{1})) * conj(transpose(w_lower{1})) *tuple_lower{1}; 

	path_n = [v_lower{2} w_lower{2} invertPath(v_lower{2}, 4) invertPath(w_lower{2}, 4) tuple_lower{2}];

	tuple = {m_un, path_n};

end

end

