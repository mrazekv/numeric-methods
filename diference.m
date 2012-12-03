# vypocet pomernych diferenci

# body=[1 1; 2 0.5; 2.5 0.4; 3.2 0.3125; 4 0.25]     # Ukazka ze skoly
# body=[5 0; 6 31; 7 37; 8 1; 11 6; 12 8; 71 5 ; 85 3] # Polynom P1
# body=[5 0; 6 31;  8 1; 11 6; 12 8; 71 5 ; 85 3]    # Polynom P2
body=[0 0; 0.3 0.3*exp(-0.3);  0.6 0.6*exp(-0.6);  1 0.3675]

# vypocet tabulky
velikost=size(body);

vysledky=zeros(velikost(1), velikost(1)-1);


for k=1:velikost(1) # cislo sloupce
	for i=1:velikost(1)-k  # cislo radku
		if k==1 
			# pocitani prvnich prvku
			vysledky(i,k)=(body(i+1,2)-body(i,2))/(body(i+1,1)-body(i,1));
		else
			# jinak se pocita pomoci predchazejicih
			vysledky(i,k)=(vysledky(i+1,k-1)-vysledky(i,k-1))/(body(k+i,1)-body(i,1));
		endif
	endfor
endfor

printf "Tabulka pomernych diferenci\n"
diference=[body vysledky]

printf "Prevod na newtonuv interpolacni polynom\n"

printf("P(%d) = %f",velikost(1)-1, body(1 ,2));

for k=1:velikost(1)-1
	printf("%+f",vysledky(1,k))
	for i=1:k
		printf("*(x%+f)",-body(i,1));
	endfor
	
endfor

