%% Práctica 3: Señales continuas
%
% 
%%
%% Objetivos
% 
% * Manipulación básica de MATLAB
% * Gráficas de señales reales y complejas continuas
% * Transformación de señales continuas (escalamientos y traslaciones)
% * Calculo de energía y potencia de señales continuas
%
%% Introducción
% *Historia de matlab:*
%
% El primer MATLAB® no era un lenguaje de programación; 
% Era una simple calculadora de matriz interactiva.
% No había programas, ni cajas de herramientas, ni gráficos. Y no ODEs o FFTs.
% 
% La base matemática para la primera versión de MATLAB fue una serie de trabajos 
% de investigación de JH Wilkinson y 18 de sus colegas, publicados entre 1965 y 1970
% y luego recopilados en Handbook for Automatic Computation, Volume II, Linear Algebra,
% editado por Wilkinson y C. Reinsch Estos documentos presentan algoritmos, implementados
% en Algol 60, para resolver problemas de ecuaciones lineales de matrices y valores propios.
%
% En 1983, Jack Little sugirió la creación de un producto comercial basado en MATLAB. 
% La PC IBM® se había presentado solo dos años antes. Apenas era lo suficientemente 
% potente como para ejecutar un programa como MATLAB, pero Little anticipó su evolución. 
% Dejó su trabajo, compró un clon de PC Compaq ® en Sears, se mudó a Stanford y junto a 
% Cleve Moler y Steve Bangert escribieron una versión nueva y extendida de MATLAB en C.
% 
% *Alternativas de código abierto:*
% 
% * <https://www.gnu.org/software/octave/ GNU Octave>:
% Puede ser la alternativa más conocida a MATLAB. En desarrollo activo durante 
% casi tres décadas, Octave se ejecuta en Windows, Mac y Linux, y está empaquetado para la 
% mayoría de las distribuciones principales.
% * <https://www.scilab.org/ Scilab>: 
% Es otra opción de código abierto para computación numérica que se ejecuta en todas
% las plataformas principales: Windows, Mac y Linux incluidos. Scilab es quizás la alternativa 
% más conocida fuera de Octave, y (como Octave) es muy similar a MATLAB en su implementación,
% aunque la compatibilidad exacta no es un objetivo de los desarrolladores del proyecto.
% * <https://www.python.org/ Python>:
% Python es un lenguaje de programación general (como Java, C, C++,…). En principio no tiene 
% nada que ver con matlab. Sin embargo, existe unas bibliotecas de cálculo científico para 
% Python que permite incluir casi la misma funcionalidad en un lenguaje de programación general.
% * <https://julialang.org/ Julia>:: 
% Es un lenguaje de programación homoicónico, multiplataforma y multiparadigma de tipado 
% dinámico de alto nivel y alto desempeño para la computación genérica, técnica y científica,  
% con una sintaxis similar a la de otros entornos de computación similares
% * <http://www.sagemath.org/index.html SageMath>:
% Es otro sistema de software de matemáticas de código abierto que podría ser una
% buena opción para aquellos que buscan una alternativa de MATLAB. Está construido sobre una 
% variedad de conocidas bibliotecas de computación científica basadas en Python, y su propio 
% lenguaje es sintácticamente similar a Python. Tiene muchas características que incluyen una 
% interfaz de línea de comandos, cuadernos basados en navegador, herramientas para incrustar 
% fórmulas en otros documentos y, por supuesto, muchas bibliotecas matemáticas.
%% Desarrollo parte 1
%
% Crea una función que se llame _fun1_ y reciba dos parametros $\omega$ y 
% $a$ la función debe regresar la evaluación $F(\omega)=a/(a^2+\omega^2)$,
% esta función debe trabajr con $a\in R$ y $t\in  R^n$. Debe
% mostrar su código en el reporte (sin ejecutar).
%%
%   function w=fun1(t,a)
%      w=a/(t.^2+a^2);
%   end
%
%%
%
%
%% Desarrollo parte 2
%
% Construya una función que gráfique funciones de
% $f:R\rightarrow R$ en el formato de su elección y pruebe
% su código mostrando la gráfica de $F(\omega)$ vs $\omega$ en el intervalo
% $[-2,2]$ para $a=1$, no debe
% incluir el código, solo el uso de la función para mostrar la gráfica
%
graficar(-2:0.1:2,fun1(-2:0.1:2,1));
%% Desarrollo parte 4
%
% *SECCION M1.1*
%
%%
f = @(t) exp(-t).*cos(2*pi*t); 
t = 0;
f(t)
f(0)
t = (-2:2);
f(t) 
plot(t,f(t)); 
xlabel('t'); 
ylabel('f(t)')
grid;
%%
t = (-2:0.01:2);
plot (t,f(t)); 
xlabel('t'); 
ylabel('f(t)'); 
grid;
%%
% *SECCION M1.2*
%
%%
u = @(t) t>=0;

%%
%