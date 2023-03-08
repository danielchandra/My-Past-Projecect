# Daniel Chandra - 2301888631
import cv2
import matplotlib.pyplot as plt
import numpy as np

# Preprocessing
# GrayScale
# Sebelum Gray

# Masi belum mengecek gambar satu per satu dalam Folder 'Data'
#Belum tau caranya gimana
img_obj_RGB = cv2.imread('Dataset/Target.jpg')
img_scn_RGB = cv2.imread('Dataset/Data/sample2.jpg')

# Menjadi gray
img_obj = cv2.cvtColor(img_obj_RGB, cv2.COLOR_BGR2GRAY)
img_scn = cv2.cvtColor(img_scn_RGB, cv2.COLOR_BGR2GRAY)

# plt.imshow(img_obj)
# plt.show()

# plt.imshow(img_scn)
# plt.show()

# Equalize Histogram
width = img_scn.shape[1]
height = img_scn.shape[0]
equalize_img = cv2.equalizeHist(img_scn)

intensity = np.zeros(256,dtype=int)

for i in range(height):
    for j in range(width):
        intensity[img_scn[i][j]] +=1
    
plt.figure(figsize=(8,8))
plt.plot(intensity)
plt.title(label='Equalization')
# plt.grid(size=(8,8))
plt.xlabel('intensity')
plt.ylabel('Jumlah/tinggi')
plt.show()

#Clahe
clahe = cv2.createCLAHE(clipLimit=2,tileGridSize=(8,8))
clahe_img = clahe.apply(img_scn)

clahe_res = np.hstack((img_scn,equalize_img,clahe_img))
plt.title(label='Clahe')
plt.plot(clahe_res)
plt.show()
plt.imshow(clahe_res)
plt.show()



# Proses Sift Matching
SIFT = cv2.SIFT_create()

sift_kp_obj, sift_ds_obj = SIFT.detectAndCompute(img_obj,None)
sift_kp_scn, sift_ds_scn = SIFT.detectAndCompute(img_scn,None)

sift_ds_obj = np.float32(sift_ds_obj)
sift_ds_scn = np.float32(sift_ds_scn)

flann = cv2.FlannBasedMatcher(dict(algorithm=1), dict(checks=50))

sift_match = flann.knnMatch(sift_ds_obj,sift_ds_scn,2)
sift_matchesmask = [[0,0] for i in range(0,len(sift_match))]
# print(sift_matchesmask), sudah 0,0 semua

def createMask(mask,match):
    for i, (fm,sm) in enumerate(match):
        if fm.distance < 0.7 * sm.distance:
            mask[i] = [1,0]
    return mask

sift_matchesmask = createMask(sift_matchesmask,sift_match)
# print(sift_matchesmask), beberapa sudah berubah jadi 1,0

sift_res = cv2.drawMatchesKnn(
    img_obj,sift_kp_obj,
    img_scn, sift_kp_scn,
    sift_match, None,
    matchColor=[255,0,0], singlePointColor=[0,255,0],
    matchesMask=sift_matchesmask
)


label_array = ['Best Match Result']
image_array = [sift_res]

for i,(lbl,img) in enumerate(zip(label_array,image_array)):
    plt.imshow(img,cmap='gray')
    plt.title(lbl)
plt.show()