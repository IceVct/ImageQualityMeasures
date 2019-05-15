clear all
close all
clc
 
imagemteste=imread('/home/vavieira/UnB/TCC/IrisDatabases/MICHE/SelectedSubjects/001_IP5_IN_F_RI_01_4.jpg');
 
%Separação das Componentes RGB
red = imagemteste(:,:,1);
green = imagemteste(:,:,2);
blue = imagemteste(:,:,3);
 
%Quantidade de linhas e colunas
linhas  = size(imagemteste, 1) ;
colunas = size(imagemteste, 2) ;
imagemauxiliar1 = zeros(linhas, colunas);

 
f1=zeros(linhas,colunas);
f2=zeros(linhas,colunas);
r=zeros(linhas,colunas);
 
%Variaveis para calcular o angulo, que nao aceita uint8
Red = double(red);
Green = double(green);
Blue = double(blue);
 
%Calcular o angulo(Hue)
Angulo = acos((0.5*((Red - Green) + (Red - Blue)))./sqrt((Red - Green).^2 + (Red - Blue).*(Green - Blue)));
Angulo = (360*Angulo)./(2*pi);
for i = 1:linhas
    for j = 1:colunas
        if(blue(i, j) <= green(i, j))
            H = Angulo;
        end
        if(blue(i, j) > green(i, j))
            H = 360 - Angulo;
        end
    end
end
 
%Normalização dos pixeis verdes e vermelhos
somatorio = Red + Green + Blue;
r=(Red./(somatorio));
g=(Green./(somatorio));
 
%Limites da cor da pele
for i = 1:1:linhas
    for j= 1:1:colunas
        f1(i,j)=-1.376*(r(i,j).^2) + 1.0743*r(i,j) + 0.2;
        f2(i,j)=-0.776*(r(i,j).^2) + 0.5601*r(i,j) + 0.18;
    end
end
 
waux=zeros(linhas,colunas);
w = double(waux);
 
%Eliminar a cor branca
for i = 1:1:linhas
    for j= 1:1:colunas
        w(i,j)=((r(i,j)-0.33).^2) + ((g(i,j)-0.33).^2);
    end
end
 
 
%Condicional para detectar se é cor de pele

for i= 1:1:linhas
    for j=1:1:colunas
        if((g(i,j) > f1(i,j)) || (g(i,j) < f2(i,j)) || (w(i, j) < 0.001) || ((H(i,j) <= 240 && H(i,j) > 20)))
            imagemauxiliar1(i,j) = 255;
        else
           imagemauxiliar1(i, j) = 0; 
        end
    end
end

 
figure ; imshow(imagemauxiliar1);