function [ convnet ] = backProp(convnet,fmaps,targetOut,eta)
%对网络做反向传播，调整参数
%convent 3D CNN
%fmaps 各层的输出
%targetOut 目标输出
%eta 学习率
k1=convnet.classifier.k1;
b1=convnet.classifier.b1;
k2=convnet.classifier.k2;
b2=convnet.classifier.b2;
fm1=fmaps.fm1;
fm2=fmaps.fm2;
dfm2=fm2-targetOut;
sfm2=fmaps.sfm2;
[dsfm,dk1,db1,dk2,db2]=bpclassifier(dfm2,sfm2,fm1,fm2,k1,b1,k2,b2);
convnet.classifier.k1=k1-eat*dk1;
convnet.classifier.b1=b1-eta*db1;
convnet.classifier.k2=k2-eta*dk2;
convnet.classifier.b2=b2-eta*db2;
sfm2=fmaps.smf2;
cfm2=fmaps.cfm2;
sk2=convnet.stageTwo.sk;
sb2=convnet.stageTwo.sb;
sw2=convnet.stageTwo.sw;
ss2=convent.stageTwo.ss;
[dcfm2,dsk2,dsb2]=bpsubsampling(dsfm,sfm2,cfm2,sk2,sb2,sw2,ss2);
convnet.stageTwo.sk=sk2-eta*dsk2;
convnet.stageTwo.sb=sb2-eta*dsb2;
cfm2=fmaps.cfm2;
sfm1=fmaps.sfm1;
ck2=convnet.stageTwo.ck;
cb2=convnet.stageTwo.cb;
ct2=convnet.stageTwo.ct;
[dsfm1,dck2,dcb2]=bpconvolutional(dcfm2,cfm2,sfm1,ck2,cb2,ct2);
convnet.stageTwo.ck=ck2-eta*dck2;
convnet.stageTwo.cb=ck2-eta*dcb2;
sfm1=fmaps.sfm1;
cfm1=fmaps.cfm1;
sk1=convnet.stageOne.sk;
sb1=convnet.stageOne.sb;
sw1=convnet.stageOne.sw;
ss1=convnet.stageOne.ss1;
[dcfm1,dsk1,dsb1]=bpsubsampling(dsfm1,sfm1,cfm1,sk1,sb1,sw1,ss1);
convnet.stageOne.sk=sk1-eta*dsk1;
convnet.stageOne.sb=sb1-eta*dsb1;
cfm1=fmaps.cfm1;
in=fmaps.in;
ck1=convnet.stageOne.ck;
cb1=convnet.stageOne.cb;
ct1=convnet.stageOne.ct;
[dfm,dck1,dcb1]=bpconvolutional(dcfm1,cfm1,in,ck1,cb1,ct1);
convnet.stageOne.ck=ck1-eta*dck1;
convnet.stageOne.cb=cb1-eta*dcb1;

end

