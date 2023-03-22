# Genshin Data Analysis

Objective
--------
Using the publicly available data from Genshin China iOS market on revenue generated find insights on spending over time, what type of characters are spent on the most, and who is the most spent on character in Genshin Impact. The revenue data was not collected by me but was collected by [Genshin Lab](https://www.genshinlab.com/genshin-impact-revenue-chart/). I pulled this data from Kaggle along with two sets of character data to help with finding correlations between character attributes and how much revenue was generated. 

About the dataset
--------
The Kaggle sets were all CSV files and are included within the project folder. The sets were split into some basic data about the characters, revenue generated per character, and more detailed data about the characters. Due to the limited data on characters I had I chose to restrict the analysis to only characters prior to version 3 of the game. Version 3 of the game is also still not completed as of writing this so I think this is okay, maybe I will revisit when it's completed. I used ETL to extract the data from the CSVs, merge the 2 character data CSVs and load them into a database. From there I did some exploratory SQL to find insights about the data and then proceeded to use SSRS to generate some visual reports on the data.

![2023-03-21_20-47-46](https://user-images.githubusercontent.com/61941068/226783737-3fb2ee4a-55c1-4e1d-8cd1-3bf17a4a3798.png)
![2023-03-21_20-46-44](https://user-images.githubusercontent.com/61941068/226783744-40a53756-bb9a-461b-b53b-283fa074eac9.png)

[Kaggle Revenue Set #1](https://www.kaggle.com/datasets/saladyong/genshin-impact-banner-revenue)

[Kaggle Character DataSet #2](https://www.kaggle.com/datasets/sophiahealy/genshin-impact-character-data)

[Kaggle Character Stats Set #3](https://www.kaggle.com/datasets/genshinplayer/genshin-impact-characters-stats)

Analysis Summary
--------

Conclusions
--------
1) Revenue has been sharply rising every year. 2020 was a short year since it was the year that the game came out but every subsequent year the revenue has at least doubled.

![2023-03-21_20-53-50](https://user-images.githubusercontent.com/61941068/226784004-90273dbe-1a6f-4c95-866c-cf5c425102db.png)


2) Most of the archons (gods in the story) are the highest sellers on average (Raiden and Venti) -- Zhongli seems to be an outlier sitting at the middle of the pack (worth doing more exploration into why)
3) Based on average revenue generated per day the most loved and spent on character prior to version 3 was Raiden by far.

![2023-03-21_20-52-12](https://user-images.githubusercontent.com/61941068/226783953-88b3bba8-cb81-4539-8b51-840bdc93de06.png)


4) Out of the model types the most spent on was the medium-sized female. Ladies were more popular than their male counterparts for all body sizes. This could possibly change as more 5 star units are introduced but my intuition tells me based on the demographic for the game females will always be more popular.

![2023-03-21_20-51-45](https://user-images.githubusercontent.com/61941068/226784031-dd7dd2a0-2457-494d-933d-b5af82ee021d.png)

