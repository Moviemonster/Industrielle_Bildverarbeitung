function Kantenfilter(original_picture)

%Sobel-Filter
Hx=[-1  0  1;
    -2  0  2;
    -1  0  1];
Hy=[-1 -2 -1;
     0  0  0;
     1  2  1];
hSize=3;

%%
%Gradienten Approximaion umständlich mit Schleifen
        % Dx=Hx * original_picture;
        % Dy=Hy * original_picture;
% Randerweiterung
% [nbRows, nbCols] = size(original_picture);
% radiusH = (hSize-1)/2;
% imExt = zeros(nbRows+2*radiusH,nbCols+2*radiusH);
% imExt(1+radiusH:nbRows+radiusH, 1+radiusH:nbCols+radiusH) = original_picture;
% 
% Dx = zeros(nbRows, nbCols);
% Dy = zeros(nbRows, nbCols);
% for r = 1+radiusH:nbRows+radiusH
%     for c = 1+radiusH:nbCols+radiusH
%         sum_x = 0;
%         sum_y = 0;
%         for i = 1:hSize
%             for j = 1:hSize
%                 sum_x = sum_x + Hx(i,j)*imExt(r+i-radiusH-1,c+j-radiusH-1);
%                 sum_y = sum_y + Hy(i,j)*imExt(r+i-radiusH-1,c+j-radiusH-1);
%             end
%         end
%         Dx(r-radiusH, c-radiusH) = sum_x;
%         Dy(r-radiusH, c-radiusH) = sum_y;
%     end
% end

%Gradienten Betrag & Phase Fehler in der Schleife!!!
% for i = 1:nbRows
%     for j = 1:nbCols
%         E(i,j) = sqrt((Dx(i,j)^2)+(Dy(i, j)^2));
%         phi(i,j) = atan(-Dy(i,j)/Dx(i,j));
%     end
% end

Dx = imfilter(double(original_picture),Hx);
Dy = imfilter(double(original_picture),Hy);

E = sqrt(Dx.^2 + Dy.^2);
phi = atan2(-Dy,Dx);


%%
%Mit Matlabbefehlen
[Gx2,Gy2]=imgradientxy(original_picture);
[Gmag,Gdir] = imgradient(Gx2,Gy2);

%%
%Plotten Eigene Filteranwendung
figure('Name','Aufgabe 4: Bild-Gradient eigene Rechnung','NumberTitle','off');
subplot(3,2,[1,2]); 
imshow(original_picture);
title('Original Bild');
subplot(3,2,3);
imshow(Dx);
title("Directional Gradients Dx");
subplot(3,2,4);
imshow(Dy);
title("Directional Gradients Dy");
subplot(3,2,5);
imshow(phi);
title("Gradientenrichtung");
subplot(3,2,6);
imshow(E);
title("Gradientenstärke");

%%
%Plotten Filter Matlap
figure('Name','Aufgabe 4: Bild-Gradient Matlabbefehl','NumberTitle','off');
subplot(3,2,[1,2]); 
imshow(original_picture);
title('Original Bild');
subplot(3,2,3);
imshow(Gx2);
title("Directional Gradients Gx");
subplot(3,2,4);
imshow(Gy2);
title("Directional Gradients Gy");
subplot(3,2,5);
imshow(Gdir);
title("Gradientenrichtung");
subplot(3,2,6);
imshow(Gmag);
title("Gradientenstärke");
