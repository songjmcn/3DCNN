function [ dfm,dsk,dsb ] = bpsubsampling( dsfm,sfm,fm, sk,sb,sw,ss)
%对重采样层进行反向传播
%dsfm 重采样层输出的偏导数
%sfm 重采样层的输出
%in 输入
%sk 采样窗口权值
%sb 偏置
%sw 窗口大小
%ss 步长
[X,Y,Z,dims]=size(fm);
dsfm=dsfm.*dsigmoid(sfm);
dfm=zeros(size(fm));
dsk=zeros(size(sk));
dsb=zeros(size(sb));
dsfm=dsfm.*dsigmoid(in);
kernel=ones(sw,sw);
for ii=1:dims
    this_dsfm=dsfm(:,:,:,ii);
    this_kernel=kernel*sk(ii);
    dsb(ii)=sum(this_dsfm(:));
    kx=X-sw+1;
    ky=Y-sw+1;
    dsfm_bfSubsampling=zeros(kx,ky);
    dsfm_bfSubsampling(1:ss:end,1:ss:end)=this_kernel;
    dsfm(:,:,:,ii)=dconv3_in(dsfm_bfSubsampling,fm(:,:,:,ii),this_kernel,'valid');
    dthis_kernel=donv3_in(dsfm_bfSubsampling,fm(:,:,:,ii),this_kernel,'valid');
    dsk(ii)=sum(dthis_kernel(:));
end
end

