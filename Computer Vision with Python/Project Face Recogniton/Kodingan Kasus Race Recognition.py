#Daniel Chandra - 2301888631

import cv2
import os
import numpy as np

# Declare secara global classifiernya
# Gunakan frontface haarcascades
classifier = cv2.CascadeClassifier("haarcascades\haarcascade_frontalface_default.xml")
# root_path = "./dataset/train"

def get_path_list(root_path):

    # list_class = list()
    # Location dari root directory
    list_path_root = os.listdir(root_path)
    return list_path_root

    '''
        To get a list of path directories from root path

        Parameters
        ----------
        root_path : str
            Location of root directory
        
        Returns
        -------
        list
            List containing the names of the sub-directories in the
            root directory
    '''

def get_class_id(root_path, train_names):

    # print(train_names)

    image_list = list()
    classes_image_id_list = list()

    for idx,file in enumerate(train_names):
        train_full_path = root_path + '/' + file
        image_list_new = os.listdir(train_full_path)

        for i in image_list_new:
            path = root_path + '/' + file + '/' + i
            image_list.append(path)
            classes_image_id_list.append(idx)

    # print(image_list)
    # print(classes_image_id_list)

    return image_list, classes_image_id_list

    '''
        To get a list of train images and a list of image classes id

        Parameters
        ----------
        root_path : str
            Location of images root directory
        train_names : list
            List containing the names of the train sub-directories
        
        Returns
        -------
        list
            List containing all image in the train directories
        list
            List containing all image classes id
    '''

def detect_faces_and_filter(image_list, image_classes_list=None):

    train_face_grays = list()
    filter_face_rectangle = list()
    filtered_classes_list = list()

    # Buat kasus image_classes_listnya kosong atau tidak
    # Kalau dibutuhkan yang kosong alias none, maka akan masuk ke if yang dimana for tidak ada idx
    # Ingat Looping 2 kali karna dalam folder Train ada folder lagi sesuai nama classes
    if image_classes_list == None:
        
        for img in image_list:
            img_read = cv2.imread(img,0)
            # 350 x 350px
            img_resize = cv2.resize(img_read,(350,350),cv2.INTER_AREA)
            #detect face
            detected_faces = classifier.detectMultiScale(
                img_resize,
                scaleFactor = 1.3,
                minNeighbors = 5
                )

            # validasi kalau face yang kedetect kurang dari 1
            if len(detected_faces) < 1:
                continue

            # For kedua
            # Masih di dalam for img
            for face in detected_faces:
                x,y,h,w = face
                #crop image
                # x:x+w,y:y+h, untuk cv2 y didepan
                # x -> widht, y->height
                face_images = img_resize[y:y+h,x:x+w]

                # Masukin semua data face ke list
                train_face_grays.append(face_images)
                filter_face_rectangle.append(face)
                # classes list nya none
                filtered_classes_list = None

    # Jika image classes list nya ada isi, maka parameter loop image image classes list dimasukkin
    if image_classes_list != None:
        # For pertama
        for idx,img in zip(image_classes_list,image_list):
            img_read = cv2.imread(img,0)
            # 350 x 350px
            img_resize = cv2.resize(img_read,(350,350),cv2.INTER_AREA)
            #detect face
            detected_faces = classifier.detectMultiScale(
                img_resize,
                scaleFactor = 1.3,
                minNeighbors = 5
                )

            # validasi kalau face yang kedetect kurang dari 
            if len(detected_faces) < 1:
                continue

            # For kedua
            # Masih di dalam img
            for face in detected_faces:
                x,y,h,w = face
                #crop image
                # x:x+w,y:y+h, untuk cv2 y didepan
                # x -> widht, y->height
                face_images = img_resize[y:y+h,x:x+w]

                # Masukin semua data face ke list
                train_face_grays.append(face_images)
                filter_face_rectangle.append(face)
                filtered_classes_list.append(idx)

    return train_face_grays,filter_face_rectangle,filtered_classes_list
        

    '''
        To detect a face from given image list and filter it if the face on
        the given image is less than one

        Parameters
        ----------
        image_list : list
            List containing all loaded images
        image_classes_list : list, optional
            List containing all image classes id
        
        Returns
        -------
        list
            List containing all filtered and cropped face images in grayscale
        list
            List containing all filtered faces location saved in rectangle
        list
            List containing all filtered image classes id
    '''

