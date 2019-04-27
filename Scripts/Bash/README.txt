Steps that must be followed in order to run the scripts in the right order, from computing the metrics to running the matching algorithm

-----------------------------MATCHING------------------------------------------------------------

- General steps

    1. Create the txt file with the desired images to process for each database;
        1.1. The script used for splitting the database into train and test is split_databases.py;
    2. Change both Matching/ and Process/ files in IrisDatabases/Test-Osiris for each database;
    3. Run osiris in all images;
        3.1. If is ubirisv2, then the images must be separated in a special template;

- All images

    1. Run the script matchingWithAllImages.sh;

- DSMI

    1. Run the script compute_dsmi_measures.py;
    2. Run the script matchingWithDsmi.sh;

- FCE

    1. Run the script compute_fcm_measure.py;
    2. Run the script matchingWithFCE.sh;

- Both measures

    1. Run the script matchingWithBothMeasures.sh;

-------------------------------------------------------------------------------------------------

-----------------------------TESTS---------------------------------------------------------------
    
    1. Generate label files for all of the databases, running the script generateLabelFiles.sh;
    2. Run the compute_accuracy_metrics script in order to compute AUC, EER and d' and plot 
       graphics aswell;

-------------------------------------------------------------------------------------------------