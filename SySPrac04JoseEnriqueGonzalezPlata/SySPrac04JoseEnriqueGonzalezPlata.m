%% Práctica 4: Convolución y Correlación de señales en tiempo continuo
%
%
% Grupo: 2TV1
%
% Unidad de aprendizaje: Señales y Sistemas
%
% Alumnos:
% 
% _Aparicio Espinoza Octavio Joel_
%
% _Gonzalez Plata Jose Enrique_
%
% _Morales Rodriguez Diego Emilio_
%
% _Morales Vazquez Pedro Benigno_
%
% Profesor: Dr. Rafael Martínez Martínez
%
%


%% Objetivos
% 
% * Conocer métodos básicos de integración numérica.
% * Manipulación de instrucciones en MATLAB.
% * Simular convoluciones y correlaciones de señales continuas.
%
%% Introducción
% *Métodos numéricos: Teorema fundamental del Cálculo, Integración 1*
%
% Integración:
%
% La integral en el intervalo [a,b]  de la función f(x) se denota como:
% $\int_a^b{f(x)dx}$ y representa el área definida por la gráfica de la
% función f(x) y las rectas formadas por los puntos (a,0) y (b,0).
%
% Teorema fundamental del cálculo: Si f es integrable, y
% $\frac{df(x)}{dx}=f(x)$  entonces:
%
% $\int_a^b{f(x)dx}=F(b)-F(a)$
%
% Para encontrar F usamos técnicas de integración, tales como: cambio de
% variable, integración por partes, etc.
%
% Ejemplo:
% 
% Sea la función $f(x)=e^{-x^2}$ 
%
% $\int_{-1}^1{f(x)dx}=\int_{-1}^1{e^{-x^2}dx}=F(1)-F(-1)$ con
% $\frac{dF(x)}{dx}=f(x)$ 
%
% Pero desconocemos F(x) por lo que no podemos evaluar en la función
% 
%%
    %Grafica de $e^{-x^2}$
    x=-1:0.1:1;
    hold on
    %Grafica del polinomio P(x)=1
    plot([-1,1],[1,1],'r')
    grid on
    axis([-2 2, 0, 2])
    area(x,exp(-x.^2))
    hold off
