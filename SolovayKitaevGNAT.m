% function for progressively generating better approximations to input gate 'search'. 'n' specifies the maximum number of recursive calls, 'net' is the input gate/word collection and 'rdnet' is a selection from this collection containing only gates 'close' to the identity (saves time in finding approximations to the group commutator)
function [gate word] = SolovayKitaevGNAT(search, n, gnat)
search = rotateToSU2(search);
if n == 0
	[gate word] = gnatSearch(search, gnat);

else

	[lGate lWord] = SolovayKitaevGNAT(search, n-1, gnat);

	uulh = search*adj(lGate(1:2,1:2));
	
	[vGate wGate ] = BGCDecompose(uulh);

	% pass 'rdnet' instead of 'net' here, as the group commutator matrices will generally be close to the identity (saves a lot of searching time)
	[lvGate lvWord] = SolovayKitaevGNAT(vGate, n-1, gnat);
	[lwGate lwWord] = SolovayKitaevGNAT(wGate, n-1, gnat);


	% compute nth-level approximation of gate
	m_un = lvGate * lwGate * adj(lvGate) * adj(lwGate) *lGate; 

	% derive associated word
	path_n = [lvWord lwWord invertPath(lvWord, 4) invertPath(lwWord, 4) lWord];

	gate = m_un;
	word = path_n;

end

end

