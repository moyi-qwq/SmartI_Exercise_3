# 课堂练习3

课堂练习

利用快速傅里叶变换进行多项式乘法，绘制谱图:

原生.wav的谱图：
 
青花瓷.wav（源自网络）的谱图：

由于无法上传大文件 青花瓷mp3链接如下

https://zhidao.baidu.com/question/364539975534867172.html

请自行下载转换为wav
 
程序代码如下:
1.	Num = 65536;  
2.	[muc,Fs]=wavread('C:/Users/yrlove2020/Desktop/智能电子/3/原声.wav', Num);  
3.	Ydata = muc;                         % 记录数据  
4.	Fdata = Fs;                        % 记录采样率  
5.	yy = fft(Ydata,Num);         % 对数据做Num点FFT运算  
6.	Yfft = 20*log10(abs(yy));    % 对计算结果取模  
7.	figure;  
8.	ff = linspace(0,Fdata,Num);    % 在0-采样率之间取Num个频率点  
9.	plot(ff,Yfft,'r');           % 绘制频谱  
10.	grid on;  
11.	axis([400 3000 -20 70])  
c++版本的FFT（快速傅里叶变换）代码如下：
1.	#include <cmath>  
2.	#include <complex>  
3.	  
4.	typedef std::complex<double> Comp;  // STL complex  
5.	  
6.	const Comp I(0, 1);  // i  
7.	const int MAX_N = 1 << 20;  
8.	  
9.	Comp tmp[MAX_N];  
10.	  
11.	void DFT(Comp *f, int n, int rev) {  // rev=1,DFT; rev=-1,IDFT  
12.	  if (n == 1) return;  
13.	  for (int i = 0; i < n; ++i) tmp[i] = f[i];  
14.	  for (int i = 0; i < n; ++i) {  // 偶数放左边，奇数放右边  
15.	    if (i & 1)  
16.	      f[n / 2 + i / 2] = tmp[i];  
17.	    else  
18.	      f[i / 2] = tmp[i];  
19.	  }  
20.	  Comp *g = f, *h = f + n / 2;  
21.	  DFT(g, n / 2, rev), DFT(h, n / 2, rev);  // 递归 DFT  
22.	  Comp cur(1, 0), step(cos(2 * M_PI / n), sin(2 * M_PI * rev / n));  
23.	  // Comp step=exp(I*(2*M_PI/n*rev)); // 两个 step 定义是等价的  
24.	  for (int k = 0; k < n / 2; ++k) {  
25.	    tmp[k] = g[k] + cur * h[k];  
26.	    tmp[k + n / 2] = g[k] - cur * h[k];  
27.	    cur *= step;  
28.	  }  
29.	  for (int i = 0; i < n; ++i) f[i] = tmp[i];  
30.	}  
将音频可视化，可以让人更加直观的认识到声音，利于人对音频进行加工，修改，创作等等
