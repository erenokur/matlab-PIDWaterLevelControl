
function PlotTanks(u)

%Tank 1 için çizim fonksiyondan gelen 
%u içerisinde zaman ve yükseklikler var

persistent ULx ULy LLx LLy

h2_sp = u(1);
h1 = u(2);
h2 = u(3);
t = u(4);

persistent ULPatch;
persistent LLPatch;
persistent LLPatch_sp;

PW = 25;    
bS = 1000;  
vH = 100;   
vW = 60;     
tW = 500;    
tH = 700;    
D = 40;     

LeftPiping = [-bS, -bS; -bS, -vH/2; -bS+PW, -vH/2; -bS+PW,-bS];
LeftPipingSide = [-bS+PW/2+vH/2, 0; -bS/2, 0; -bS/2, -3*PW; -bS/2-PW, -3*PW; -bS/2-PW, -PW; -bS+PW/2+vH/2, -PW];
gamma = (vW - PW)/2;  

LeftValve = [ -bS-gamma , 0-vH/2; -bS+PW+gamma, 0-vH/2; -bS+PW/2,0; ...
    -bS-gamma ,0+vH/2; -bS+PW+gamma, 0+vH/2; -bS+PW/2,0; -bS+PW/2+vH/2, vW/2; ...
    -bS+PW/2+vH/2, -vW/2; -bS+PW/2,0;-bS-gamma , 0-vH/2];

LeftPiping2 = [ -bS, vH/2 ; ...
    -bS, bS-(.1*bS); ...
    -bS/2+PW, bS-(.1*bS); ...
    -bS/2+PW, bS-(.1*bS)-3*PW; ...
    -bS/2, bS-(.1*bS)-3*PW; ...
    -bS/2, bS-(.1*bS)-PW; ...
    -bS+PW, bS-(.1*bS)-PW; ...
    -bS+PW, vH/2];

LeftUpperTank = [-bS/2-PW-tW/2 ,bS-(.1*bS)-3*PW-D; -bS/2-PW+tW/2 , bS-(.1*bS)-3*PW-D; ...
    -bS/2-PW+tW/2 , bS-(.1*bS)-3*PW-D-tH;-bS/2-PW-tW/2 , bS-(.1*bS)-3*PW-D-tH;-bS/2-PW-tW/2 ,bS-(.1*bS)-3*PW-D];

Beta = max(LeftUpperTank(:,2));
Const = Beta - (-3*PW - D);

LeftLowerTank = LeftUpperTank;
LeftLowerTank(:,2) = LeftLowerTank(:,2) - Const;

LeftConnector = [  -bS/2+3*PW , bS-(.1*bS)-3*PW-2*D-tH; -bS/2+3*PW+PW , bS-(.1*bS)-3*PW-2*D-tH;...
    -bS/2+3*PW+PW,bS-(.1*bS)-3*PW-Const; -bS/2+3*PW, bS-(.1*bS)-3*PW-Const; -bS/2+3*PW , bS-(.1*bS)-3*PW-2*D-tH];

Space = 2;

xUL = [-bS/2-PW-tW/2+Space, -bS/2-PW+tW/2-Space];
xLL = xUL;
xUR = -xUL;
xLR = xUR;

xLL_sp = [-bS/2-PW-tW/2-50, -bS/2-PW-tW/2-Space];

yUL = [bS-(.1*bS)-3*PW-D-tH+Space+h1*(tH-2*Space),bS-(.1*bS)-3*PW-D-tH+Space];
yLL = [bS-(.1*bS)-3*PW-D-tH+Space+h2*(tH-2*Space),bS-(.1*bS)-3*PW-D-tH+Space];
yLL = yLL - Const;

yLL_sp = [bS-(.1*bS)-3*PW-D-tH+Space+h2_sp*(tH-2*Space),bS-(.1*bS)-3*PW-D-tH+Space];
yLL_sp = yLL_sp - Const;

xPolyUL = [xUL(1),xUL(2),xUL(2),xUL(1)];
yPolyUL = [yUL(1),yUL(1),yUL(2),yUL(2)];

xPolyLL = [xLL(1),xLL(2),xLL(2),xLL(1)];
yPolyLL = [yLL(1),yLL(1),yLL(2),yLL(2)];

xPolyLL_sp = [xLL_sp(1),xLL_sp(2),xLL_sp(2),xLL_sp(1)];
yPolyLL_sp = [yLL_sp(1),yLL_sp(1),yLL_sp(2),yLL_sp(2)];

z = [1,1,1,1];

if t == 0
        
    figure(1),clf
    
    hold on
    plot(LeftPiping(:,1),LeftPiping(:,2),'k',LeftPipingSide(:,1),LeftPipingSide(:,2),'k');
    lValvePlot = plot(LeftValve(:,1),LeftValve(:,2),'g');
    plot(LeftPiping2(:,1),LeftPiping2(:,2),'k');   
    plot(LeftUpperTank(:,1),LeftUpperTank(:,2),'k');
    plot(LeftLowerTank(:,1),LeftLowerTank(:,2),'k');
    plot(LeftConnector(:,1),LeftConnector(:,2),'k');
    
    ULPatch = fill(xPolyUL,yPolyUL,'c','EraseMode', 'Normal');
    LLPatch = fill(xPolyLL,yPolyLL,'c','EraseMode', 'Normal');
    LLPatch_sp = fill(xPolyLL_sp,yPolyLL_sp,'r','EraseMode', 'Normal');
    
    ULy = (bS-(.1*bS)-3*PW-3*D)/1.5;
    ULx = -bS;
    LLy = ULy - Const;
        
    ULx = ULx/1.6;
    LLx = ULx;
    
    text(ULx,ULy,'Tank 1');
    text(LLx,LLy,'Tank 2');
 
    text(-bS-130,0,'\gamma 1');

    axis([-1200,500,-1000,1000])
else
    ULPatch = updatePlot(yPolyUL,ULPatch);
    LLPatch = updatePlot(yPolyLL,LLPatch);    
    LLPatch_sp = updatePlot(yPolyLL_sp,LLPatch_sp);    
end

end


function handle =  updatePlot(y,handle)
set(handle,'Ydata',y);
drawnow
end

