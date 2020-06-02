%program explaning steganography:an act of hiding images
%helpful for secure data/image transfer
cover=imread('input_image.bmp');
message=imread('sectret_image.bmp');
figure(1),imshow(cover);title('Original Image(Cover Image)');
figure(2),imshow(message);title('Image to Hide(Message Image)');
cover=double(cover);
message=double(message);
%imbed=no. of bits of message image to embed in cover image
imbed=7;
%shift the message image over (8-imbed)bits to right
messageshift=bitshift(message,-(8-imbed));
%show the message image with only embed bits on screen
%must shift from LSBs to MSBs
showmess=uint8(messageshift);
showmess=bitshift(showmess,8-imbed);
messageshift=imresize(messageshift,[250,250]);
%now zero out imbed bits in cover image
coverzero = cover;
for i=1:imbed
coverzero=bitset(coverzero,i,0);
end
%now add message image and cover image
coverzero1=imresize(coverzero,[250,250]);
coverzero1=double(coverzero1);
stego = uint8(coverzero1 + messageshift);
figure(3),imshow(stego);title('stego image');
imwrite(stego,'stego4.bmp');
