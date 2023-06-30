clc; clear all; close all;
%%% 1. Sıvının özellikleri 
%Farklı sıvıların yoğunluğu P.rho birimi g/cm^3
P.rho = 1;  

P.dP = .25;  
P.dT = 10; 
P.hT = 18; 
P.g = 9.8;       
P.dP = 6*P.dP;  
P.dT = 2.54*P.dT;   
P.hT = 2.54*P.hT;   
P.g = P.g*100;      
P.Cf_tanks = (pi*(P.dP/2)^2)*(P.rho^1.5)*sqrt(2*P.g);
P.C_HM = P.rho*(pi*(P.dT/2)^2);  
P.C_CM = (pi*(P.dP/2)^2)*P.rho;  
P.C1 = P.C_CM/P.C_HM;
P.C2 = P.Cf_tanks/P.C_HM;
P.v1_max = 500;       
P.v2_max = P.v1_max;  

%%% 2. sıvının özellikleri 
%Farklı sıvıların yoğunluğu P.rho birimi g/cm^3
P1.rho = 1.3; 

P1.dP = .25;     
P1.dT = 10;      
P1.hT = 18;       
P1.g = 9.8;          
P1.dP = 6*P1.dP;  
P1.dT = 2.54*P1.dT;  
P1.hT = 2.54*P1.hT;  
P1.g = P1.g*100;      
P1.Cf_tanks = (pi*(P1.dP/2)^2)*(P1.rho^1.5)*sqrt(2*P1.g);
P1.C_HM = P1.rho*(pi*(P1.dT/2)^2);  
P1.C_CM = (pi*(P1.dP/2)^2)*P1.rho;  
P1.C1 = P1.C_CM/P1.C_HM;
P1.C2 = P1.Cf_tanks/P1.C_HM;
P1.v1_max = 500;       
P1.v2_max = P1.v1_max;  

%%% 2. sıvının özellikleri 
%Farklı sıvıların yoğunluğu P.rho birimi g/cm^3
P2.rho = 1.8;

P2.dP = .25;      
P2.dT = 10;      
P2.hT = 18;     
P2.g = 9.8;    
P2.dP = 6*P2.dP;   
P2.dT = 2.54*P2.dT;   
P2.hT = 2.54*P2.hT; 
P2.g = P2.g*100;     
P2.Cf_tanks = (pi*(P2.dP/2)^2)*(P2.rho^1.5)*sqrt(2*P2.g);
P2.C_HM = P2.rho*(pi*(P2.dT/2)^2);  
P2.C_CM = (pi*(P2.dP/2)^2)*P2.rho;  
P2.C1 = P2.C_CM/P2.C_HM;
P2.C2 = P2.Cf_tanks/P2.C_HM;
P2.v1_max = 500;       
P2.v2_max = P2.v1_max;   
