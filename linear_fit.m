% %two-dimension
% x = rand(100, 1);
% y = 3 .* x + (rand(100,1)-0.5);
% figure
% scatter(x,y);
% hold on
% b1 = x \ y;
% plot(x, b1 * x);
% grid on;
% title("linear fit");
% 
% figure
% scatter(x,y);
% hold on
% D = [x  ones(100,1) ];
% b2 = pinv(D) * y;
% plot(x, D * b2)
% grid on
% title("pseudo inverse")
% 


%three-dimension
x = rand(100, 2);
v = 13 .* x(:,1) + (-3) .* x(:,2) + (rand(100,1) - 0.5);
v(100) = 10;
D = [x ones(100,1)];
b3 = pinv(D) * v;
figure
scatter3(x(:,1),x(:,2),v)
hold on 
V = D * b3;
[xx yy] = meshgrid(x(:,1),x(:,2));
vv = griddata(x(:,1),x(:,2),V,xx,yy,'v4');
surf(xx,yy,vv)
hold on
for i = size(D,1)
    plot3([x(i,1) x(i,1)], [x(i,2) x(i,2)],[V(i) v(i)],'r')
end
%plot3([x(100,1) x(100,1)], [x(100,2) x(100,2)],[0 v(i)],'r')
