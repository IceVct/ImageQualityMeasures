from feature_correlation_measure import feature_correlation_measure
from dilation_measure import dilation_measure
from occlusion_measure import occlusion_measure
import cv2

# Most of the variables names are following the paper Feature correlation evaluation approach for iris feature
# quality measure (by Craig Belcher, Yingzi Du, Zhi Zhou and Robert Ives) nomenclature.

def main():
    d = dil_measure.dilation_measure(37., 135.)
    print d
    im = cv2.imread('/home/vavieira/UnB/TCC/Codigos/ImageQualityMeasures/OsirisOutput/Warsaw/Output/NormalizedMasks/IMG_3417_mano.bmp', 0)
    o = occ_measure.occlusion_measure(im)
    print o


if __name__ == "__main__":
    main()