clear; clc;
close all;

figure('Name','Original Bild','NumberTitle','off');
imcoin = imread('C:/00_Uni_Laptop/Programmieren/Industrielle_Bildverarbeitung/Praktikum_01/Images/coins.png');
imshow(imcoin);

%%
%Nr.1
[m,n] = size(imcoin);
amin = min(imcoin(:));
amax = max(imcoin(:));

Zeilenbildgroese=m;
Spaltenbildgroese=n;
Max_Grauwert = amax;
Min_Grauwert = amin;

clear("amin","amax");

%%
%Nr.2
figure('Name','Original Bild mit Linie','NumberTitle','off');
Grauwert_line_50= imcoin(50,:);
%h = images.roi.Line(gca,'Position',[0 50;300 50]);

%Plotten
subplot(1,2,1); imshow(imcoin);
h = images.roi.Line(gca,'Position',[0 50;300 50]);
subplot(1,2,2); plot(Grauwert_line_50);


%%
%Nr.3
for i=1:m
    for j=1:n
        imcoin_negativ(i,j) = 255-imcoin(i,j);
    end
end

%Plotten, 
figure('Name','Original und Nagativ Bild','NumberTitle','off');
%subplot(1,2,1); imshow(imcoin);
%subplot(1,2,2); imshow(imcoin_negativ);
imshowpair(imcoin, imcoin_negativ,'montage','scaling','none');

%%
%Nr.4
imwrite(imcoin,'coin.jpg');
imcoin_jpg=imread('coin.jpg');

%%
%Nr.5
figure('Name','Histogramm der Differenz PNG to JPG','NumberTitle','off');
Differenz=imcoin-imcoin_jpg; 
Min_Dif = min(Differenz(:));
Max_Dif = max(Differenz(:));

subplot(1,2,1); imshow(Differenz,[]);
subplot(1,2,2); imhist(Differenz);
