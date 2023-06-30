function SendEmbededData(u)

% Haberleşme sınıfı 1 tank sonuçlarını gömülü sisteme gönderir
port = serialport('COM1',9600);
writeline(port,string(u(1)));
clear port
end