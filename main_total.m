  clear all; 
  clc; 
  addpath(genpath(pwd));
%% BUILD FINGERPRINT TEMPLATE DATABASE
% build_db(9,8);        %THIS WILL TAKE ABOUT 30 MINUTES
load('db.mat');

%% EXTRACT FEATURES FROM AN ARBITRARY FINGERPRINT
filename='C:\\Users\\user\\Documents\\MATLAB\\Simple_FingerPrint_Matching\\ks1.tif';
ks=imread(filename);
imshow(ks);
filename_1=imresize(ks,[374 388]);

img = filename_1;
if ndims(img) == 3; img = rgb2gray(img); end  % Color Images
disp(['Extracting features from ' filename ' ...']);
ffnew=ext_finger(img,1);

%% FOR EACH FINGERPRINT TEMPLATE, CALCULATE MATCHING SCORE IN COMPARISION WITH FIRST ONE
S=zeros(72,1);

for i=1:72
    second=['10' num2str(fix((i-1)/8)) '_' num2str(mod(i-1,8)+1)];
    fprintf(['Computing similarity between ' filename ' and ' second ' from FVC2002 : ']);
    S(i)=match(ffnew,ff{i});
    fprintf([num2str(S(i)) '\n']);
    drawnow
end
%% OFFER MATCHED FINGERPRINTS
Matched_FigerPrints=find(S>0.48)
match=Matched_FigerPrints;
a=size(match);
for i=1:1:a
    t=match(i);
    if t>=1&&t<=8
        disp('It is person#1 with ID:1');
    elseif t>=9&&t<=16
        disp('It is person#2 with ID:2');    
    elseif t>=17&&t<=24
        disp('It is person#3 with ID:3');
    elseif t>=25&&t<=32
        disp('It is person#4 with ID:4');
    elseif t>=33&&t<=40
        disp('It is person#5 with ID:5');
    elseif t>=41&&t<=48
        disp('It is person#6 with ID:6');
    elseif t>=49&&t<=56
        disp('It is person#7 with ID:7');
    elseif t>=57&&t<=64
        disp('It is person#8 with ID:8');
        elseif t>=65&&t<=72
        disp('It is person#8 with ID:8');
            end
    
end
