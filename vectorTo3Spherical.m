function tuple = vectorTo3Spherical(vector) 

psi = acos(vector(4));
theta = acos(vector(3)/sin(psi));
phi = acos(vector(1)/(sin(psi)*sin(theta)));

tuple = [psi, theta, phi];

end

