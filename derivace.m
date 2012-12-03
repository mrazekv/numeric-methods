% skript pro reseni derivaci numerickym zpusobem

function ret=f(x)
	ret=x*exp(-x);
	ret=x*sin(x);
end

x=1;
last=0;
for h=0.01:0.01:1
	der=(f(x+h)-f(x))/h;
	der2=(f(x)-f(x-h))/h;
	
	printf("%.2f %f - %f delta:%f\n",h,der,der2,abs(last-der))
	last=der;
end



