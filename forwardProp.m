function [ fmaps ] = forwardProp( convnet,fm)
%前向传播阶段
%convent, 3D CNN 
%fm  输出的图像序列
fmaps.in=fm;
ck=convnet.stageOne.ck;
cb=convnet.stageOne.cb;
ct=convnet.stageOne.ct;
cfm=convolutional(fm,ck,cb,ct);
fmaps.cfm1=cfm;
sk=convnet.stageOne.sk;
sb=convnet.stageOne.sb;
sw=convnet.stageOne.sw;
ss=convnet.stageOne.ss;
sfm=subsampling(cfm,sk,sb,sw,ss);
fmaps.sfm1=sfm;
ck=convnet.stageTwo.ck;
cb=convnet.stageTwo.cb;
ct=convnet.stageTwo.ct;
cfm=convolutional(sfm,ck,cb,ct);
fmaps.cfm2=cfm;
sk=convnet.stageTwo.sk;
sb=convnet.stageTwo.sb;
sw=convnet.stageTwo.sw;
ss=convnet.stageTwo.ss;
sfm=subsampling(cfm,sk,sb,sw,ss);
fmaps.sfm2=sfm;
k1=convnet.classifier.k1;
b1=convnet.classifier.b1;
k2=convnet.classifier.k2;
b2=convnet.classifier.b2;
[fm1,fm2]=classifier(sfm,k1,b1,k2,b2);
fmaps.fm1=fm1;
fmaps.fm2=fm2;
end

