# files generation
./IntraClass/Matching/generateWithAllImages.sh
./IntraClass/Matching/generateWithDsmi.sh
./IntraClass/Matching/generateWithFCE.sh
./IntraClass/Matching/generateWithBothMeasures.sh

read -n 1 -s -r -p "Press any key to continue"

#matching
./IntraClass/Matching/matchingWithAllImages.sh
./IntraClass/Matching/matchingWithDsmi.sh
./IntraClass/Matching/matchingWithFCE.sh
./IntraClass/Matching/matchingWithBothMeasures.sh