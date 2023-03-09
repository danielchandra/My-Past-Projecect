# Import Library
import matplotlib.pyplot as plt
import cv2
# Menggunakan library skimage untuk melakukan match histogram
from skimage import data
from skimage import exposure
from skimage.exposure import match_histograms

# Mengambil image yang akan digunakan
input_image = cv2.imread('input_image.jpg')
reference_image = cv2.imread('reference.jpg')
# Membuat matched image dengan match_histogram() method
matched_image = match_histograms(input_image, reference_image, channel_axis=-1)

# Menampilkan 3 image berdampingan dalam 1 plot: input, reference dan matched
fig, (ax1, ax2, ax3) = plt.subplots(nrows=1, ncols=3, figsize=(8, 5))

ax1.imshow(input_image)
ax1.set_title('Input Image')
ax2.imshow(reference_image)
ax2.set_title('Reference Image')
ax3.imshow(matched_image)
ax3.set_title('Hasil Matched Image')
plt.tight_layout()
plt.show()


# Menampilkan Histogram dari ketiga image
fig, axes = plt.subplots(nrows=3, ncols=3, figsize=(10,8))

# Melakukan loopingan pada image
for i, img in enumerate((input_image, reference_image, matched_image)):
    # Mengdeclare warna setiap pixel yang akan dilooping untuk menghasilkan histogram
    # Red -> input image
    # Green -> Reference image
    # Blue -> Matched image
    for c, c_color in enumerate(('red', 'green', 'blue')):
        # Menggunakan method exposure dari library skimage pd histogram
        img_hist, bins = exposure.histogram(img[..., c], source_range='dtype')
        axes[c, i].plot(bins, img_hist / img_hist.max())
        # Method cumulative distribution
        img_cdf, bins = exposure.cumulative_distribution(img[..., c])
        axes[c, i].plot(bins, img_cdf)
        axes[c, 0].set_ylabel(c_color)
# Judul buat histogram
axes[0, 0].set_title('Histogram Input Image')
axes[0, 1].set_title('Histogram Reference Image')
axes[0, 2].set_title('Histogram hasil Matched Image')
plt.tight_layout()
plt.show()