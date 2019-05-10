# files generation
#./IntraClass/MatchingWithDistortions/generateWithAllImages.sh
#./IntraClass/MatchingWithDistortions/generateWithDsmi.sh
./IntraClass/MatchingWithDistortions/generateWithFCE.sh
./IntraClass/MatchingWithDistortions/generateWithBothMeasures.sh

read -n 1 -s -r -p "Press any key to continue"

#matching
#./IntraClass/MatchingWithDistortions/matchingWithAllImages.sh
#./IntraClass/MatchingWithDistortions/matchingWithDsmi.sh
./IntraClass/MatchingWithDistortions/matchingWithFCE.sh
./IntraClass/MatchingWithDistortions/matchingWithBothMeasures.sh