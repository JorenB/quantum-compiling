function [gate word] = SolovayKitaev(search, n, gDict, rdn)

search = rotateToSU2(search);
if n == 0
	[gate word] = findGateApproximation(search, gDict);

else
	[lGate lWord] = SolovayKitaev(search, n-1, gDict, rdn);
	

	uulh = search*adj(lGate);
	[vGate wGate ] = BGCDecompose(uulh);

	[lvGate lvWord] = SolovayKitaev(vGate, n-1, rdn, rdn);
	[lwGate lwWord] = SolovayKitaev(wGate, n-1, rdn, rdn);


	m_un = lvGate * lwGate * adj(lvGate) * adj(lwGate) *lGate; 

	path_n = [lvWord lwWord invertPath(lvWord, 4) invertPath(lwWord, 4) lWord];

	gate = m_un;
	word = path_n;

end

end

