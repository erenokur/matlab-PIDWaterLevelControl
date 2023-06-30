function SendEmbededData3(u)

% Haberleşme sınıfı 3 tank sonuçlarını gömülü sisteme gönderir
port = serialport('COM3',9600);
writeline(port,string(u(1)));
clear port
end