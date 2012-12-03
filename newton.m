# Reseni soustavy rovnic Newtonovou iteracni metodou

# funkce vraci matici F
function ret=f(x,y)
	ret=[100*x-(y-18)^2-300; (x/20)^2+(y/32.36)^2-1];

#	ret=[(x-1)^2+y^2-4; x+(y+1)^2-1];
endfunction

# funkce vraci matici F'
function ret=df(x,y)
#	ret=[2*(x-1) 2*y; 1 2*(y+1)];	
	ret=[100 -2*y+36; x/200 0.1909910296e-2*y];	
endfunction



x=0;
y=1;
epsilon=0.01;

i=0;
printf("i\tx\t\ty\t\tdelta1\t\tdelta2\n")
do
	matice=[df(x,y) -f(x,y)];
	# Vypocet koeficientu Cramerovym pravidlem
	delta1=det(matice(:,[3 2 ])) / det(matice(:,[1 2]));
	delta2=det(matice(:,[1 3])) / det(matice(:,[1 2]));
	

	printf("%d\t%f\t%f\t%f\t%f\n",i,x,y,delta1,delta2)
	x+=delta1;
	y+=delta2;
	i+=1;
until ((abs(delta1)<epsilon && abs(delta2)<epsilon) )
printf("%d\t%f\t%f\t\n",i,x,y)


