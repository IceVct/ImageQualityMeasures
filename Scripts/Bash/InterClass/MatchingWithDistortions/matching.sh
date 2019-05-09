# files generation
./InterClass/MatchingWithDistortions/generateWithAllImages.sh
./InterClass/MatchingWithDistortions/generateWithDsmi.sh
./InterClass/MatchingWithDistortions/generateWithFCE.sh
./InterClass/MatchingWithDistortions/generateWithBothMeasures.sh

read -n 1 -s -r -p "Press any key to continue"

#matching
./InterClass/MatchingWithDistortions/matchingWithAllImages.sh
./InterClass/MatchingWithDistortions/matchingWithDsmi.sh
./InterClass/MatchingWithDistortions/matchingWithFCE.sh
./InterClass/MatchingWithDistortions/matchingWithBothMeasures.sh
