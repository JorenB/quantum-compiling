% function for progressively generating better approximations to input gate 'search'. 'n' specifies the maximum number of recursive calls, 'net' is the input gate/word collection and 'rdnet' is a selection from this collection containing only gates 'close' to the identity (saves time in finding approximations to the group commutator)
function [gate word] = SolovayKitaev(search, n, net, rdnet)
search = rotateToSU2(search);
if n == 0
	[gate word] = findGateApproximation(search, net);

else

	[lGate lWord] = SolovayKitaev(search, n-1, net, rdnet);

	uulh = search*adj(lGate(1:2,1:2));
	if traceDistance(uulh,eye(2)) > 0.2
		disp(traceDistance(uulh,eye(2)));
	end
	[vGate wGate ] = BGCDecompose(uulh);

	% pass 'rdnet' instead of 'net' here, as the group commutator matrices will generally be close to the identity (saves a lot of searching time)
	[lvGate lvWord] = SolovayKitaev(vGate, n-1, rdnet, rdnet);
	[lwGate lwWord] = SolovayKitaev(wGate, n-1, rdnet, rdnet);


	% compute nth-level approximation of gate
	m_un = lvGate * lwGate * adj(lvGate) * adj(lwGate) *lGate; 

	% derive associated word
	path_n = [lvWord lwWord invertPath(lvWord, 4) invertPath(lwWord, 4) lWord];

	gate = m_un;
	word = path_n;

end

end

