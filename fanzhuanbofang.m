
Num = 65536;
[muc,Fs]=wavread('C:/Users/yrlove2020/Desktop/���ܵ���/3/�໨��.wav', Num);
Ydata = muc;                         % ��¼����
Fdata = Fs;                        % ��¼������
yy = fft(Ydata,Num);         % ��������Num��FFT����
Yfft = 20*log10(abs(yy));    % �Լ�����ȡģ
figure;
ff = linspace(0,Fdata,Num);    % ��0-������֮��ȡNum��Ƶ�ʵ�
plot(ff,Yfft,'r');           % ����Ƶ��
grid on;
axis([400 3000 -50 70])