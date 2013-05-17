function [ convnet ] =buildConvnet3d( struction )
%创建3D卷积神经网络
%第一阶段
%C neuro
inX=struction.inX;
inY=struction.inY;
inZ=struction.inZ;
kX=struction.convnetOne.kX;
kY=struction.convnetOne.kY;
kZ=struction.convnetOne.kZ;
kNum1=struction.convnetOne.kNum;
fanin=kNum1*kX*kY*kZ;
ct=struction.convnetOne.ct;
sd=1/sqrt(fanin);
convnet.stageOne.ck=-1*sd+2*sd*rand(kX,kY,kZ,kNum1);
convnet.stageOne.cb=zeros(kNum1,1);
convnet.stageOne.ct=ct;
%C型特征图的尺寸
cfmX=inX-kX+1;
cfmY=inY-kY+1;
cfmZ=inZ-kZ+1;
%S neuro
sw=struction.convnetOne.sw;
ss=struction.convnetOne.ss;
sfmX=floor((cfmX-sw)/ss)+1;
sfmY=floor((cfmY-sw)/ss)+1;
sfmZ=cfmZ;
fanin=sw*ss;
sd=1/sqrt(fanin);
convnet.stageOne.sk=-1*sd+2*sd*rand(kNum1,1);
convnet.stageOne.sb=zeros(kNum1,1);
convnet.stageOne.sw=sw;
convnet.stageOne.ss=ss;
%第二阶段
%C neuro
kX=struction.convnetTwo.kX;
kY=struction.convnetTwo.kY;
kZ=struction.convnetTwo.kZ;
kNum2=struction.convnetTwo.kNum;
fanin=kX*kY*kZ*kNum2;
sd=1/sqrt(fanin);
convnet.stageTwo.ck=-1*sd+2*sd*rand(kX,kY,kZ,kNum2);
convnet.stageTwo.cb=zeros(kNum2,1);
convnet.stageTwo.ct=struction.convnetTwo.ct;
cfmX=sfmX-kX+1;
cfmY=sfmY-kY+1;
cfmZ=sfmZ-kZ+1;
%S neuro
sw= struction.convnetTwo.sw;
ss=struction.convnetTwo.ss;
fanin=sw*sw;
sd=1/sqrt(fanin);
sNum=kNum2;
convnet.stageTwo.sk=-1*sd+2*sd*rand(sNum,1);
convnet.stageTwo.sb=zeros(sNum,1);
convnet.stageTwo.sw=sw;
convnet.stageTwo.ss=ss;
sfmX=floor((cfmX-sw)/ss)+1;
sfmY=floor((cfmY-sw)/ss)+1;
sfmZ=cfmZ;
%分类器
num1=struction.classifier.One;
fanin=sfmX*sfmY*sfmZ*sNum*num1;
sd=1/sqrt(fanin);
convnet.classifier.k1=-1*sd+2*sd*rand(sfmX,sfmY,sfmZ,sNum,num1);
convnet.classifier.b1=zeros(1,num1);
num2=struction.classifier.Two;
fanin=num1*num2;
sd=1/sqrt(fanin);
convnet.classifier.k2=-1*sd+2*sd*rand(num1,num2);
convnet.classifier.b2=zeros(1,num2);
end

