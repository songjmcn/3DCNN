function [struction] = structOfConvnet(image_shape)
%init convet3d parameters
if nargin==0
    image_shape=[60 40 7];
end
struction.inX=image_shape(1);
struction.inY=image_shape(2);
struction.inZ=image_shape(3);
%卷积第一阶段
%卷积核的XYZ
struction.convnetOne.kX=7;
struction.convnetOne.kY=7;
struction.convnetOne.kZ=3;
struction.convnetOne.kNum=2;  %卷积核的个数（我们这里使用全连接）
struction.convnetOne.ct=[ 1 1
                          1 2];
%重采样的窗口长度和步长
struction.convnetOne.sw=2;
struction.convnetOne.ss=2;
%卷积第二阶段
%卷积核
struction.convnetTwo.kX=7;
struction.convnetTwo.kY=6;
struction.convnetTwo.kZ=3;
struction.convnetTwo.kNum=6;
struction.convnetTwo.ct=[ 1 1
                          2 2
                          1 3
                          2 4
                          1 5
                          2 6];
%重采样
struction.convnetTwo.sw=3;
struction.convnetTwo.ss=3;
%分类器层
struction.classifier.One=128;
struction.classifier.Two=10;


end

