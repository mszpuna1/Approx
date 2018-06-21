function g = Approximation2(x,y,n)
%Aproksymacja próbek danych f(x)=y metod¹ najmniejszych kwadratów za pomoc¹
%rozk³adu QR macierzy Grama
%x,y - wspó³rzêdne punktów
%n- stopieñ wielomianu
%pozosta³e oznaczenia analogicznie do tych w kodzie zadania 2a
n=n+1;
w=size(x);
A=zeros(w(1,2),n);
for i=1:w(1,2)
    for j=1:n 
        A(i,j)=x(i)^(j-1);
    end
end
MG=A'*A;
rozw=A'*y;
[Q,R]=qrnarrow(MG);
rozw=Q'*rozw;
MG=R;

g=pelny_gauss(MG,rozw);
if( n == 1)
f = @(x) g(1);
end
if(n == 2)
f = @(x) g(1) + g(2)*x.^1;
end
if(n == 3)
f = @(x) g(1) + g(2)*x.^1 + g(3)*x.^2;
end
if(n == 4)
f = @(x) g(1) + g(2)*x.^1 + g(3)*x.^2 + g(4)*x.^3;
end
if(n == 5)
f = @(x) g(1) + g(2)*x.^1 + g(3)*x.^2 + g(4)*x.^3 + g(5)*x.^4;
end
if(n == 6)
f = @(x) g(1) + g(2)*x.^1 + g(3)*x.^2 + g(4)*x.^3 + g(5)*x.^4 + g(6)*x.^5;
end
if(n == 7)
f = @(x) g(1) + g(2)*x.^1 + g(3)*x.^2 + g(4)*x.^3 + g(5)*x.^4 + g(6)*x.^5 + g(7)*x.^6;
end

xf = -5:0.1:5;
hold on
plot(xf, f(xf));
for i = 1:w(1,2)
plot(x(i), y(i), 'r*');
r(i)=f(x(i))-y(i);
end