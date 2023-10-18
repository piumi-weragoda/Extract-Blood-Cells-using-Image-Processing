clc clear;

heart_image = imread('C:\Users\LENOVO\Desktop\Image_Processing\heart.png');
imshow(heart_image);

gray_image = rgb2gray(heart_image);
imshow(gray_image);

pkg load image

binary_image = im2bw(gray_image, 0.32);
imshow(binary_image);

complemented_image = imcomplement(binary_image);
imshow(complemented_image);

noise_free_image = medfilt2(complemented_image,[3 3]);
imshow(noise_free_image);

se = strel('disk', 15 ,0); % Adjust the structuring element size as needed
closed_image = imclose(gray_image, se);
imshow(closed_image);

thresholdValue = 44; % Adjust as needed
new_closed_image = closed_image > thresholdValue;
imshow(new_closed_image);

binary_Image_1 = im2bw(new_closed_image, 0.32);
imshow(binary_Image_1)
%%new_binary_Image = im2bw(new_closed_image, 0.5);
%%imshow(new_binary_Image);

new_complemented_image = imcomplement(binary_Image_1);
imshow(new_complemented_image);

vessels_only_image = noise_free_image - new_complemented_image;
imshow(vessels_only_image);