%%
% Aproximamos $e^{-x^2}$ a una polinomio P(x)=1. De esta forma:
%
% $\int_{-1}^1{P(x)dx}=\int_{-1}^1{dx}=x|_{-1}^1=2$
%
% Entonces: 
% 
% $\int_{-1}^1{e ^{-x^2}dx}<2$
%
% Si se aplica alguna de las próximas técnicas se obtiene:
%
% $\int_{-1}^1{e^{-x^2}dx}\approx 1.4936$
%
% *Métodos numéricos: Newton-Cotes, regla del trapecio, Integración 2*
%
% El metodo de Newton-Cotes consiste en resolver la integral de una función
% $f(x)$ derivable un numero n de veces, con derivada continua. Entonces de
% acuerdo a la teoría de lagrange la función puede escribirse como un
% polinomio de grado m.
%
% Se utilizan los polinomios de interpolación de Lagrange
% $f\in C^n[a,b]$ existe $\xi (x)\in (a,b)$
%
% $f(x)=P(x)+\frac{f^{n+1}\xi(x)}{(n+1)!}(x-x_0)(x-x_1)\cdots (x-x_n)$
% 
% con $x\in [a,b]$ y $x_i\in [a,b]$
%
% <<interpolacionLagrange.PNG>>
%
% Fórmula cerrada de n+1 puntos de Newton-Cortes
%
% * $x_0=a$
% * $x_n=b$
% * $h=\frac{b-a}{n}$(paso)
% * $x_i=x_0+ih$; $i=0,1,...,n$
%
% donde n es el grado de polinomio.
%
% Primer formula de interpolación de Newton-Cotes: Regla de trapecio(n=1)
% 
% Basicamente estamos encontrando un polinomio de gradio 1. Entonces
% necesitamos dos puntos de interpolación entre a y b, donde
% $x_0=a$ y $x_1=b$. Con lo que tenemos:
%
% $\int_{x_0}^{x_1}{f(x)dx}=\frac{h}{2}[f(x_0)+f(x_1)]-\frac{h^3}{12}f''(\xi)$;
% $x_0<\xi <x_1$
% 
% con:
%
% * $x_0=a$ 
% * $x_1=b$ 
% * $h=b-a$
% * $x_i=a+i(b-a)$; $i=0,1$
%
% $\forall$Grado de precisión
%
% En donde $\frac{h}{2}[f(x_0)+f(x_1)]$ define el área de un trapecio y
% $\frac{h^3}{12}f''(\xi)$ es el termino de error por la segunda derivada
% de f evaluada en numero $\xi$
% 
% El grado de presición es el grado del polinomio tal que la aproximación tenga
% error cero.
%
% Ejemplo:
%
% $\int_{-1}^1{e^{-x^2}dx}=\frac{2}{2}[e^{-1} + e^{-1}]-8/12[-2e^{-\xi ^2}(1-2\xi ^2)$; $-1<\xi <1$
%
% = $0.7337+\frac{4}{3} e^{-3^2}(1-2\xi ^2)$
%
% *Métodos numéricos: Newton-Cotes, regla de Simpson, regla de 3/8 de
% Simpson, Integración 3*
%
% En el caso de la regla de Simpson, a diferencia de la regla del trapecio que encontrabamos un
% polinomio de grado uno con dos puntos de interpolación, encontraremos un
% polinomio de grado dos con tres puntos de interpolación
%
% Así tenemos que la Regla de Simpson(n=2) es:
%
% $\int_{x_0}^{x_2}{f(x)dx}=\frac{h}{3}[f(x_0)+4f(x_1)+f(x_2)]-\frac{h^5}{90}f^{(4)}(\xi)$;
% $x_0<\xi <x_2$
%
% <<Simpson.PNG>>
%
% En este caso en lugar de encontrar el área bajo el trapecio se tiene el
% área bajo la parabola. Tenemos:
%
% * $x_0=a$
% * $x_2=b$
% * $h=\frac{b-a}{2}$
% * $x_i=a+ih$; $i=0,1,2$
%
% Ejemplo:
%
% $\int_{-1}^1{e^-x^2dx}=\frac{1}{3}[e^{-1}+4e^0+e^{-1}]-\frac{1}{90}[-4e^{-\xi ^2}(-4\xi ^4 +12\xi ^2 -3)]$
%
% $=1.5785+\frac{2}{45}e^{-\xi ^2}(-4\xi ^4 +12\xi 2 -3)$; $-1<\xi <1$
%
% Regla de tres octavos de Simpson(n=3)
%
% Al igual que para el caso anterior aumentamos el grado del polinomio a 3,
% con lo que ahora necesitaremos cuatro puntos de interpolación. En este
% caso la función sería:
%
% $\int_{x_0}^{x_3}{f(x)dx}=\frac{3}{8}h[f(x_0)+3f(x_1)+3f(x_2)+f(x_3)]-\frac{3h^5}{80}f^{(4)}+12\xi^2-3]$;
% $x_0<\xi <x_3$
%
% * $x_0=a$
% * $x_3=b$
% * $h=\frac{b-a}{3}$
% * $x_i=a+i(\frac{b-a}{3})$; $i=0,1,2,3$
%
% Ejemplo:
%
% $\int_{-1}^1{e^{-x^2}dx}=\frac{3}{8} (\frac{2}{3}) [e^{-1}+3e^{-\frac{1}{9}}+3e^{-\frac{1}{9}}+e^{-1}]- \frac{3}{80} (\frac{2}{3})^5[-4e^{-\xi ^2}(-4\xi ^4 +12\xi ^2 -3)]$
%
% $=1.5261+\frac{8}{405}e^{-\xi ^2}(-4\xi ^4 +12\xi ^2 -3)$; $-1<\xi <1$
%
% *Fórmulas cerradas de Newton-Cotes compuestas*
%
% Son una extensión de las fórmulas cerradas de Newton-Cotes, en la que se
% hace más de una aproximación de polinomios para la función, segmentandola
% y asignandole una aproximación a cada parte.
%
% <<Newton-CotesCompuesta.PNG>>
%
% Regla compuesta del trapecio
% 
% 
% $$\int_a^b{f(x)dx}=\frac{h}{2}[f(a)+2\sum_{j=1}^{n-1}{f(x_j)}+f(b)] -\frac{b-a}{12}h^2f^(2)(\mu )$
% con $\mu \in (a,b)$
% 
% * $n$ número de subintervalos
% * $h=\frac{b-a}{n}$ paso
% * $x_j=a+jh;$ $j=0,1,\cdots,n$
%
% Ejemplo:
% 
% * $n=10$
% * $h=\frac{1-(-1)}{10}=0.2$
% * $x_0=-1;x_1=-0.8;x_2=-0.6;\cdots ;x_9=0.8;x_{10}=1$
%
% $$\int_{-1}^1{e^{-x^2}dx}=\frac{0.2}{2}[e^{-1}+
% 2\sum_{j=1}^{n-1}{e^{-x_j^2}+e^{-1}}]-\frac{2}{12}(0.2)^2[-2e^{-\mu ^2}
% (1-2\mu ^2)]$
%
% $=1.4887+0.0133e^{-\mu ^2}(1-2\mu ^2);$ $-1<\mu <1$
%
% Regla compuesta de Simpson
%
% $$\int_a^b{f(x)dx}=\frac{h}{3}[f(a)+2\sum _{j=1}^{(\frac{n}{2})
% -1}{f(x_{2j})}+4\sum_{j=1}^{\frac{n}{2}}{f(x_{2j-1})}+f(b)]-
% (\frac{b-a}{180})h^4f^{(4)}(\mu )$ con $\mu \in (a,b)$ 
% 
% Ejemplo:
% * $n=10$
% * $h=\frac{1-(-1)}{10}=0.2$
% * $x_0=-1;x_1=-0.8;x_2=-0.6;\cdots ;x_9=0.8;x_{10}=1$
%
% $$\int_{-1}^1{e^{-x^2}dx}=\frac{0.2}{3}[e^{-1}+2\sum_{j=1}^4{e^{-x_{2j}^2}}
% 4\sum_{j=1}^5{e^{-(x_{2j}-1)^2}}+e^{-1}]-\frac{2}{180}(0.2)^4[-4e^{-4^2}(
% -4\mu ^4 +12\mu ^2-3)] $$
% 
% $=1.4936+0.000071e^{-\mu ^2}(-4\mu ^4 +12\mu ^2-3);-1<\mu <1$
% 
% *Cuadratura gaussiana*
%
% Las fórmulas cerradas de Newton-Cotes son solo fórmulas de cuadratura, 
% estas tenían cierto grado de exactitud, dependiendo del grado del 
% polinomio de interpolación de Lagrange. En este caso se utilizan 
% polinomios de Legendre para aproximar integrales de funciones que 
% satisfagan cierta cantidad de error (el error sea el mínimo) esto es lo 
% que se conoce como cuadratura gaussiana. Los polinomios de Legendre se
% definen entre -1 y 1 y son:
%
% ${1,x,x^2-\frac{1}{3},x^3-\frac{3}{5} x,x^4-\frac{6}{7} x^2+\frac{3}{35} ,\cdot}$
%
% * $P_n(x)$ Polinomio de Legrende de grado n
% * $x_1,x_2,\cdot ,x_n$ raíces del polinomio
% * $c_i=\int_{-1}^1{\prod_{j=1\neq i}^n{\frac{x-x_j}{x_i-x_j}}dx}$
%
% Para un polinomio de grado menor a 2n
% 
% $\int_{-1}^1{f(x)dx}\approx \sum_{i=1}^n{c_if(x_i)}$
%
% Para un intervalo entre [a,b]
%
% $\int_a^b{f(x)dx}=\int_{-1}^1{f(\frac{(b-a)t+b+a}{2})(\frac{b-a}{2})dt}$
%
% * n=2
%
% $$int_{-1}^1{e^{-x^2}dx}\approx
% e^{-(0.5773502692)^2}+e^{-(0.5773502692)^2}\approx 1.4331$$
%
% * n=3
%
% $$\int_{-1}^1{e^{-x^2}dx}\approx
% 0.55555556e^{-0.7745966692)^2}+0.88888889+0.55555556e^{-0.7745966692)^2}\approx
% 1.4986$$
%
%% Desarrollo 1
% Para el PR04 reporte la grafica de la simulación númerica de la convolución y compare 
% con el resultado análitico que obtuvo para el problema 1, esto es, su práctica tendrá 
% que incluir una llamada a la funciónn convconm y posteriormente se tendrá que mostrar 
% (mediante el Publish) la gráfica tanto de las señales invlucradas como el resultado de
% la convolución, y en esta última gráficara su resultado analitico, se tendrá que incluir 
% el resultado analitico. Investigue como crear un giff e inserte la animación.
% Realizar la convolucion de las siguientes señales:
%
% $$ x(t)= \left\{ \begin{array}{lcc}
%             1-t &     & 0<t\leq 1 \\
%              t-1 &   & 1<t \leq 2 \\
%              0   &    & c.o.c
%             \end{array}
%   \right.
% $$
%
% $$ h(t)= \left\{ \begin{array}{lcc}
%             1 &     & 0<t \leq 1 \\
%              0   &    &c.o.c
%             \end{array}
%   \right.
% $$
%
% La convolucion es:
%
% $$ x(t)*h(t)= \left\{ \begin{array}{lcc}
%             -\frac{t^2}{2}+t &     & 0\leq t< 1 \\
%             \frac{(t-1)^2}{2}-2t+\frac{t^2}{2}+2 & &1\leq t<2 \\
%             -\frac{(t-1)^2}{2}+t-1 & &2\leq t<3 \\
%             0 &   & c.o.c
%             \end{array}
%   \right.
% $$
%
% En Matlab seria:
%
%%
figure
subplot(1,3,1)
syms t
x=piecewise(t<1, 1-t, t>1, t-1);
fplot(x,[0,2],'r')
grid on
title('x(t)')
subplot(1,3,2)
h=piecewise(t<1, 1);
fplot(h,[0,1],'r')
grid on
title('h(t)')
y=piecewise(t<1, -t^2/2+t, t<2, (((t-1)^2)/2)-(2*t)+(t^2/2)+2, t<3, -(((t-1)^2)/2)+t-1);
subplot(1,3,3)
fplot(y,[0,3],'r')
grid on
title('x(t)*h(t)')
%%
% Utilizando la funcion convconm quedaria:
%
%%
x=@(t) (1-t).*(0<=t&t<=1)+(t-1).*(t>=1&t<=2);
h= @(t) (1).*(0<=t&t<=1);
convconm(x,h)
%% Desarrollo 2
% Para el PR04 reporte la grafica de la simulación númerica de la convolución
% y compare con el resultado análitico que obtuvo para el problema 3, esto es,
% su práctica tendrá que incluir una llamada a la funciónn convconm y posteriormente
% se tendrá que mostrar (mediante el Publish) la gráfica tanto de las señales involucradas 
% como el resultado de la convolución, y en esta última gráficara su resultado analitico, 
% se tendrá que incluir el resultado analitico. Investigue como crear un giff e inserte la animación.
%
% Realizar la convolucion de las siguientes señales:
%
% $$ f(t)= \left\{ \begin{array}{lcc}
%             t &     & 0<t\leq 1 \\
%             1 &   & 1<t \leq 2 \\
%             0   & c.o.c
%             \end{array}
%   \right.
% $$
%
% $$ g(t)= \left\{ \begin{array}{lcc}
%             1 &     & 1<t \leq 3 \\
%             0   & c.o.c
%             \end{array}
%   \right.
% $$
%
% La convolucion es:
%
% $$ f(t)*g(t)= \left\{ \begin{array}{lcc}
%             \frac{1}{2}-t+t^2 &     & 1\leq t< 2 \\
%             t-\frac{3}{2} & 2\leq t<3 \\
%             3t-3-\frac{t^2}{2} & 3\leq t<4 \\
%             5-t & 4\leq t<5 \\
%             0   & c.o.c
%             \end{array}
%   \right.
% $$
%
% En Matlab quedaria asi:
%
%%
figure
subplot(1,3,1)
syms t
f=piecewise(t<0,0,t<1, t, t>1, 1,t>2,0);
fplot(f,[-1,3],'r')
grid on
axis([-2 5, -1, 2])
title('f(t)')
subplot(1,3,2)
g=piecewise(t<1,0,t<3, 1,t>3,0);
fplot(g,[0,4],'r')
grid on
axis([-2 5, -1, 2])
title('g(t)')
z=piecewise(t<2, (1/2)-t+t^2, t<3, t-3/2, t<4, 3*t-3-(t^2)/2, t<5, 5-t);
subplot(1,3,3)
fplot(z,[0,5],'r')
grid on
title('f(t)*g(t)')
%%
% Utilizando la funcion convconm quedaria:
%
%%
f=@(t) (t).*(0<=t&t<1)+(1).*(t>=1&t<=2);
g= @(t) (1).*(t>=1 & t<=3);
convconm(f,g)
axis([0 6 0 2]);
%% 
% Para realizar la correlación , modificamos la funcion _convconm.m_ y
% creamos _corrconm.m_:
%
% function corrconm(x,h)
%
%  figure (1) % Se crea una figura para hacer las gráficas
%
%  dtau = 0.005; % Base de los rectangulos para realizar la integral 
%
%  tau = -6:dtau:6; % Intervalo de visualización del resultado
%
%  ti = 0; % Indice para el vector de resultados
%
%  tvec = -6:.1:6; % traslaciones de t, cuantas integrales se calulan  
%
%  y = NaN*zeros(1, length (tvec)); % Resultados de acuerdo a cuantos t
%
%  for t = tvec, % Cantidad de traslaciones
%
%      ti = ti+1; % Indice para guardar el resultado (indice del tiempo)
%
%      xh = x(-t+tau).*h(tau); % resultado de la multiplicación 
%
%      lxh = length(xh); % longitud del resultado
%
%      y(ti) = sum(xh.*dtau); % Base por altura, aproximación de la integral
%
%      subplot (2,1,1), % gráfica de 2 x 1 (primera)
%
%      plot(tau, h(tau), 'r-', tau, x(-t+tau), 'g--', t, 0, 'ob'); %graficas
%
%      axis ([tau(1) tau(end) -2.0 5.0]); % límites de los ejes
%
%      patch([tau(1:end-1); tau(1:end-1); tau(2:end); tau(2:end)],...
%
%      [zeros(1,lxh-1);xh(1:end-1);xh(2:end);zeros(1,lxh-1)],...
%
%      [.8 .8 .8], 'edgecolor', 'none');
%
%      xlabel('\tau'); % Texto del eje X
%
%      legend('h(\tau)', 'x(-t+\tau)','t','h(\tau)x(-t+\tau)')% Caja de Texto 
%
%      subplot (2, 1, 2)  % gráfica de 2 x 1 (segunda)
%
%      plot (tvec, y, 'k', tvec (ti), y(ti), 'ok');
%
%      xlabel ('t'); 
%
%     ylabel ('y(t) = \int h(\tau)x(t-\tau) d\tau');
%
%      axis ([tau(1) tau(end) -2.0 5.0]); % límites del eje
%
%      grid; % malla
%
%      drawnow; % efecto de movimiento continuo
%
%  end
%  end
%% Desarrollo 3
% Para el PR06 reporte la grafica de la simulación númerica de la correalción y 
% compare con el resultado análitico que obtuvo para el problema e), esto es, su
% práctica tendrá que incluir una llamada a la funciónn convconm y posteriormente se 
% tendrá que mostrar (mediante el Publish) la gráfica tanto de las señales involucradas
% como el resultado de su correlación, y en esta última graficara su resultado analitico,
% se tendrá que incluir el resultado analitico. Investigue como crear un giff e inserte la animación.
%
% Realizar la autocorrelación de la siguiente señal:
%
% $$ f(t)= \left\{ \begin{array}{lcc}
%             1 &     & 0<t<3 \\
%             -1 & 3<t<4 \\
%             0   & c.o.c
%             \end{array}
%   \right.
% $$
%
% La autocorrelacion quedaria:
%
% $$ g(t)= \left\{ \begin{array}{lcc}
%             0 &     & t>0 \\
%             6+t & 0>t>3 \\
%             24+4t & -4>t>-8 \\
%             -6-t & -7>t>-8 \\
%             0   & c.o.c
%             \end{array}
%   \right.
% $$
% En Matlab quedaria asi:
%
%%
figure
subplot(1,2,1)
syms t
x=piecewise(t<0,0,0<=t<3,1,3<t<=4,-1,t>4,0);
fplot(x,[-0.25,4.25],'r')
grid on
title('f(t)')
z=piecewise(0>t>3, 6+t, -4>t>-8, 24+4*t, -7>t>-8, -6-t);
subplot(1,3,3)
fplot(z,[-8,1],'r')
grid on
title('Autocorrelacion')
%%
% Utilizando la funcion convconm quedaria:
%
%%
x = @(t) 1.*(t>=0&t<=3)-1.*(t>=3&t<=4)
h = @(t) 1.*(t>=0&t<=3)-1.*(t>=3&t<=4)
corrconm(x,h);
%% Desarrollo 4
% Para el PR06 reporte la grafica de la simulación númerica de la correalción y compare
% con el resultado análitico que obtuvo para el problema f), esto es, su práctica tendrá
% que incluir una llamada a la funciónn convconm y posteriormente se tendrá que mostrar 
% (mediante el Publish) la gráfica tanto de las señales involucradas como el resultado de su
% correlación, y en esta última graficara su resultado analitico, se tendrá que incluir el
% resultado analitico. Investigue como crear un giff e inserte la animación.
%
% Realizar la correlacion de la siguientes señales:
%
% $$ f(t)= \left\{ \begin{array}{lcc}
%             1 &     & 0<t<3 \\
%             -1 & 3<t<4 \\
%             0   & c.o.c 
%             \end{array}
%   \right.
% $$
%
% $$ g(t)= \left\{ \begin{array}{lcc}
%             1 &     & 0<t<2 \\
%             -1 & 2<t<4 \\
%             0   & c.o.c 
%             \end{array}
%   \right.
% $$
%
% La autocorrelacion quedaria:
%
% $$ f(t)*g(t)= \left\{ \begin{array}{lcc}
%             -t-4 & -4<t<-3 \\
%             t+2 & -3<t<-2 \\
%             3t+6 & -7<t<-1 \\
%             -t+2 & -1<t<0 \\
%             -3t+2 & 0<t<1 \\
%             -t & 1<t<2 \\
%             t-4 & 2<t<4 \\
%             0   & c.o.c
%             \end{array}
%   \right.
% $$
% En Matlab quedaria asi:
%
%%
figure
subplot(1,3,1)
syms t
x=piecewise (t<0,0,0<t<3,1,3<t<4,-1,t>4,0);
fplot(x,[-02.5,6.5],'r')
grid on
title('f(t)')
axis([-1 6 -1.5 1.25]);
subplot(1,3,2)
h=piecewise (t<0,0,0<t<2,1,2<t<4,-1,t>4,0);
fplot(h,[-02.5,6.5],'r')
grid on
title('g(t)')
z=piecewise(-4<t<-3, -t-4, -3<t<-2, t+2, -7<t<-1, 3*t+6, -1<t<0, -t+2, 0<t<1,-3*t+2, 1<t<2, -t, 2<t<4, t-4);
subplot(1,3,3)
fplot(z,[-4,4],'r')
grid on
title('Autocorrelacion')
%%
% Utilizando la funcion convconm quedaria:
%
%%
x = @(t) 1.*(t>=0&t<=3)-1.*(t>=3&t<=4)
h = @(t) 1.*(t>=0&t<=2)-1.*(t>=2&t<=4)
corrconm(x,h);