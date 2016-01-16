function [newAper NewShutter] = suggestion_cluster1(blur_content,image,contra)

StanValAper=[5 6.3 8 10 13 16 20]
NewAper = 3;




%intensity 230   5 6.3 8 10 13 16 20
p1=[0.000000005011 0.0000003381 0.0000000273 -0.000002088 -0.00006394 0.0004518 0.0002719];
p2=[0.000001955 -0.0000332 -0.000005116 0.0001529 0.003657 -0.0221 -0.01317];
p3=[0.000001955 0.001193 0.0005474 -0.00303 -0.06733 0.3593 0.2129];
p4=[-0.001221 -0.01229 -0.007489 0.01866 0.4026 -1.94 -1.146];

% n=1
% if n==1
%     i=3;
%     y = (p1(i)*(x^3)) + (p2(i)*(x^2)) + (p3(i)*(x)) + (p4(i))
% end
%NewShutter = XXX(blur_content,p1,p2,p3,p4)

ChkFunctBlur=10;
blurvalue = (100*blur_content);
x = blurvalue-ChkFunctBlur;


i=3;
NewShutter = (p1(i)*(x^3)) + (p2(i)*(x^2)) + (p3(i)*(x)) + (p4(i))
Shutter_final = quantize_shutter(NewShutter);
NewShutter = Shutter_final ;

%export this shutter speed
snappic(NewAper, NewShutter, 'E:\MT DNL\major project\Database V_2\Intensity=190\F=8\S0.0010_f8.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I= imread('E:\MT DNL\major project\Database V_2\Intensity=190\F=8\S0.0010_f8.jpg');
im = imresize(I,[1440 1800]);
%n = find_cluster(im)
%blur_content = 0.483774528638935;
%im = rgb2gray(image);
contra=contrast(im)

Entropy=entropy(im)

img=rgbnormalise(im);        
% imshow(img);
% blur_content1= blurr(image)
% blur_content2= blurr(img)

if (contra < 0.30)
    blur_content=blurr(im)
else
    blur_content=blurr(img)
end

blurvalue = (100*blur_content);
x = blurvalue-ChkFunctBlur;


j=3;
while(NewAper<=5)
if contra >= 0.75
    disp('Need to change aperture, the image with high shutter speed is dark.')
    NewAper = StanValAper(j-1)
else
    
i=3;
NewShutter = (p1(i)*(x^3)) + (p2(i)*(x^2)) + (p3(i)*(x)) + (p4(i))
break;
end


j=j-1;

end
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Shutter_final = quantize_shutter(NewShutter);
NewShutter = Shutter_final ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %export this shutter speed
snappic(NewAper, NewShutter, 'E:\MT DNL\major project\Database V_2\Intensity=230\F=8\S0.0020_f8.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


I= imread('E:\MT DNL\major project\Database V_2\Intensity=230\F=8\S0.0020_f8.jpg');
im = imresize(I,[1440 1800]);
%n = find_cluster(im)
%blur_content = 0.483774528638935;
%im = rgb2gray(image);
contra=contrast(im)

Entropy=entropy(im)

img=rgbnormalise(im);        
% imshow(img);
% blur_content1= blurr(image)
% blur_content2= blurr(img)

if (contra < 0.30)
    blur_content=blurr(im)
else
    blur_content=blurr(img)
end

blurvalue = (100*blur_content);
ChkFunctBlur=1;
x = blurvalue-ChkFunctBlur;



j=3;
while(NewAper<=5)
if contra >= 0.75
    disp('Need to change aperture, the image with high shutter speed is dark.')
    NewAper = StanValAper(j-1)
else
    
i=3;
NewShutter = (p1(i)*(x^3)) + (p2(i)*(x^2)) + (p3(i)*(x)) + (p4(i))
break;
end

j=j-1;
end
   



newAper=(NewAper);




