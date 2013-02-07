% Benjamin Shih
% 16722 S13
% Due: 2/7/2013
% Vignetting based on cos^4 law

clear

% Focal length. [m]
f = 35e-3;

% Horizontal/Vertical resolution. [pixels/inch]
horRes = 96;
verRes = 96;
% [inch/m]
inch2m = 39.37;
horRes = horRes * inch2m;
verRes = verRes * inch2m;

% 255 = white, 0 = black

rgbImage = imread('ben.jpg');
[row, col, channels] = size(rgbImage);

centerRow = row/2;
centerCol = col/2;

for i = 1:row
    for j = 1:col
        distPixelFromCenter = sqrt((i-centerRow)^2 + (j-centerCol)^2); % [pixels]
        distFromCenter = distPixelFromCenter / horRes; % [pixels/(pixels/m) = m]
        angle = atan2(distFromCenter, f); 
        for k = 1:channels
            rgbImage(i,j,k) = rgbImage(i,j,k) * cos(angle)^4;
        end
    end
end

imshow(rgbImage)