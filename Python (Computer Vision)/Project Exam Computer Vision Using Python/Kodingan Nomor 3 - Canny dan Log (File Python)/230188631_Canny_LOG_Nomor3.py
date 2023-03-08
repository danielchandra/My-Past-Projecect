# Daniel Chandra - 2301888631
# Import library
import cv2
import numpy as np
import matplotlib.pyplot as plt

# Mengambil image yang ingin digunakan untuk mencari edges
image = cv2.imread('fruits.jpg')
# Mengubah image jadi gray (BGR/RGB TO GRAY)
imggray =cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)

#Laplacian Edges detection
#Menggunakan fungsi cv Laplacian (8 bit hingga 64 bit)
laplace_8 = cv2.Laplacian(imggray,cv2.CV_8U)
laplace_16 = cv2.Laplacian(imggray,cv2.CV_16S)
laplace_32 = cv2.Laplacian(imggray,cv2.CV_32F)
laplace_64 = cv2.Laplacian(imggray,cv2.CV_64F)

# Menggabungkan semua hasil menjadi 1 dalam array
laplace_label = ['laplace 8 bit',"laplace 16 bit",'laplace 32 bit','laplace 64 bit']
laplace_images = [laplace_8 ,laplace_16 ,laplace_32 ,laplace_64]

# Mengatur ukuran plot
plt.figure(figsize=(12,12))
# Melakukan looping untuk menampilkan semua isi array (label dan image)
for i, (lbl,image) in enumerate(zip(laplace_label,laplace_images)):
    # Munculkan gambar dalam bentuk 2x2
    plt.subplot(2,2,i+1)
    plt.imshow(image,cmap='gray')
    plt.title(lbl)
plt.show()

#Canny Edge Detection
# hasil output dr sobel => input dr canny
#lower threshold
#higher threshold

#dibawah lower => eliminasi
#di atas higher => ambil
#di antara => bakal dicheck dulu

# Canny
# Menggunakan fungsi cv2 canny dengan perbandingan 2:1 / 3:1
# untuk mencari hasil yang terbaik
canny_50_100 = cv2.Canny(imggray, 50, 100)
canny_50_150 = cv2.Canny(imggray, 50, 150)
canny_75_150 = cv2.Canny(imggray, 75, 150)
canny_75_225 = cv2.Canny(imggray, 75, 225)

# Menggabungkan semua hasil menjadi 1 dalam array
canny_labels = ['canny 50 100','canny 50 150','canny 75 150','canny 75 225']
canny_img = [canny_50_100,canny_50_150,canny_75_150,canny_75_225]

# Mengatur ukuran plot
plt.figure(figsize=(12,12))
# Melakukan looping untuk menampilkan semua isi array
for i, (lbl,image) in enumerate(zip(canny_labels,canny_img)):
    # Munculkan gambar dalam bentuk 2x2
    plt.subplot(2,2,i+1)
    plt.imshow(image,cmap='gray')
    plt.title(lbl)
plt.show()
