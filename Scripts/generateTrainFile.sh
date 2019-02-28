# Appending all the iris datasets train files into one
base_path="/home/vavieira/UnB/TCC/IrisDatabases/"
miche="MICHE/miche_train.txt"
warsaw="Warsaw-BioBase-Smartphone-Iris-v1.0/warsaw_train.txt"
ubirisv1="UBIRISv1/ubirisv1_train.txt"
ubirisv2="UBIRISv2/ubirisv2_train.txt"
echo $miche
cat "$base_path$miche" >> ../train.txt
cat "$base_path$warsaw" >> ../train.txt
cat "$base_path$ubirisv1" >> ../train.txt
cat "$base_path$ubirisv2" >> ../train.txt