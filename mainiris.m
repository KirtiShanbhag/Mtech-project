clc
clear all
close all
p='ks2.tif';
filename='ks2.tif';
ks=imread(filename);
imshow(ks);
img = filename;
if ndims(img) == 3; 
    img = rgb2gray(img); 
end
%% 
c=zeros(size(ks));
[a,b,c]=segmentiris(ks);
xci1=a(1);
yci1=a(2);
rci1=a(3);
xcp1=b(1);
ycp1=b(2);
rcp1=b(3);
ki1=[ ];
va1=[ ];
[k1,va1]=normaliseiris(ks,xci1,yci1,rci1,xcp1,ycp1,rcp1,p,160,160);
ki1=[ ];
kma1=[ ];
[ki1,kma1]=encode(k1,va1,2,11,2,0.5);
s=[ ];
s=matchiris(ki1,kma1);
Matched_iris=find(s<0.43);
matchedsize=numel(Matched_iris);
for i=1:matchedsize
    t=Matched_iris(i);
    if t>=1&&t<=10
        disp('It is person#1');
    elseif t>=11&&t<=20
        disp('It is person#2');    
    elseif t>=21&&t<=30
        disp('It is person#3');
    elseif t>=31&&t<=40
        disp('It is person#4');
    elseif t>=41&&t<=50
        disp('It is person#5');
    elseif t>=51&&t<=60
        disp('It is person#6');
    elseif t>=61&&t<=70
        disp('It is person#7');
    elseif t>=71&&t<=80
        disp('It is person#8');
        elseif t>=81&&t<=90
        disp('It is person#9');
        elseif t>=91&&t<=100
        disp('It is person#10');
    end
    
end
