function r=trapecio(f,a,b)
% f: función a integrar
% [a,b] Intervalo de integración
n=15;
h=(b-a)/n;
u=(b-a)/2;
sum=0;
ft=sym(f);
for l=1:1:(n-1)
    sum=sum+f(a+l*h);
end
ddf=diff(diff(ft));
fu=matlabFunction(ddf);
r=(h/2)*(f(a)+f(b))+h*sum-(((b-a)/12)*h^2)*fu(u);
end