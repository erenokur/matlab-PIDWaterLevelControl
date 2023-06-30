function [output] =  AnalogToDigital(u)

% Anolog olan verileri set pointe göre modüle ederek Gömülü sisteme 
%sadece 0 ve 1 değeri gönderir

result = 0;
if u(2) - u(1) > -0.0025 && u(2) - u(1) < 0.0025
    result = 1;
else
    result = 0;
end    
output = result;

end
  
