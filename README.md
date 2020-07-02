# Identifying-the-Relationship-Between-Bike-Lanes-and-New-Business-Creation
By using a difference in difference model, this study investigates how the installation of bike lanes affects new business creation in New York City for the years 2010 and 2018. In carrying out this research, the results can help square the discussion of how bike infrastructure affects business health. Additionally, this research can assist cities in better deciding where to target new bike lane creation, as cities continue to solve congestion-related issues.

# Data Sources
Data comes from the city of New York Open Data Project. The New York City Open Data Project is a governmental collaborative project between the Mayor’s office of Data Analytics and the Department of Information Technology and Telecommunications of New York. The Open Data Project provides three key sources of data. The first dataset provides census information on all New York City neighborhoods (New York City Planning, 2019). The second dataset provides data on all New York City legally operating businesses (Department of Consumer Affairs, 2020). The third dataset provides all New York City bike lanes (Department of Transportation, 2020). These datasets are all formatted to be used within GIS and had to be reformatted to be able to perform difference in differences analysis. 

# Data Collection and Cleaning
Due to data availability issues, data collection was locked in two ways. First, data collection was limited to the years of 2010 and 2018 as usable census data for control variables were limited to these years. This difference in differences model will then go on to use 2010 as the base year and 2018 as the non-base year. The selection of these two years has the benefit of also allowing neighborhoods to economically adjust to the new installation of bike lanes. Second, control variables were only available at the neighborhood level. This meant that the bike lane and new business data needed to be transformed to fit into a neighborhood based model.
I collected the primary four variables used in the following difference in differences analysis by using GIS. I first calculated the number of business applications in each New York City neighborhood for the year 2010, and repeated the same process for the year 2018. I next calculated the number of bike lanes in each neighborhood in 2010, and again for 2018. By Using ArcGIS, I had my primary four variables of interest at the neighborhood level, business applications in 2010 for each neighborhood, business applications in 2018 in each neighborhood, feet of bike lanes in 2010 in each neighborhood, and feet of bike lanes in 2018 in each neighborhood. Examples of how GIS was used to find these variables can be found below in figures 1 and 2. This process allowed me to create the panel data necessary for difference in difference modeling.

![Image of Bike Lanes](https://github.com/albertfrantz/Identifying-the-Relationship-Between-Bike-Lanes-and-New-Business-Creation/blob/master/figure1.JPG)

Figure 1. Map depicting bike lanes by neighborhood in 2018. Redlines represent bike lanes while black lines depict the neighborhood borders. Source: New York City DOT

![Image of Business Applications](https://github.com/albertfrantz/Identifying-the-Relationship-Between-Bike-Lanes-and-New-Business-Creation/blob/master/Figure%202.JPG)

Figure 2. Map depicting business applications in 2018 by neighborhood. Each point represents a business application in 2018. Lines separate New York City neighborhoods. Source : New York City DOT

The difference in differences model allowed me to control for fixed effects in each neighborhood, but I still needed to control for things that changed over time in each neighborhood that would also affect new business creation. To control for these neighborhood changes, I used New York City census data in each neighborhood provided by New York City Planning. I chose six variables to control for. I controlled for neighborhood population, gender distribution, age, education, unemployment, and income all of which may affect new business applications. 

I assumed that the built environment in each location would not face any drastic changes in these eight years. For this reason, the built environment is assumed to be relatively constant in each neighborhood between 2010 and 2018. An example of how the data was organized can be found in table 1 below.

Table 1. Data Organization

Year | Y18 | Neighborhood | TotalBusinessApps | TotalBikeLanes | TotalPop | FemalePct | MediandAge | BachDgrPct | UnemPct | MeanHIncome
---- | --- | ------------ | ----------------- | -------------- | -------- | --------- | ---------- | ---------- | ------- | -----------
2010 | 0 | Gravesend | 27 | 9837.701 | 27105 | 54.1 | 45.4 | 22.1 | 4.4 | 61342
2018 | 1 | Gravesend | 45 | 10354.636 | 30587 | 52.9 | 41.7 | 33.7 | 5.9 | 68025

Total bike lanes are measured in feet. Total population is measured in people. FemalePct is a percentage. MedianAge is measured in years. BachDgrPct is a percentage. UnemPct is a percentage. MeanHIncome is measured in dollars.

# Modeling and Variable Description
To estimate the change in business applications from newly installed bike lanes I will compare the number of business applications and bike lanes in the same neighborhoods while controlling for time variable changes in each neighborhood. 
A difference in differences model will be used to identify the impact that bike lanes had on the number of new business applications in New York City. Additionally, I will be using neighborhoods as a fixed effect. The complete difference in differences model can be found below.
![Difference in Difference Model](https://github.com/albertfrantz/Identifying-the-Relationship-Between-Bike-Lanes-and-New-Business-Creation/blob/master/model.JPG)

Using this model, I will be able to see how business applications changed in each neighborhood from the installation of new bike lanes alone. The difference in differences model controls for neighborhood factors affecting new business creation that do not change over time. Additionally, the control variables I chose will control for neighborhood factors affecting new business applications that do change over time. This modeling method should result in far less omitted variable bias compared to a simple linear regression. 

A brief explanation of each variable can be found below. Year is the year of the observation. Neighborhood is the neighborhood the observation is taken from.TotalBikeLanes is the length of bike lanes measured in feet.TotalPop is the neighborhood population for the given year. FemalePct is the percentage of people who identify as female in a neighborhood. BachDgrPct is the percentage of the population that holds a bachelor degree or higher in the neighborhood. UnemPct is the unemployment percentage in the neighborhood. Finally, MeanHIncome is the mean household income. Descriptive Statistics can be found below in table 2.

Table 2. Variable Descriptive Statistics
![Desriptive Statistics](https://github.com/albertfrantz/Identifying-the-Relationship-Between-Bike-Lanes-and-New-Business-Creation/blob/master/descriptiveStats.JPG)
N is the number of observations. Mean is the mean value of the variable. Min is the minimum value of the observation. Max is the maximum value of the observation.

# Adjusting for Multicollinearity and Robustness
Due to the wide range of control variables needed, there are potential issues of multicollinearity. Originally, more variables were included, but after testing for multicollinearity using the variance inflation factor, many were removed. Those variables featuring variance inflation factors above 10 were removed as this indicates a problematic amount of collinearity. The variance inflation factor for the remaining control variables that were used can be found in table 3. Finally, robustness was also used to detect and adjust for heteroskedasticity.

    | Y18 | TotalBikeLanes | Y18 * TotalBikeLanes | TotalPop | FemalePct | MediandAge | BachDgrPct | UnemPct | MeanHIncome
--- |--- | -------------- | -------------------- | -------- | --------- | ---------- | ---------- | ------- | -----------
VIF | 2.3 | 3.7 | 5.2 | 1.2 | 1.1 | 1.5 | 4.3 | 1.8 | 4.0 |








