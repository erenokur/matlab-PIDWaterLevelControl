function SendEmbededData2(u)

% Haberleşme sınıfı 2 tank sonuçlarını gömülü sisteme gönderir
port = serialport('COM2',9600);
writeline(port,string(u(1)));
clear port
end