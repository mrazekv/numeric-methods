# Reseni soustavy rovnic Gaussseidlovou metodou

# Zadana rovnice
rovnice=[8 7 1 4;7 9 3 5 ; 0 1 6 8 ];
# Pocatecni reseni
reseni=[0 0 0];
# Pozadovana presnost
epsilon=0.00001;

abeceda=['a':'z'];
velikost=size(rovnice);

for r=1:velikost(1)
	for c=1:(velikost(2)-1)
		printf("%+5d%c",rovnice(r,c),abeceda(c))
	endfor
	printf("=%d\n",rovnice(r,velikost(2)))
	
endfor

printf("Zkontrolujte dominantnost (radkovou nebo sloupcovou)\n")

printf("Reseni podle octave\n")
rref(rovnice)


# Funkce pro ukonceni pocitani
function resval=pokracovat(x,y,epsilon)
	resval=1;
	for i=1:size(x)(2)
		if(abs(x(i)-y(i))>epsilon)
			resval=0;
		end
	endfor
endfunction


printf("N\t")
for c=1:velikost(2)-1
	printf("%c\t\t",abeceda(c))
endfor
printf("\n")

N=0;
do
	oldreseni=reseni;
	for r=1:velikost(1)
		reseni(r)=rovnice(r,velikost(2));
		#printf("(%d",rovnice(r,velikost(2)))
		for i=1:r-1
			reseni(r)-=rovnice(r,i)*reseni(i);
		#	printf(" - %d * %f",rovnice(r,i),reseni(i))
		endfor
	
		for i=r+1:velikost(2)-1
			reseni(r)-=rovnice(r,i)*oldreseni(i);
		#	printf(" - %d * %f",rovnice(r,i),oldreseni(i))
		endfor
		reseni(r)/=rovnice(r,r);
		#printf(")/%d\n",rovnice(r,r))
	endfor

	printf("%d\t",N++)
	for c=reseni
		printf("%.4f\t\t",c)
	endfor
	printf("\n")

until(pokracovat(reseni,oldreseni,epsilon))
