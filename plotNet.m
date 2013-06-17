function n = plotNet( net )

v4s = {};
for k=1:length(net)
v4s{k} = matToCart4(net{k});
end

x=[];
y=[];
for k=1:length(v4s)
x(k) = v4s{k}(1);
end
for k=1:length(v4s)
y(k) = v4s{k}(2);
end
figure(1);
clf;
scatter(x,y,4,'fill');
axis([-1.2, 1.2, -1.2, 1.2]);
axis equal;

x=[];
y=[];
for k=1:length(v4s)
x(k) = v4s{k}(3);
end
for k=1:length(v4s)
y(k) = v4s{k}(4);
end
figure(2);
clf;

scatter(x,y,4,'fill');
axis([-1.2, 1.2, -1.2, 1.2]);
axis equal;
end

