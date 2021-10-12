
Num = 65536;
[muc,Fs]=wavread('C:/Users/yrlove2020/Desktop/智能电子/3/青花瓷.wav', Num);
Ydata = muc;                         % 记录数据
Fdata = Fs;                        % 记录采样率
yy = fft(Ydata,Num);         % 对数据做Num点FFT运算
Yfft = 20*log10(abs(yy));    % 对计算结果取模
figure;
ff = linspace(0,Fdata,Num);    % 在0-采样率之间取Num个频率点
plot(ff,Yfft,'r');           % 绘制频谱
grid on;
axis([400 3000 -50 70])