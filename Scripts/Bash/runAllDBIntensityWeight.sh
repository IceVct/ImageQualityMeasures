echo "MICHE"
python computeQualityMeasures.py /home/victor/UnB/TCC/Codigos/IrisRecogSys/ImagesFiles/MicheDatabase.txt /home/victor/UnB/TCC/Codigos/IrisRecogSys/ImagesFiles/MicheResultsWeight-Both.txt

echo "Warsaw"
python computeQualityMeasures.py /home/victor/UnB/TCC/Codigos/IrisRecogSys/ImagesFiles/WarsawBioBaseDatabase.txt /home/victor/UnB/TCC/Codigos/IrisRecogSys/ImagesFiles/WarsawBioBaseResultsWeight-Both.txt

echo "UBIRIS"
python computeQualityMeasures.py /home/victor/UnB/TCC/Codigos/IrisRecogSys/ImagesFiles/UbirisDatabase.txt /home/victor/UnB/TCC/Codigos/IrisRecogSys/ImagesFiles/UbirisResultsWeight-Both.txt

echo "VISOB"
python computeQualityMeasures.py /home/victor/UnB/TCC/Codigos/IrisRecogSys/ImagesFiles/VISOBDatabase.txt /home/victor/UnB/TCC/Codigos/IrisRecogSys/ImagesFiles/VISOBResultsWeight-Both.txt

