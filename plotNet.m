function n = plotNet( net )

v4s = {};
for k=1:length(net)
v4s{k} = unitaryTo4Vector(net{k});
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

end

