%disp(" SOME IMPORTANT NOTATIONS USED HERE:-\n DOWNWARD FORCES ARE CONSIDERED -VE. UPWARD FORCES ARE CONSIDERED +VE.\n CLOCKWISE MOMENTS ARE +VE. ANTICLOCKWISE MOMNETS ARE -VE.");
%disp(" \n HERE, ACCORDING TO THE PROBLEM STATEMENT, THE LENGTH OF THE ROD- 5m.\n POSITION OF FIRST HINGE- AT 1m FROM THE LEFTMOST END.\n POSITION OF SECOND HINGE- 5M FROM THE LEFTMPST END.\n");
x0= input(" Input the position of the helical gear from the leftmost end: \n");
syms dy(r)
dy(r)= ((3^0.5)*1000*(x0-1))/(8*r);
syms by(r)
by(r)= ((3^0.5)*1000*(5-x0))/(8*r);
syms m(r,x)
m(r,x)= (by(r)*sing(x,1,1)) + (dy(r)*sing(x,5,1)) - ((((3^0.5)*500)/r)*sing(x,x0,1));
syms v(r,x)
v(r,x)= (by(r)*sing(x,1,0)) + (dy(r)*sing(x,5,0)) - ((((3^0.5)*500)/r)*sing(x,x0,0));
disp(" CONSIDERING TOPMOST POINT ON THE SHAFT \N");
syms sigxx(r0,ri,x)
sigxx(r0,ri,x)= (1000)/(2*pi*r0*((r0^2)-(ri^2))) + (m(r,x)*r0*4)/(pi*((r0^4)-(ri^4)));
syms sigxz(r0,ri,x)
sigxz(r0,ri,x)= (2*1000*r0)/(pi*((r0^4)-(ri^4)));
syms sigzz(r0,ri,x)
sigzz(r0,ri,x)= 0;
syms sig_top(r0,ri,x)
sig_top(r0,ri,x)= [sigxx(r0,ri,x) sigxz(r0,ri,x);sigxz(r0,ri,x) sigzz(r0,ri,x)];
disp("\n CONSIDERING POINT ON THE SURFACE ON THE HORIZONTAL DIAMETRICAL LINE. \n");
syms sigxx_m(r0,ri,x,)
sigxx_m(r0,ri,x)= (1000)/(2*pi*r0*((r0^2)-(ri^2)));
syms sigxy_m(r0,ri,x)
sigxy_m(r0,ri,x)= ((2*1000*r0)/(pi*((r0^4)-(ri^4)))) + (4*r0*v(r,x))/(pi*(r0-ri)*((ro^2)+(ri^2)));
syms sigyy_m(r0,ri,x)
sigyy_m(r0,ri,x)=0;
syms sig_mid(r0,ri,x)
sig_mid(r0,ri,x)=[ sigxx_m(r0,ri,x) sigxy_m(r0,ri,x);sigxy_m(r0,ri,x) sigyy_m(r0,ri,x)];

function y = sing(x,a,n)
if x>a
  y= (x-a)^n;
else
   y=0;
end
end
