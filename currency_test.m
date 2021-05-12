    clc;
clear all;
close all;
addpath('support');
cd TEST
[J  P]=uigetfile('*.*','select the test Image');
I1=imread(strcat(P,J));
cd ..
I1=imresize(I1,[700 300]);

if size(I1,3)>1
    I=rgb2gray(I1);
end

I1=imsharpen(I1);
fq2=FEATURES(I1);  

load SS

st{1}='100';st{2}='500';st{3}='2000';st{4}='FAKE CURRENCY';st{5}='FAKE CURRENCY';
rst1=cnnresnettest(fq2(:)',4,SS)

msgbox(['Currency is ', st{rst1}]);

NET.addAssembly('System.Speech');
speak = System.Speech.Synthesis.SpeechSynthesizer;
speak.Volume = 100;
speak.Speak(['Currency type is  ','   ', st{rst1}]);

 