[muc1,Fs1]=wavread('Ô­Éù.wav');
[muc2,Fs2]=wavread('Close To You.wav');
muc1=muc1(:,1);
muc2=muc2(:,1);
muc2=muc2(1:size(muc1));
muc3=muc1+muc2;
sound(muc3,Fs1)