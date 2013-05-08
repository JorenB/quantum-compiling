% generate gate net up to word length 6
it6 = {};
[it6{1} it6{2}] = buildGateNet(6);

% select subnet of matrices close to the identity
rdn6 = {};
[rdn6{1} rdn6{2}] = selectRDNet(it6, eye(2), 0.5);


% choose a gate to search for, the Hadamard gate in this instance. For searching, the rotateToSU2 function does not have to be applied on beforehand (the algorithm does this internally), but it is convenient for accuracy checking in this example
search = rotateToSU2(constants.H);


% invoke Solovay-Kitaev in order to find the best approximation
[gate6 word6] = SolovayKitaev(search, 5, it6, rdn6)


% show error in approximation
traceDistance(gate6, search)
