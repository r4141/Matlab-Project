clc
clear all
close all
r=zeros(100,100);
g=zeros(100,100);
b=zeros(100,100);
mhx=zeros(1,520);
mhy=zeros(1,520);
for i=1:100
    mhx(i)=1;
    mhy(i)=i;
    mhx(100+i)=i;
    mhy(100+i)=100;
    mhx(200+i)=100;
    mhy(200+i)=i;
    mhx(300+i)=i;
    mhy(300+i)=1;
end
for i=1:60
    mhx(400+i)=21;
    mhy(400+i)=20+i;
    mhx(460+i)=80;
    mhy(460+i)=20+i;
end
   
    for i=1:100
        r(mhx(i),mhy(i))=0;
        g(mhx(i),mhy(i))=0;
        b(mhx(i),mhy(i))=255;
    end
    for i=101:200
        r(mhx(i),mhy(i))=0;
        g(mhx(i),mhy(i))=0;
        b(mhx(i),mhy(i))=255;
    end
    for i=201:300
        r(mhx(i),mhy(i))=0;
        g(mhx(i),mhy(i))=0;
        b(mhx(i),mhy(i))=255;
    end
    for i=301:400
        r(mhx(i),mhy(i))=0;
        g(mhx(i),mhy(i))=0;
        b(mhx(i),mhy(i))=255;
    end
    for i=401:460
        r(mhx(i),mhy(i))=0;
        g(mhx(i),mhy(i))=0;
        b(mhx(i),mhy(i))=255;
    end
    for i=461:520
        r(mhx(i),mhy(i))=0;
        g(mhx(i),mhy(i))=0;
        b(mhx(i),mhy(i))=255;
    end
    

im=cat(3,r,g,b);
subimage(uint8(im));