def train(train_face_grays, image_classes_list):

    face_recognize = cv2.face.LBPHFaceRecognizer_create()
    # Train face gray yang telah diresize
    face_recognize.train(train_face_grays,np.array(image_classes_list))
    return face_recognize
    '''
        To create and train face recognizer object

        Parameters
        ----------
        train_face_grays : list
            List containing all filtered and cropped face images in grayscale
        image_classes_list : list
            List containing all filtered image classes id
        
        Returns
        -------
        object
            Recognizer object after being trained with cropped face images
    '''

def get_test_images_data(test_root_path):

    image_list = list()

    for image_path in os.listdir(test_root_path):
        image_list.append(test_root_path + '/' + image_path)

    return image_list
    '''
        To load a list of test images from given path list

        Parameters
        ----------
        test_root_path : str
            Location of images root directory
        
        Returns
        -------
        list
            List containing all loaded gray test images
    '''
    
def predict(recognizer, test_faces_gray):

    res = list()

    for img in test_faces_gray:
        # Parameter kedua dikosongkan
        result, _ = recognizer.predict(img)
        res.append(result)

    return res
    '''
        To predict the test image with the recognizer

        Parameters
        ----------
        recognizer : object
            Recognizer object after being trained with cropped face images
        train_face_grays : list
            List containing all filtered and cropped face images in grayscale

        Returns
        -------
        list
            List containing all prediction results from given test faces
    '''

def draw_prediction_results(predict_results, test_image_list, test_faces_rects, train_names):

    img_list = list()

    for idx, (img,face) in enumerate(zip(test_image_list,test_faces_rects)):
        x,y,h,w = face
        img_read = cv2.imread(img)
        # Diresize 350x350px sesuai soal
        test_image = cv2.resize(img_read,(350,350),interpolation=cv2.INTER_AREA)

        test_image = cv2.rectangle(
            test_image,
            (x,y),
            (x+w,y+h),
            (0,255,0),
            2
        )

        # bikin text dari hasil predictnya
        text = train_names[predict_results[idx]]

        test_image = cv2.putText(
            test_image,
            text, (x,y-10),
            cv2.FONT_HERSHEY_PLAIN,
            1,
            (0,255,0),
            2
            )

        img_list.append(test_image)

    return img_list


    '''
        To draw prediction results on the given test images and acceptance status

        Parameters
        ----------
        predict_results : list
            List containing all prediction results from given test faces
        test_image_list : list
            List containing all loaded test images
        test_faces_rects : list
            List containing all filtered faces location saved in rectangle
        train_names : list
            List containing the names of the train sub-directories

        Returns
        -------
        list
            List containing all test images after being drawn with
            final result
    '''
    

def combine_and_show_result(image_list):

    img_list = list()

    for img in image_list:
        img_list.append(img)

    # Hconcat -> Menggabungkan gambar secara verticaly
    final_image_result = cv2.hconcat(img_list)
    
    cv2.imshow('Final Result',final_image_result)
    cv2.waitKey(0)
    '''
        To show the final image that already combine into one image

        Parameters
        ----------
        image_list : nparray
            Array containing image data
    '''

'''
You may modify the code below if it's marked between

-------------------
Modifiable
-------------------

and

-------------------
End of modifiable
-------------------
'''
if __name__ == "__main__":

    '''
        Please modify train_root_path value according to the location of
        your data train root directory

        -------------------
        Modifiable
        -------------------
    '''
    train_root_path = "dataset/train"
    '''
        -------------------
        End of modifiable
        -------------------
    '''

    train_names = get_path_list(train_root_path)
    train_image_list, image_classes_list = get_class_id(train_root_path, train_names)
    train_face_grays, _, filtered_classes_list = detect_faces_and_filter(train_image_list, image_classes_list)
    recognizer = train(train_face_grays, filtered_classes_list)

    '''
        Please modify train_root_path value according to the location of
        your data train root directory

        -------------------
        Modifiable
        -------------------
    '''
    test_root_path = "dataset/test"
    '''
        -------------------
        End of modifiable
        -------------------
    '''

    test_image_list = get_test_images_data(test_root_path)
    test_faces_gray, test_faces_rects, _ = detect_faces_and_filter(test_image_list)
    predict_results = predict(recognizer, test_faces_gray)
    predicted_test_image_list = draw_prediction_results(predict_results, test_image_list, test_faces_rects, train_names)
    
    combine_and_show_result(predicted_test_image_list)