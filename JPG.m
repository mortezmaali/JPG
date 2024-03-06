RGB = imread('Yellow_ML.png');
[L A B] = imsplit(rgb2lab(RGB));
Lfill = 50*ones(size(L)); % pick some L level for representing A,B
Zfill = zeros(size(L));
Lvis = mat2gray(L);
Avis = lab2rgb(cat(3,Lfill,A,Zfill));
Bvis = lab2rgb(cat(3,Lfill,Zfill,B));
figure; imshow(Lvis)
%red_green channel
figure(2); imshow(Avis)
%yellow_blue channel
figure(3); imshow(Bvis)

%reducing the size of the color channels and then combining it with the
%full-resolution luminance channel
An = imresize(A,0.1);
Bn = imresize(B,0.1);

An = imresize(An,[1149 761]);
Bn = imresize(Bn,[1149 761]);
RGB_color_compressed = lab2rgb(cat(3,L,An,Bn));
figure(4);imshow(RGB_color_compressed);title('Color Channel compressed');
figure(5);imshow(RGB);title('Original Image')

%Now compressing the luminance channel and combining it back with the
%full-resolution color channels.
Ln = imresize(L,0.1);
Ln = imresize(Ln,[1149 761]);
RGB_L_compressed = lab2rgb(cat(3,Ln,A,B));
figure(6);imshow(RGB_L_compressed);title('Luminance Channel compressed');
figure(7);imshow(RGB);title('Original Image')
