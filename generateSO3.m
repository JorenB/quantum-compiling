function points = generateSO3(epsilon) 

points = {};

step_phi = epsilon;
step_theta = epsilon;
step_psi = floor(epsilon/2);

for j=0:step_phi
	for k=0:step_theta
		for l=0:step_psi
			v = [sin(l*(pi/step_psi)) * sin(k*(2*pi/step_theta)) * cos(j*(2*pi/step_phi)); ...
				sin(l*(pi/step_psi)) * sin(k*(2*pi/step_theta)) * sin(j*(2*pi/step_phi)); ...
				sin(l*(pi/step_psi)) * cos(k*(2*pi/step_theta)); ...
				cos(l*(pi/step_psi))];

		unique = true;
		for l=1:length(points)
			if norm(points{l} - v) < 0.0001 
				unique = false;
				break;
			end
		end	

		if unique
			points{length(points)+1} = v;
		end
	end
end


end


