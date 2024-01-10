
% QUESTION 1
% The pressures in bar and the rate in (mol/s-kg cat)
Pa=[33.4;36.7;36;36;37.3;34;35;40;33.4;35.7;35;36;37;34;33;42;25;40;20;46.7];
Pb=[16.6;18.3;20;18;18.7;20;20;20;15;18.3;20;16;18;20;20;22;25;20;10;23.3];
Pc=[0;0;4;0;0;2;2;5;0;0;4;0;0;1.5;1;3;0;0;0;0];
Pe=[0;0;0;0;0;2;1;1;0;0;0.5;0;0;1.5;1;1;0;0;0;0];
Pd=[0;0;0;0;0;0;0;0;1.6;1;0.5;2;1;1;2;1;0;0;10;0];
r_expt1=[0.001686;0.001858;0.001743;0.001821;0.001891;0.000616;0.000934;0.001063;0.001655;0.001795;0.001183;0.001788;0.00186;0.000731;0.000867;0.001156;0.001275;0.002029;0.0006;0.002378];
r_expt2=[0.00438793;0.004841184;0.004574488;0.004745687;0.004928594;0.002390937;0.003205257;0.003623112;0.004214391;0.00463524;0.003654324;0.004554766;0.004804939;0.002670638;0.002924798;0.003893856;0.003333482;0.005294465;0.000212925;0.006213551];
r_expt3=[0.006889783;0.007607659;0.007212518;0.007456599;0.007746235;0.004340534;0.005516684;0.006220984;0.006492759;0.007226676;0.006041677;0.007020195;0.007493483;0.004698205;0.00495384;0.006638929;0.005249744;0.008325636;0.000618798;0.009781165];
r_expt4=[0.016148824;0.017866881;0.017047358;0.017506425;0.018199312;0.012468776;0.014600069;0.016419204;0.014227001;0.016506634;0.015019605;0.01539561;0.017136907;0.012639311;0.012338541;0.017181844;0.012394856;0.019585679;0.001896762;0.023068997];
% generating a table for rate data at 411K
T1=493;
TBL=table(Pa,Pb,Pc,Pe,Pd,r_expt1);
keq1 = 10*exp((5139/T1) -12.621);
model = @(k, x) (k(1).*k(2).*(x(:,2).*(x(:,1).^1.5)-(x(:,5)./((x(:,1).^0.5)*keq1))))./((1 + k(2).*x(:,2)+k(3).*x(:,3)).*((x(:,1).^0.5) + k(4).*x(:,4)));
initialguess = [0.01 0.01 0.1 0.1];

modelfit=fitnlm(TBL,model,initialguess);
z= modelfit.Coefficients.Estimate;
k=z(1)
kb=z(2)
kc=z(3)
kz=z(4)


% generating a table for rate data at 511K
T2=511;
TBL=table(Pa,Pb,Pc,Pe,Pd,r_expt2);
keq2=10*exp((5139/T2) -12.621);
model = @(k, x) (k(1).*k(2).*(x(:,2).*(x(:,1).^1.5)-(x(:,5)./((x(:,1).^0.5)*keq2))))./((1 + k(2).*x(:,2)+k(3).*x(:,3)).*((x(:,1).^0.5) + k(4).*x(:,4)));
initialguess = [0.01 0.01 0.1 0.1];

modelfit=fitnlm(TBL,model,initialguess);
z1= modelfit.Coefficients.Estimate;
k1=z1(1)
kb1=z1(2)
kc1=z1(3)
kz1=z1(4)

% generating a table for rate data at 520K
T3=520;
TBL=table(Pa,Pb,Pc,Pe,Pd,r_expt3);
keq3=10*exp((5139/T3) -12.621);
model = @(k, x) (k(1).*k(2).*(x(:,2).*(x(:,1).^1.5)-(x(:,5)./((x(:,1).^0.5)*keq3))))./((1 + k(2).*x(:,2)+k(3).*x(:,3)).*((x(:,1).^0.5) + k(4).*x(:,4)));
initialguess = [0.01 0.01 0.1 0.1];

modelfit=fitnlm(TBL,model,initialguess);
z2= modelfit.Coefficients.Estimate;
k2=z2(1)
kb2=z2(2)
kc2=z2(3)
kz2=z2(4)

% generating a table for rate data at 538K
T4=538;
TBL=table(Pa,Pb,Pc,Pe,Pd,r_expt4);
keq4=10*exp((5139/T4) -12.621);
model = @(k, x) (k(1).*k(2).*(x(:,2).*(x(:,1).^1.5)-(x(:,5)./((x(:,1).^0.5)*keq4))))./((1 + k(2).*x(:,2)+k(3).*x(:,3)).*((x(:,1).^0.5) + k(4).*x(:,4)));
initialguess = [0.01 0.01 0.1 0.1];

modelfit=fitnlm(TBL,model,initialguess);
z3= modelfit.Coefficients.Estimate;
k3=z3(1)
kb3=z3(2)
kc3=z3(3)
kz3=z3(4)

%E be the root mean square error between k and k1
E=sqrt(mean((k-k1).^2))

%E1 root mean squared error between k and k2
E1=sqrt(mean((k-k2).^2))

% E2 root mean squared  error between k and k3
E2=sqrt(mean((k-k3).^2))
 



