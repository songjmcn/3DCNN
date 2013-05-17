function cfm= convolutional(fm,ck,cb,ct)
%卷基层运算
%fm 输入的特征图（4D）
%ck 卷积核（4D）
%cb 偏置（1D）
kNum=size(ck,4);
kZ=size(ck,3);
kY=size(ck,2);
kX=size(ck,1);
fX=size(fm,1);
fY=size(fm,2);
fZ=size(fm,3);
X=fX-kX+1;
Y=fY-kY+1;
Z=fZ-kZ+1;
bNum=length(cb);
cfm=zeros(X,Y,Z,bNum);
for ii=1:kNum
     fm_index=ct(ii,1);
     this_fm=fm(:,:,:,fm_index);
     this_k=ck(:,:,:,ii);
     this_conv=conv3(this_fm,this_k,'valid');
     cfm_index=ct(ii,2);
     cfm(:,:,:,cfm_index)=this_conv+cb(ii);
end
cfm=sigmoid(cfm);
end

