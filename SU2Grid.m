function matrices = SU2Grid(resolution)

s3 = blot3Sphere(resolution);

v4 = {};

for k=1:length(s3)
	v4{k} = angleTo4Vector(s3{k});
end

vu = mUnique(v4);

matrices = {};

for k=1:length(vu)
	v = vu{k};
	matrices{k} = [v(1) v(2); v(3) v(4)];
end

end

