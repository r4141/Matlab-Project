clc
clear all
close all

r=zeros(100,100);
g=zeros(100,100);
b=zeros(100,100);
mmx=zeros(1,400);
mmy=zeros(1,400);
for i=1:100
    mmx(i)=1;
    mmy(i)=i;
    mmx(100+i)=i;
    mmy(100+i)=100;
    mmx(200+i)=100;
    mmy(200+i)=i;
    mmx(300+i)=i;
    mmy(300+i)=1;
end
   
    for i=1:100
        r(mmx(i),mmy(i))=0;
        g(mmx(i),mmy(i))=0;
        b(mmx(i),mmy(i))=255;
    end
    for i=101:200
        r(mmx(i),mmy(i))=0;
        g(mmx(i),mmy(i))=0;
        b(mmx(i),mmy(i))=255;
    end
    for i=201:300
        r(mmx(i),mmy(i))=0;
        g(mmx(i),mmy(i))=0;
        b(mmx(i),mmy(i))=255;
    end
    for i=301:400
        r(mmx(i),mmy(i))=0;
        g(mmx(i),mmy(i))=0;
        b(mmx(i),mmy(i))=255;
    end
    

im=cat(3,r,g,b);
subimage(uint8(im));