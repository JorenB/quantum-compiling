function tuples = blot3Sphere(resolution)

tuples = {};

steps = 1/resolution;

n=1;

for i=0:steps-1
	for j=0:steps-1
		for k=0:2*steps-1
			tuples{n} = resolution*pi*[i,j,k];
			n=n+1;
		end
	end
end

end


