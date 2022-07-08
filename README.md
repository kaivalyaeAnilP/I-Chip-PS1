Using Verilog, we describe a circuit that performs the following operations on an input byte depending on the state of the select signal : 
- increase brightness by 60 when it is 2'b00, 
- decrease brightness by 60 when it is 2'b01,
- binarize the image using threshold value of 160 when it is 2’b10, and
- invert the image when it is 2'b11.
We use python to convert a grayscale .jpg image to a .txt file containing each byte of the original image.  This is then loaded into a test bench created in Verilog.  We feed each image byte from the .txt file into the circuit, perform the four operations on it, and write its content to a .txt file using $writememh function.
The resultant .txt files are converted back to .jpg files, obtaining a brightened, darkened, binarized, and inverted version of the original image
