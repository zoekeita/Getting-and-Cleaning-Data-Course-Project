DATA DICTIONARY

Variables:

        activity_names: the type of activity that was performed during the test
        subject_id: the id of the test subject
        test, test_activity, test_subjectId, train, train_activity, train_subjectId: contains raw data from text files; used in part 0
        subject_data, activity_data, features_data: merged above datasets into dataframes; used in part 1
        sub_and_act, all_data: dataset combining above dataframes; part 1
        mean_std: subset of all_data containing feature names; used in part 1, 2, 3, 5
        mean_stdTidy: took average of each activity and subject to create new dataset
        
Activity Labels:

        The following describe what the subject was doing during the test:
        
                WALKING (val 1)
                WALKING_UPSTAIRS (val 2): walking up a staircase
                WALKING_DOWNSTAIRS (val 3): walking down a staircase
                SITTING (val 4)
                STANDING (val 5)
                LAYING (val 6)
