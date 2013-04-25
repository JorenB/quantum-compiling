function a = plotFilteredNet(resolution, net)

c3 = coverS3withSU2(resolution);

pairs = pairSU2withNet(c3, net, resolution);


vg=[];vn=[];
xg1=[];yg1=[]; xg2=[];yg2=[];
for k=1:length(pairs)
	vg=unitaryTo4Vector(c3{pairs{k}(1)});
	vn=unitaryTo4Vector(net{pairs{k}(2)}{1});

	xg1(k) = vg(1);		
	yg1(k) = vg(2);	
	xg2(k) = vg(3);	
	yg2(k) = vg(4);	
		
	xn1(k) = vn(1);
	yn1(k) = vn(2);
	xn2(k) = vn(3);
	yn2(k) = vn(4);

end

rad=8;

figure(1);
clf;
scatter(xg1,yg1,rad,'fill');
hold on;
scatter(xn1,yn1,rad,'fill');

figure(2);
clf;
scatter(xg2,yg2,rad,'fill');
hold on;
scatter(xn2,yn2,rad,'fill');

end
