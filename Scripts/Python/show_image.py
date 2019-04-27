import numpy as np
import cv2
import sys

img = cv2.imread(sys.argv[1], cv2.IMREAD_UNCHANGED )

cv2.imshow('image', img)
cv2.waitKey(0)
cv2.destroyAllWindows()
