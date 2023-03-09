# Daniel Chandra - 2301888631
# Nomor 1 Histogram matching
# Import library
import numpy as np
import matplotlib.pyplot as plt
import cv2

# Mengambil image yang akan dipakai (dinaikin contrast)
img = cv2.imread('input_image.jpg')
reference_img = cv2.imread('reference.jpg')

#RGB BGR -> GRAYSCALE (buat jaga jaga klo image belum full)
img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
# Menampilkan gambar image setelah diubah jadi gray
cv2.imshow('Input Image',img_gray)
cv2.waitKey(0)

print(img.shape)
# Menyimpan variable widht height per pixel pada gambar dengan shape
# (163, 258, 3) -> didapatkan dari print(img.shape) dimana 163 = height, 258 = height, 3 = depth
# Widht dari image terdapat pada variable ke 1 pada img shape
widht = img.shape[1]
# Height dari image terdapat pada variable ke 0 pada img shape
height = img.shape[0]

#Membuat array yang akan menampung intensitas dalam tiap pixel
#256 -> (0-255)
intensity = np.zeros(256, dtype=int)
intensity2 = np.zeros(256, dtype=int)

# Membuat grafik histogram dari input image
# Melakukan loopingan untuk setiap pixel dari image sampai height and widht image habis
for i in range(height):
    for j in range(widht):
        #img_gray berisi intensitas pixel
        intensity[img_gray[i][j]] += 1

#plot grafik histogram 
plt.plot(intensity,'g .',label='Input Image')
plt.legend(loc="upper left")
plt.xlabel('Intensity')
plt.ylabel('Quantity')
plt.show()

# Membuat grafik histogram dari reference image
# Melakukan loopingan untuk setiap pixel dari image sampai height and widht image habis
for i in range(height):
    for j in range(widht):
        #img_gray berisi intensitas pixel
        intensity2[reference_img[i][j]] += 1

#plot grafik histogram 
plt.plot(intensity2,'g .',label='Reference Image')
plt.legend(loc="upper left")
plt.xlabel('Intensity')
plt.ylabel('Quantity')
plt.show()

#Equalization
equalize_img = cv2.equalizeHist(img_gray)
equalize_intensity = np.zeros(256,dtype=int)

for i in range(height):
    for j in range(widht):
        equalize_intensity[equalize_img[i][j]] += 1
    
plt.figure(1, (16,8))
plt.subplot(1,2,1)
plt.plot(intensity, 'g .', label='Before')
plt.legend(loc="upper right")
plt.ylabel('Quantity')
plt.xlabel('Intensity')
plt.title('Before')

plt.figure(1, (16,8))
plt.subplot(1,2,2)
plt.plot(equalize_intensity, 'g', label='After')
plt.legend(loc="upper right")
plt.ylabel('Quantity')
plt.xlabel('Intensity')
plt.title('After')
plt.show()

#Clahe Equalization
clahe = cv2.createCLAHE(clipLimit=4.0, tileGridSize=(8,8))
clahe_img = clahe.apply(img_gray)

# Array penumpang, biar bisa ditampilkan semua image dalam satu plot
labels = ['Input Image','Reference Image','Hasil Equalization Image','Hasil Clahe Equalization Image']
images = [img,reference_img,equalize_img,clahe_img]

# Mengatur ukuran plot
plt.figure(figsize=(12,12))
# Melakukan looping untuk menampilkan semua isi array
for i, (lbl,image) in enumerate(zip(labels,images)):
    plt.subplot(2,2,i+1)
    plt.imshow(image,cmap='gray')
    plt.title(lbl)
plt.show()






