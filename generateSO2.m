function points = generateSO2(epsilon) 

points = {};

step_phi = epsilon;
step_theta = floor(epsilon/2);

for j=0:step_phi
	for k=0:step_theta
		v = [sin(k*(pi/step_theta)) * cos(j*(2*pi/step_phi)); ...
			sin(k*(pi/step_theta)) * sin(j*(2*pi/step_phi)); ...
			cos(k*(pi/step_theta))];

		unique = true;
		for l=1:length(points)
			if norm(points{l} - v) < 0.00001 
				unique = false;
				break;
			end
		end	

		if unique
			points{length(points)+1} = v;
	end
end


end


