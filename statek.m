%% zmienne poczatkowe
Tp=0.01;
t=0:Tp:10;
xd=sin(t); %trajektoria ko³a o promieniu 1 sin t
yd=cos(t);  %%trajektoria ko³a o promieniu 1 cos t
x = zeros(1,size(t,2));
y = zeros(1,size(t,2));
psi =zeros(1,size(t,2));
u = zeros(1,size(t,2));
v = zeros(1,size(t,2));
r = zeros(1,size(t,2));
x(1)=-0.01;
y(1)=1.01;
psi(1)=0.01;
u(1)=0.1;
v(1)=0.1;
r(1)=0.1;


ex = zeros(1,size(t,2));
ey = zeros(1,size(t,2));

%% parametry 
tauu=2.8;
taur=0;
m11=1.956;
m22=2.405;
m33=0.043;
d11=2.436;
d22=12.992;
d33=0.0564;
%DEDI
k11=6;
k12=12;
k13=8;
k14=6;
k15=12;
k16=8;
%VIDI
k21=4;
k22=4;
k23=4;
k24=4;
k25=2;
lambda=10;
%ORDI
k31=4;
k32=4;
k33=4;
k34=4;
l=0.01;

%% model
for n=2:size(t,2)
    u(n)=((m22*v(n-1)*r(n-1)-d11*u(n-1)+tauu)/m11)*Tp+u(n-1);
    v(n)=((-m11*u(n-1)*r(n-1)-d22*v(n-1))/m22)*Tp+v(n-1);
    r(n)=(((m11-m22)*u(n-1)*v(n-1)-d33*r(n-1)+taur)/m33)*Tp+r(n-1);
    x(n)=(u(n-1)*cos(psi(n-1))-v(n-1)*sin(psi(n-1)))*Tp+x(n-1);
    y(n)=(u(n-1)*sin(psi(n-1))+v(n-1)*cos(psi(n-1)))*Tp+y(n-1);
    psi(n)=r(n-1)*Tp+psi(n-1);
    
    ex(n)=x(n)-xd(n);
    ey(n)=y(n)-yd(n);
    
    

end



















