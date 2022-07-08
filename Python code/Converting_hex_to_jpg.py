from PIL import Image

with open(r'C:\Users\Kaivalya\project_1\project_1.sim\sim_1\behav\xsim\Brightened_image.hex') as f1:
    contents1 = f1.read()
f1.close()
with open(r'C:\Users\Kaivalya\project_1\project_1.sim\sim_1\behav\xsim\Darkened_image.hex') as f2:
    contents2 = f2.read()
f2.close()
with open(r'C:\Users\Kaivalya\project_1\project_1.sim\sim_1\behav\xsim\Inverted_image.hex') as f3:
    contents3 = f3.read()
f3.close()
with open(r'C:\Users\Kaivalya\project_1\project_1.sim\sim_1\behav\xsim\Thresholded_image.hex') as f4:
    contents4 = f4.read()
f4.close()

contents1 = contents1.replace(' ','')
contents1 = contents1.replace('\n','')
contents2 = contents2.replace(' ','')
contents2 = contents2.replace('\n','')
contents3 = contents3.replace(' ','')
contents3 = contents3.replace('\n','')
contents4 = contents4.replace(' ','')
contents4 = contents4.replace('\n','')

data1 = bytes.fromhex(contents1)
data2 = bytes.fromhex(contents2)
data3 = bytes.fromhex(contents3)
data4 = bytes.fromhex(contents4)

img1 = Image.frombytes("L", (384, 256), data1)
img1.save(r"C:\Users\Kaivalya\Pictures\Brightened_image.jpg")
img2 = Image.frombytes("L", (384, 256), data2)
img2.save(r"C:\Users\Kaivalya\Pictures\Darkened_image.jpg")
img3 = Image.frombytes("L", (384, 256), data3)
img3.save(r"C:\Users\Kaivalya\Pictures\Inverted_image.jpg")
img4 = Image.frombytes("L", (384, 256), data4)
img4.save(r"C:\Users\Kaivalya\Pictures\Thresholded_image.jpg")
