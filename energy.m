function [Ytry] = energyclr()
%original image analysis
clc
clear all
close 
I1=imread('C:\Program Files\MATLAB\R2016b\toolbox\images\imdata\cameraman.tif');
% imshow(I); 
I=im2double(I1);
z=[];
for i=1:2:256%for dividing image into k*k sections
    for j=1:2:256
        s=I(i:i+1,j:j+1);
        s=reshape(s,[2*2 1]);
        z=[z,s];
    end
   
end
Z=im2double(z);
B=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
Ytry=B*Z;