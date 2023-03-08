#Daniel Chandra-2301888631
#Harris Corner Detection

#Import Library
import cv2
from matplotlib import pyplot as plt
import numpy as np

# Mengambil image yang akan dipakai
im = cv2.imread('building.jpg')
# Ubah warna image bgr to gray
im_gray = cv2.cvtColor(im, cv2.COLOR_BGR2GRAY)
# munculkan gambar pake hasil import plt
plt.imshow(cv2.cvtColor(im, cv2.COLOR_BGR2RGB))
plt.title('Contoh Image')
plt.axis('off')
plt.show()

# Menghitung gradient dalam X menggunakan sobel 64 bit
i_x = cv2.Sobel(im_gray, cv2.CV_64F, 1, 0)
# Plot dalam gradient x
plt.imshow(i_x,cmap='gray')
plt.title('Gradient dalam X')
plt.axis('off')
plt.show()
# Menghitung gradient dalam Y menggunakan sobel
i_y = cv2.Sobel(im_gray, cv2.CV_64F, 0, 1)
# Plot dalam gradient y
plt.imshow(i_y, cmap='gray')
plt.title('Gradient dalam Y')
plt.axis('off')
plt.show()

# Menghitung product derivates dalam setiap direction
# Dipangkat 2
i_xx = np.multiply(i_x, i_x)
i_xy = np.multiply(i_x, i_y)
i_yy = np.multiply(i_y, i_y)
# Menghitung perjumlah derivates 
s_xx = cv2.GaussianBlur(i_xx, (5,5), 0)
s_xy = cv2.GaussianBlur(i_xy, (5,5), 0)
s_yy = cv2.GaussianBlur(i_yy, (5,5), 0)

# Compute response detector pada setiap titik
# Default k .04
k = .04 
# menghitung determinan h
det_h = np.multiply(s_xx, s_yy) - np.multiply(s_xy, s_xy)
# trace h
trace_h = s_xx + s_yy
# Masukan rumus, det - k*trace^2
R = det_h - k*np.multiply(trace_h, trace_h)
# Threshold
#Tweak
ratio = .2 
thresh = abs(R) > ratio * abs(R).max()
# Plot hasil threshold
plt.imshow(thresh, cmap='gray')
plt.title('Thresholded Image')
plt.axis('off')
plt.show()

#non-maximal supression
# Index dari non zero values
non_zero_cords = np.nonzero(thresh)

# Tupled koordinat
tuple_cords = [(i, j) for i,j in zip(non_zero_cords[0], non_zero_cords[1])] 
# Value koordinat
values = [abs(R)[i, j] for i, j in tuple_cords]
# Sort the koordinats
sorted_cords = [tuple_cords[i] for i in np.argsort(values)[::-1]]
# Set Distance
distance = 10

# Cords nns
# Mencari corner
nms_cords = []
nms_cords.append(sorted_cords[0])
for cord in sorted_cords:
    for nms_cord in nms_cords:
        if abs(cord[0]-nms_cord[0]) < distance and abs(cord[1]-nms_cord[1]) < distance:
            break
    else:
        nms_cords.append(cord)
print ("sebelum NMS = {} ".format(sum(thresh)))
print ("setelah NMS = {} ".format(len(nms_cords)))



# Timpa gambar dengan titik merah (merah pada setiap corner image)
for nms_cord in nms_cords:
    cv2.circle(im, (nms_cord[1], nms_cord[0]), 4, (0, 0, 255), -1)
# tampilkan hasil akhir result

# Gambarnya agak lama muncul setelah dirun, harus ditunggu beberapa detik
plt.figure(figsize=(12,12))
plt.imshow(cv2.cvtColor(im, cv2.COLOR_BGR2RGB))
plt.title('Hasil Harris Corner (harus di zoom baru nampak titik merah pada setiap korner)')
plt.axis('off')
plt.show()
