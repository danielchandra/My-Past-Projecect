# Daniel Chandra - 2301888631
# Nomor 2 Filter
# Import library yang akan digunakan
import cv2
import numpy as np
import matplotlib.pyplot as plt

# Image yang akan digunakan
img = cv2.imread('noisy_lena.png', 0)

# Function notch filer
def notch_reject_filter(shape, d0=9, u_k=0, v_k=0):
    P, Q = shape
    # Initialize filter dengan numpy zeros
    H = np.zeros((P, Q))
    # Traverse melewati filter
    for u in range(0, P):
        for v in range(0, Q):
            # Mencari distance dari point D(u,v) ke center
            D_uv = np.sqrt((u - P / 2 + u_k) ** 2 + (v - Q / 2 + v_k) ** 2)
            D_muv = np.sqrt((u - P / 2 - u_k) ** 2 + (v - Q / 2 - v_k) ** 2)
            if D_uv <= d0 or D_muv <= d0:
                H[u, v] = 0.0
            else:
                H[u, v] = 1.0
    return H
    
# Memanggilkan fungsi fft untuk apply pada image
f = np.fft.fft2(img)
fshift = np.fft.fftshift(f)
phase_spectrumR = np.angle(fshift)
magnitude_spectrum = 20*np.log(np.abs(fshift))

# Mengdeclare shape img (height,width,depth)
img_shape = img.shape

# Menggunakan function notch filter
H1 = notch_reject_filter(img_shape, 4, 38, 30)
H2 = notch_reject_filter(img_shape, 4, -42, 27)
H3 = notch_reject_filter(img_shape, 2, 80, 30)
H4 = notch_reject_filter(img_shape, 2, -82, 28)

# Masukan Rumus NotchFilter
# Menggabungkan semua nilai H
NotchFilter = H1*H2*H3*H4
NotchRejectCenter = fshift * NotchFilter 
NotchReject = np.fft.ifftshift(NotchRejectCenter)
# Menghitung inverse DFT
inverse_NotchReject = np.fft.ifft2(NotchReject)  
# Mengdeclare result dengan inverse notch (hasil filter)
Result = np.abs(inverse_NotchReject)

# Mengplotkan hasil
plt.subplot(222)
plt.imshow(img, cmap='gray')
plt.title('Image yang digunakan')
plt.subplot(221)
plt.imshow(magnitude_spectrum, cmap='gray')
plt.title('Hasil magnitude spectrum')
plt.subplot(223)
plt.imshow(magnitude_spectrum*NotchFilter, "gray") 
plt.title("Hasil Notch Reject Filter")
plt.subplot(224)
plt.imshow(Result, "gray") 
plt.title("Hasil filter image")
plt.show()