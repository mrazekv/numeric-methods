# Ukol 1 pro octave
# metodou regula falsi vyresit rovnici cos(x)+exp(x)=0

# Sem se zada pozadovana funkce
function retval=f(x)
	retval=x*x*x+3.1*x*x+1.36*x-1.104;
endfunction


epsilon=0.005;
i=1;

x=0;
a=0;
b=1;

printf("N\tx\t\ta\t\tb\t\tf(a)\t\tf(b)\t\tf(x)\n")
do
	x_old=x;
	x=b-(b-a)*f(b)/(f(b)-f(a));
	printf("%d\t%.6e\t%.6e\t%.6e\t%.6e\t%.6e\t%.6e\n",i,x,a,b,f(a),f(b),f(x)) 
	
	if(f(a)*f(x)<0) 
		a=a;
		b=x;
	elseif(f(x)*f(b)<0)
		a=x;
		b=b;
	else
		printf("Chyba vypoctu - nekonverguje!!!")
	end
	i++;
until (abs(x-x_old)<epsilon && i<1000)



