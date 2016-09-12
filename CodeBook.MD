DATA DICTIONARY

Variables:

        activity_names: the type of activity that was performed during the test
        subject_id: the id of the test subject
        test, test_activity, test_subjectId, train, train_activity, train_subjectId: contains raw data from text files; used in part 0
        test_df, train_df, train_and_test: merged above datasets into dataframes; used in part 1
        meanstd_data: dataset containing vector mean_std with IDs, mean, and std; used in part 2
        t_and_t_melt: contains melted version of data to make manipulation easier; used in part 5
        t_and_t_mean: contains the average values; used in part 5
        
Activity Labels:

        The following describe what the subject was doing during the test:
        
                WALKING (val 1)
                WALKING_UPSTAIRS (val 2): walking up a staircase
                WALKING_DOWNSTAIRS (val 3): walking down a staircase
                SITTING (val 4)
                STANDING (val 5)
                LAYING (val 6)
