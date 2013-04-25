function vector = angleTo4Vector(tuple)

psi = tuple(1);
theta = tuple(2);
phi = tuple(3);
vector = [(cos(psi) + i*sin(psi)*cos(theta)) ...
(-sin(psi)*sin(theta)*cos(phi)+i*sin(psi)*sin(theta)*sin(phi))  ...
(sin(psi)*sin(theta)*cos(phi) + i*sin(psi)*sin(theta)*sin(phi)) ...
(cos(psi) - i*sin(psi)*cos(theta))];




end
