import cv2 as cv
# import random
# import warnings
# import numpy as np


# def random_upper(string: str, n: int):
#     if n >= len(string):
#         n = len(string)//2
#         print(
#             f"You cannot upper more than all letters, n will be setted to {n}")
#     splitted_array = list(string)
#     selected_index = random.sample(range(len(splitted_array)), n)
#     returned = [splitted_array[i].upper(
#     ) if i in selected_index and splitted_array[i].isalpha() else splitted_array[i] for i in range(len(splitted_array))]

#     return "".join(returned)


# print(random_upper("Ouagadougou", 2))


def interpolation(old, new):
    if old[0] < new[0] or old[1] < new[1]:
        return cv.INTER_CUBIC
    else:
        return cv.INTER_AREA


image = cv.imread("/home/chris/Desktop/le seneve/god.jpg")
dst = cv.detailEnhance(image, sigma_s=10, sigma_r=0.15)
resized = cv.resize(
    dst, (1200, 850), interpolation=interpolation(image.shape, (1200, 850)))
# imTwoTimes = np.array(resized)
cv.imshow("image two times for test", resized)

# cv.imwrite("god.png", resized)

# cv.destroyAllWindows()
cv.waitKey(0)
cv.destroyAllWindows()
