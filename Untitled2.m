
A1 = [[10, 4];[5, 1]];
A2 = [[10, -5];[4, 2]];
A3 = [[10, 5];[4, 2]];
A4 = [[10, 3];[3, 2]];
Y1 = zeros(1);
Y2 = zeros(1);
X1 = zeros(1);
X2 = zeros(1);
vlasneChislo = zeros(1);
vectorY1 = zeros(1);
vectorY2 = zeros(1);
vectorX1 = zeros(1);
vectorX2 = zeros(1);
h = zeros(1);
fi = 1;
iter = 1;
for i = 0:+0.00001:2*pi
 Y1(1,fi)=A1(1,1)*cos(i) + A1(1,2)*sin(i);
 Y2(1, fi) = A1(2,1)*cos(i) + A1(2,2)*sin(i);
 X1(1,fi) = cos(i);
 X2(1,fi) = sin(i);
args = A1(1,1)*cos(i) + A1(1,2)*sin(i);
args2 = A1(2,1)*cos(i) + A1(2,2)*sin(i);

 if abs(cos(i) - (args/(args.^2 + args2.^2).^(1/2))) < 0.7
     if sqrt(args^2+ args2^2) <= 0.8437 
     vectorX1(1,iter) = cos(i);
     vectorX2(1,iter) = sin(i);
     vectorY1(1,iter)= args;
     vectorY2(1, iter) = args2; 
     vlasneChislo(1, iter) = sqrt(args^2+ args2^2);
 h(1, iter) = i;
 iter = iter + 1;
     end
 elseif abs(abs(cos(i) - (args/(args.^2 + args2.^2).^(1/2))) - pi) < 0.7
     vectorX1(1,iter) = cos(i);
     vectorX2(1,iter) = sin(i);
     vectorY1(1,iter)= args;
     vectorY2(1, iter) = args2;
     vlasneChislo(1, iter) = sqrt(args^2+ args2^2);
     h(1, iter) = i;
     iter = iter + 1;
 end
 fi = fi + 1;
end

plot(Y1,Y2);
hold on;
plot(X1,X2);
plot( vectorX1, vectorX2,'k');
plot(vectorY1,vectorY2, 'g');
hold off;