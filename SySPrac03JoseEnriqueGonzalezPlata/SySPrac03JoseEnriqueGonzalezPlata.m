%% Pr�ctica 3: Se�ales continuas
%
% 
%%
%% Objetivos
% 
% * Manipulaci�n b�sica de MATLAB
% * Gr�ficas de se�ales reales y complejas continuas
% * Transformaci�n de se�ales continuas (escalamientos y traslaciones)
% * Calculo de energ�a y potencia de se�ales continuas
%
%% Introducci�n
% *Historia de matlab:*
%
% El primer MATLAB� no era un lenguaje de programaci�n; 
% Era una simple calculadora de matriz interactiva.
% No hab�a programas, ni cajas de herramientas, ni gr�ficos. Y no ODEs o FFTs.
% 
% La base matem�tica para la primera versi�n de MATLAB fue una serie de trabajos 
% de investigaci�n de JH Wilkinson y 18 de sus colegas, publicados entre 1965 y 1970
% y luego recopilados en Handbook for Automatic Computation, Volume II, Linear Algebra,
% editado por Wilkinson y C. Reinsch Estos documentos presentan algoritmos, implementados
% en Algol 60, para resolver problemas de ecuaciones lineales de matrices y valores propios.
%
% En 1983, Jack Little sugiri� la creaci�n de un producto comercial basado en MATLAB. 
% La PC IBM� se hab�a presentado solo dos a�os antes. Apenas era lo suficientemente 
% potente como para ejecutar un programa como MATLAB, pero Little anticip� su evoluci�n. 
% Dej� su trabajo, compr� un clon de PC Compaq � en Sears, se mud� a Stanford y junto a 
% Cleve Moler y Steve Bangert escribieron una versi�n nueva y extendida de MATLAB en C.
% 
% *Alternativas de c�digo abierto:*
% 
% * <https://www.gnu.org/software/octave/ GNU Octave>:
% Puede ser la alternativa m�s conocida a MATLAB. En desarrollo activo durante 
% casi tres d�cadas, Octave se ejecuta en Windows, Mac y Linux, y est� empaquetado para la 
% mayor�a de las distribuciones principales.
% * <https://www.scilab.org/ Scilab>: 
% Es otra opci�n de c�digo abierto para computaci�n num�rica que se ejecuta en todas
% las plataformas principales: Windows, Mac y Linux incluidos. Scilab es quiz�s la alternativa 
% m�s conocida fuera de Octave, y (como Octave) es muy similar a MATLAB en su implementaci�n,
% aunque la compatibilidad exacta no es un objetivo de los desarrolladores del proyecto.
% * <https://www.python.org/ Python>:
% Python es un lenguaje de programaci�n general (como Java, C, C++,�). En principio no tiene 
% nada que ver con matlab. Sin embargo, existe unas bibliotecas de c�lculo cient�fico para 
% Python que permite incluir casi la misma funcionalidad en un lenguaje de programaci�n general.
% * <https://julialang.org/ Julia>:: 
% Es un lenguaje de programaci�n homoic�nico, multiplataforma y multiparadigma de tipado 
% din�mico de alto nivel y alto desempe�o para la computaci�n gen�rica, t�cnica y cient�fica,  
% con una sintaxis similar a la de otros entornos de computaci�n similares
% * <http://www.sagemath.org/index.html SageMath>:
% Es otro sistema de software de matem�ticas de c�digo abierto que podr�a ser una
% buena opci�n para aquellos que buscan una alternativa de MATLAB. Est� construido sobre una 
% variedad de conocidas bibliotecas de computaci�n cient�fica basadas en Python, y su propio 
% lenguaje es sint�cticamente similar a Python. Tiene muchas caracter�sticas que incluyen una 
% interfaz de l�nea de comandos, cuadernos basados en navegador, herramientas para incrustar 
% f�rmulas en otros documentos y, por supuesto, muchas bibliotecas matem�ticas.
%% Desarrollo parte 1
%
% Crea una funci�n que se llame _fun1_ y reciba dos parametros $\omega$ y 
% $a$ la funci�n debe regresar la evaluaci�n $F(\omega)=a/(a^2+\omega^2)$,
% esta funci�n debe trabajr con $a\in R$ y $t\in  R^n$. Debe
% mostrar su c�digo en el reporte (sin ejecutar).
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
% Construya una funci�n que gr�fique funciones de
% $f:R\rightarrow R$ en el formato de su elecci�n y pruebe
% su c�digo mostrando la gr�fica de $F(\omega)$ vs $\omega$ en el intervalo
% $[-2,2]$ para $a=1$, no debe
% incluir el c�digo, solo el uso de la funci�n para mostrar la gr�fica
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