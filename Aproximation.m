function wsp = Approximation(x,y,n)
%Aproksymacja próbek danych f(x)=y metod¹ najmniejszych kwadratów za pomoc¹
%wielomianu najlepszego dopasowania
%x,y - wspó³rzêdne punktów
%n- stopieñ wielomianu
n=n+1;
rozmiar=size(x);
A=zeros(rozmiar(1,2),n); %w przypadku zadanych danych: rozmiar(1,2) =11
for i=1:rozmiar(1,2) 
    for j=1:n 
        A(i,j)=x(i)^(j-1);
    end
end
MG=A'*A; %Macierz Grama
rozw=A'*y;
% rozwi¹zywanie uk³adu MG*wsp=rozw
wsp =pelny_gauss(MG, rozw);

%f- funkcja aproksymuj¹ca
%wsp - wspó³czynniki stoj¹ce przy wyrazach wielomianu
if( n == 1)
f = @(x) wsp(1);
end
if(n == 2)
f = @(x) wsp(1) + wsp(2)*x.^1;
end
if(n == 3)
f = @(x) wsp(1) + wsp(2)*x.^1 + wsp(3)*x.^2;
end
if(n == 4)
f = @(x) wsp(1) + wsp(2)*x.^1 + wsp(3)*x.^2 + wsp(4)*x.^3;
end
if(n == 5)
f = @(x) wsp(1) + wsp(2)*x.^1 + wsp(3)*x.^2 + wsp(4)*x.^3 + wsp(5)*x.^4;
end
if(n == 6)
f = @(x) wsp(1) + wsp(2)*x.^1 + wsp(3)*x.^2 + wsp(4)*x.^3 + wsp(5)*x.^4 + wsp(6)*x.^5;
end
if(n == 7)
f = @(x) wsp(1) + wsp(2)*x.^1 + wsp(3)*x.^2 + wsp(4)*x.^3 + wsp(5)*x.^4 + wsp(6)*x.^5 + wsp(7)*x.^6;
end

%fragment odpowiedzialny za wykres
xf = -5:0.1:5;
hold on
plot(xf, f(xf));
for i = 1:rozmiar(1,2)
plot(x(i), y(i), 'r*');
r(i)=f(x(i))-y(i);
end