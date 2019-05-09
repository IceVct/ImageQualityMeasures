# files generation
./InterClass/Matching/generateWithAllImages.sh
./InterClass/Matching/generateWithDsmi.sh
./InterClass/Matching/generateWithFCE.sh
./InterClass/Matching/generateWithBothMeasures.sh

read -n 1 -s -r -p "Press any key to continue"

#matching
./InterClass/Matching/matchingWithAllImages.sh
./InterClass/Matching/matchingWithDsmi.sh
./InterClass/Matching/matchingWithFCE.sh
./InterClass/Matching/matchingWithBothMeasures.sh