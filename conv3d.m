function [ result ] = conv3d( in,k,mode)
%计算3D卷积
% in 输入参数，k 卷积核，mode模式（valid，full）
   if nargin==2
       mode='full';
   end
   kernel = zeros(size(k));
   k_z = size(k,3);
   k_y = size(k,2);
   k_x = size(k,1);
   in_z = size(in,3);
   in_y = size(in,2);
   in_x = size(in,1);
   for ii =1:k_z
       kernel(:,:,ii)=rot90(k(:,:,ii),2);
   end
   switch mode
       case 'full'
           %full mode 先使用0填充边界像素（需要把矩阵拉伸）
           r_z=in_z+floor((k_z-1)*2);
           r_y=in_y+floor((k_y-1)*2);
           r_x=in_x+floor((k_x-1)*2);
           tmp=zeros(r_x,r_y,r_z);
           z_start=k_z;
           y_start=k_y;
           x_start=k_x;
           tmp(x_start:x_start+in_x-1,y_start:y_start+in_y-1,z_start:z_start+in_z-1)=in(:,:,:);
           result=conv3d_(tmp,kernel);
       case 'valid'
           result=conv3d_(in,kernel);
   end
end
function [result]=conv3d_(in,k)
%计算3D卷积的内部函数
%in 输入的3D矩阵 
%k卷积核 3D
   in_z=size(in,3);
   in_y=size(in,2);
   in_x=size(in,1);
   k_z=size(k,3);
   k_y=size(k,2);
   k_x=size(k,1);
   r_z=in_z-k_z+1;
   r_y=in_y-k_y+1;
   r_x=in_x-k_x+1;
   result=zeros(r_x,r_y,r_z);
   loop_conv=k_z;
   for dim=1:r_z
       tmp=zeros(r_x,r_y);
       for ic=1:loop_conv
          kernel=k(:,:,ic);
          tmp(:,:)=tmp(:,:)+conv2(in(:,:,dim+ic-1),kernel,'valid');
       end
       result(:,:,dim)=tmp;
   end
end
function [result]=conv3(in,k,mode)
if nargin==2
    mode='full';
end
nk=size(k,3);
kernel=zeros(size(k));
for ii=0:nk-1
    kernel(:,:,ii+1)=k(:,:,nk-ii);
end
result=convn(in,kernel,mode);
end
