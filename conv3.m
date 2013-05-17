function [result]=conv3(in,k,mode)
%对in进行3维卷积
%in 三维矩阵
%k 三维卷积核
%mode 卷积模式
if nargin==2
    mode='full';
end
%这里先把卷积核翻转（由于matlab里是从卷积最后一个元素开始算起）
%先把每一个二维卷积翻转180度，然后再颠倒卷积图的位置
nk=size(k,3);
kernel=zeros(size(k));
for ii=0:nk-1
    kernel(:,:,ii+1)=k(:,:,nk-ii);
end
result=convn(in,kernel,mode);
end