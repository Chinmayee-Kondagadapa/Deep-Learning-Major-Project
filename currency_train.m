clc;
clear all;
addpath('support');
F=dir('TRAIN');
F=char(F.name);
sz=size(F,1)-2;
hh=waitbar(0,'Please wait system is training..');
for ii=1:sz
    st=F(ii+2,:);
    cd TRAIN
    I1=imread(st);
    cd ..
    I1=imresize(I1,[700 300]);
    if size(I1,3)>1
        I=rgb2gray(I1);
    end
    I1=imsharpen(I1);
    fv2=FEATURES(I1); 
    FV(ii,:)=fv2(:);
     if strcmp(st(1:3),'100')==1
         grp(ii)=1;
     end
      if strcmp(st(1:3),'500')==1
         grp(ii)=2;
      end
       if strcmp(st(1:3),'200')==1
         grp(ii)=3;
       end
       if strcmp(st(1:3),'fak')==1
         grp(ii)=4;
       end
        if strcmp(st(1:3),'fac')==1
         grp(ii)=5;
       end
     waitbar(ii/sz);
end
close(hh);
SS=cnnresnettrain(FV,grp);
save SS SS




    