# Daniel Chandra - 2301888631
# Nomor 5 - Matching with sift & calculate homographic ransac
# Import library
import numpy as np
import cv2 as cv
from matplotlib import pyplot as plt

# Mengambil image yang akan dimatching
# Object image yang akan digunakan
img1 = cv.imread('box.png',0)    
# Scene image yang akan dimatching
img2 = cv.imread('box_in_scene.png',0)

# Bikin object detector sift
sift = cv.SIFT_create()
# Mencari/mendeteksi keypoint dan descriptornya
# parameter 1 = source image
# parameter 2 = masking
kp1, des1 = sift.detectAndCompute(img1,None)
kp2, des2 = sift.detectAndCompute(img2,None)

#flann
FLANN_INDEX_KDTREE = 1
index_params = dict(algorithm = FLANN_INDEX_KDTREE, trees = 5)
search_params = dict(checks = 50)

# Memanggil cv flann
flann = cv.FlannBasedMatcher(index_params, search_params)
matches = flann.knnMatch(des1,des2,k=2)

# Array buat menyimpan semua matches yang bagus
good = []

# brutefotce buat bandingin obj & scene
#rumus, jika distance fm < 0.7 * sm maka diappend
for m,n in matches:
    if m.distance < 0.7*n.distance:
        good.append(m)

# Calculate Homography ransac
MIN_MATCH_COUNT = 10
# Menentapkan if bahwa setidaknya 10 kecocokan (MIN_MATCH_COUNT) harus terdapat di object
# Jika ditemukan kecocokan, maka mengekstrak lokasi titik kunci yang cocok pada kedua gambar
# Transformasi perspektif, setelah didapatkan matriks transformasi 3x3, menggunakan sudut object_image ke titik yang sesuai dengan scene_image
if len(good)>MIN_MATCH_COUNT:
    src_pts = np.float32([ kp1[m.queryIdx].pt for m in good ]).reshape(-1,1,2)
    dst_pts = np.float32([ kp2[m.trainIdx].pt for m in good ]).reshape(-1,1,2)
    M, mask = cv.findHomography(src_pts, dst_pts, cv.RANSAC,5.0)
    matchesMask = mask.ravel().tolist()
    h,w = img1.shape
    pts = np.float32([ [0,0],[0,h-1],[w-1,h-1],[w-1,0] ]).reshape(-1,1,2)
    dst = cv.perspectiveTransform(pts,M)
    img2 = cv.polylines(img2,[np.int32(dst)],True,255,3, cv.LINE_AA)

# Jika tidak ditemukan kecocokan, maka tinggal print kalimat
else:
    print( "Kecocokan yang ditemukan tidak mencukupi - {}/{}".format(len(good), MIN_MATCH_COUNT) )
    matchesMask = None

# Gambar Hasil matching pada image
draw_params = dict(matchColor = (0,255,255), #warna biru terang
                   singlePointColor = None,
                   matchesMask = matchesMask, 
                   flags = 2)

# Menggabungkan kedua gambar dan melakukan matching
img3 = cv.drawMatches(img1,kp1,img2,kp2,good,None,**draw_params)
# plot
plt.imshow(img3,'gray')
plt.show()
