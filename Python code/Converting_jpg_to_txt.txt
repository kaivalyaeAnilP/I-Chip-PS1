from PIL import Image

im = Image.open('C:/Users/Kaivalya/Downloads/Img.jpg')

pixels = list(im.getdata())
width, height = 384,256 
pixels_int = [int(x) for x in pixels]
pixels_hex = [hex(x) for x in pixels_int]

pixels_hex = [x.replace("0x","") for x in pixels_hex]

with open("C:/Users/Kaivalya/Documents/Img1.txt", "w") as f:
    f.writelines(["%s\n" % item  for item in pixels_hex])
f.close()
