# Identifying-the-Relationship-Between-Bike-Lanes-and-New-Business-Creation
By using a difference in difference model, this study investigates how the installation of bike lanes affects new business creation in New York City for the years 2010 and 2018. In carrying out this research, the results can help square the discussion of how bike infrastructure affects business health. Additionally, this research can assist cities in better deciding where to target new bike lane creation, as cities continue to solve congestion-related issues.

#Data Sources
Data comes from the city of New York Open Data Project. The New York City Open Data Project is a governmental collaborative project between the Mayor’s office of Data Analytics and the Department of Information Technology and Telecommunications of New York. The Open Data Project provides three key sources of data. The first dataset provides census information on all New York City neighborhoods (New York City Planning, 2019). The second dataset provides data on all New York City legally operating businesses (Department of Consumer Affairs, 2020). The third dataset provides all New York City bike lanes (Department of Transportation, 2020). These datasets are all formatted to be used within GIS and had to be reformatted to be able to perform difference in differences analysis. 

#Data Collection and Cleaning
Due to data availability issues, data collection was locked in two ways. First, data collection was limited to the years of 2010 and 2018 as usable census data for control variables were limited to these years. This difference in differences model will then go on to use 2010 as the base year and 2018 as the non-base year. The selection of these two years has the benefit of also allowing neighborhoods to economically adjust to the new installation of bike lanes. Second, control variables were only available at the neighborhood level. This meant that the bike lane and new business data needed to be transformed to fit into a neighborhood based model.
I collected the primary four variables used in the following difference in differences analysis by using GIS. I first calculated the number of business applications in each New York City neighborhood for the year 2010, and repeated the same process for the year 2018. I next calculated the number of bike lanes in each neighborhood in 2010, and again for 2018. By Using ArcGIS, I had my primary four variables of interest at the neighborhood level, business applications in 2010 for each neighborhood, business applications in 2018 in each neighborhood, feet of bike lanes in 2010 in each neighborhood, and feet of bike lanes in 2018 in each neighborhood. Examples of how GIS was used to find these variables can be found below in figures 1 and 2. This process allowed me to create the panel data necessary for difference in difference modeling.
![Image of Bike Lanes](https://github.com/albertfrantz/Identifying-the-Relationship-Between-Bike-Lanes-and-New-Business-Creation/blob/master/figure1.JPG)
Figure 1. Map depicting bike lanes by neighborhood in 2018. Redlines represent bike lanes while black lines depict the neighborhood borders. Source: New York City DOT
![Image of Business Applications](https://github.com/albertfrantz/Identifying-the-Relationship-Between-Bike-Lanes-and-New-Business-Creation/blob/master/Figure%202.JPG)
Figure 2. Map depicting business applications in 2018 by neighborhood. Each point represents a business application in 2018. Lines separate New York City neighborhoods. Source : New York City DOT



