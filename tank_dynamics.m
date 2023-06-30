function [sys,x0,str,ts,simStateCompliance] = tank_dynamics(t,x,u,flag,P)
switch flag,
    case 0,
        [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes(P);
    case 1,
        sys=mdlDerivatives(t,x,u,P);
    case 2,
        sys=mdlUpdate(t,x,u);
    case 3,
        sys=mdlOutputs(t,x,u,P);
    case 4,
        sys=mdlGetTimeOfNextVarHit(t,x,u);
    case 9,
        sys=mdlTerminate(t,x,u);
    otherwise
        DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));      
end

function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes(P)
sizes = simsizes;
sizes.NumContStates  = 2;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;  

sys = simsizes(sizes);
x0  = [0; 0];
str = [];
ts  = [0 0];
simStateCompliance = 'UnknownSimState';

function sys=mdlOutputs(t,x,u,P)
h1        = x(1);
h2        = x(2);
sys = [h1;h2];

function sys=mdlDerivatives(t,x,u,P)
h1        = x(1);
h2        = x(2);
gamma     = u(1);
beta      = u(2);

v1 = P.v1_max*beta;

if h1 < 0,
    h1 = 0;
end
if h2 < 0,
    h2 = 0;
end

h1_dot = (1-gamma) * P.C1*v1 - P.C2*sqrt(h1);
h2_dot = gamma * P.C1*v1 + P.C2*(sqrt(h1)-sqrt(h2));

if h1>=P.hT && h1_dot>=0
    h1_dot = 0;    
end
if h2>=P.hT && h2_dot>=0
    h2_dot = 0;
end

sys = [h1_dot; h2_dot];

function sys=mdlGetTimeOfNextVarHit(t,x,u)
sampleTime = 1;    
sys = t + sampleTime;

function sys=mdlTerminate(t,x,u)
sys = [];
function sys=mdlUpdate(t,x,u)
sys = [];

