
%For the point on the top of the shaft where Q=0;

disp("Start");
T= 1000;
l1=1;
l2=5;

Q=0;

%x0=input("Enter value of x0");
% R=input("Input R");
% r=input("Input r");
% x=input("Input x");

syms  I(R,r)
I(R,r)=pi*(R^4 - r^4)/4;

syms J(R,r)
J(R,r)= pi*(R^4 - r^4)/2;



syms F(R)
F(R) = 1000/R*cos(pi/6);


syms F1(R)
F1(R)= 1000/R;

syms F2(R)
F2(R)= F(R)*sin(pi/6);

syms Bz(R,x0)
Bz(R,x0)= F1(R)*(x0-l1)/(l2-l1);

syms Az(R,x0)
Az(R,x0)= F1(R)-Bz(R,x0);

syms Ax(R)
Ax(R)=F(R)*sin(pi/6);

syms sigxx_ax(R,r)
sigxx_ax(R,r) = F2(R)/(pi*(R^2 - r^2));

syms V1(x,x0,R)
V1(x,x0,R) = 0;

syms V2(x,x0,R)
V2(x,x0,R) = Az(R,x0);

syms V3(x,x0,R)
V3(x,x0,R) = Az(R,x0) - F1(R);

syms M1(x,x0)   %use when 0<x<1
M1(x,x0) = 0;

syms M2(x,x0)   %use when 1<x<x0
M2(x,x0) = Az(R,x0)*(x-1);

syms M3(x,x0)   %use when x0<x<5
M3(x,x0) = (5-x)/(5-x0)*Az(R,x0)*(x0-1);
        
    
    
syms sigxx_b1(x,R,r) %use when 0<x<1
sigxx_b1(x,x0,R,r) = M1(x,x0)*R/I(R,r);

syms sigxx_net1(x,R,r)%use when 0<x<1
sigxx_net1(x,x0,R,r) = sigxx_ax(R,r) + sigxx_b1(x,x0,R,r);

syms sigxx_b2(x,R,r)  %use when 1<x<x0
sigxx_b2(x,x0,R,r) = M2(x,x0)*R/I(R,r);

syms sigxx_net2(x,R,r) %use when 1<x<x0
sigxx_net2(x,x0,R,r) = sigxx_ax(R,r) + sigxx_b2(x,x0,R,r);

syms sigxx_b3(x,R,r)     %use when x0<x<5
sigxx_b3(x,x0,R,r) = M3(x,x0)*R/I(R,r);

syms sigxx_net3(x,R,r)   %use when x0<x<5
sigxx_net3(x,x0,R,r) = sigxx_ax(R,r) + sigxx_b3(x,x0,R,r);


syms T1(x)
T1(x) = 1000;
syms T2(x)
T2(x)=0;


syms sigxz1(x,R,r)
sigxz1(x,R,r) = T1(x)*R/J(R,r);

syms sigxz2(x,R,r)
sigxz2(x,R,r) = 0;

syms sigxy1(x,x0,R,r)
sigxy1(x,x0,R,r) = V1(x,x0,R)*Q/(I(R,r)*(R-r));

syms sigxy2(x,x0,R,r)
sigxy2(x,x0,R,r) = V2(x,x0,R)*Q/(I(R,r)*(R-r));

syms sigxy3(x,x0,R,r)
sigxy3(x,x0,R,r) = V3(x,x0,R)*Q/(I(R,r)*(R-r));


syms A1(x,x0,R,r)
A1(x,x0,R,r)= [ sigxx_net1(x,x0,R,r) sigxy1(x,x0,R,r) sigxz1(x,R,r); sigxy1(x,x0,R,r) 0 0; sigxz1(x,R,r) 0 0];

syms A2(x,x0,R,r)
A2(x,x0,R,r)= [ sigxx_net2(x,x0,R,r) sigxy2(x,x0,R,r) sigxz1(x,R,r); sigxy2(x,x0,R,r) 0 0; sigxz1(x,R,r) 0 0];

syms A3(x,x0,R,r)
A3(x,x0,R,r)= [ sigxx_net3(x,x0,R,r) sigxy3(x,x0,R,r) sigxz2(x,R,r); sigxy3(x,x0,R,r) 0 0; sigxz2(x,R,r) 0 0];

syms P1(x,x0,R,r)
P1(x,x0,R,r)= eig(A1(x,x0,R,r));

syms P2(x,x0,R,r)
P2(x,x0,R,r)= eig(A2(x,x0,R,r));

syms P3(x,x0,R,r)
P3(x,x0,R,r)= eig(A3(x,x0,R,r));



syms P11(x,x0,R,r)
P11(x,x0,R,r)= [1 0 0]*P1(x,x0,R,r);

syms P12(x,x0,R,r)
P12(x,x0,R,r) = [0 1 0]*P1(x,x0,R,r);

syms P13(x,x0,R,r)
P13(x,x0,R,r) = [0 0 1]*P1(x,x0,R,r);


syms P21(x,x0,R,r)
P21(x,x0,R,r)= [1 0 0]*P2(x,x0,R,r);

syms P22(x,x0,R,r)
P22(x,x0,R,r) = [0 1 0]*P2(x,x0,R,r);

syms P23(x,x0,R,r)
P23(x,x0,R,r) = [0 0 1]*P2(x,x0,R,r);


syms P31(x,x0,R,r)
P31(x,x0,R,r)= [1 0 0]*P3(x,x0,R,r);

syms P32(x,x0,R,r)
P32(x,x0,R,r) = [0 1 0]*P3(x,x0,R,r);

syms P33(x,x0,R,r)
P33(x,x0,R,r) = [0 0 1]*P3(x,x0,R,r);



syms Von1(x,x0,R,r) %for 0<x<1
Von1(x,x0,R,r) = sqrt(( (P11(x,x0,R,r)-P12(x,x0,R,r))^2 + (P12(x,x0,R,r)-P13(x,x0,R,r))^2 + (P11(x,x0,R,r)-P13(x,x0,R,r))^2 )/2);
 
syms Von2(x,x0,R,r) %for 1<x<x0
Von2(x,x0,R,r) = sqrt(((P21(x,x0,R,r)-P22(x,x0,R,r))^2 + (P22(x,x0,R,r)-P23(x,x0,R,r))^2 + (P21(x,x0,R,r)-P23(x,x0,R,r))^2)/2);

syms Von3(x,x0,R,r) % for x0<x<5
Von3(x,x0,R,r) = sqrt(((P31(x,x0,R,r)-P32(x,x0,R,r))^2 + (P32(x,x0,R,r)-P33(x,x0,R,r))^2 + (P31(x,x0,R,r)-P33(x,x0,R,r))^2)/2);



% Rmin = vpasolve(Von2(1.05,1.05,R,0) == 10^8,R);
% disp(Rmin);
% yy=Von2(1.05,1.05,(100^(1/2))*Rmin,(99.95^(1/2))*Rmin);
% disp(double(yy));
% 

Rmin = vpasolve(Von2(1.05,1.05,R,0) == 10^8,R);
disp(Rmin);
yy=Von2(1.05,1.05,(100^(1/2))*Rmin,(99.975^(1/2))*Rmin);
disp(double(yy));

disp("End");





