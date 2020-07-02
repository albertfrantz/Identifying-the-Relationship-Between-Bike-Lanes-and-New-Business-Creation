# Bikes and Business: Identifying the Relationship Between Bike Lanes and New Business Creation in NYC
By using a difference in differences model, this study investigates how the installation of bike lanes affects new business creation in New York City for the years 2010 and 2018. In carrying out this research, the results can help square the discussion of how bike infrastructure affects business health. Additionally, this research can assist cities in better deciding where to target new bike lane creation, as cities continue to solve congestion-related issues.

# Data Sources
Data comes from the city of [New York Open Data Project](https://opendata.cityofnewyork.us/projects/). The New York City Open Data Project is a governmental collaborative project between the Mayor’s office of Data Analytics and the Department of Information Technology and Telecommunications of New York. The Open Data Project provides three key sources of data. The first dataset provides census information on all New York City neighborhoods ([New York City Planning, 2019](https://popfactfinder.planning.nyc.gov/#12.25/40.724/-73.9868)). The second dataset provides data on all New York City legally operating businesses ([Department of Consumer Affairs, 2020](https://data.cityofnewyork.us/Business/License-Applications/ptev-4hud)). The third dataset provides all New York City bike lanes ([Department of Transportation, 2020](https://data.cityofnewyork.us/Transportation/Bicycle-Routes/7vsa-caz7)). These datasets are all formatted to be used within GIS and had to be reformatted to be able to perform difference in differences analysis. 

# Data Collection and Cleaning
Due to data availability issues, data collection was locked in two ways. First, data collection was limited to the years of 2010 and 2018 as usable census data for control variables were limited to these years. This difference in differences model will then go on to use 2010 as the base year and 2018 as the non-base year. The selection of these two years has the benefit of also allowing neighborhoods to economically adjust to the new installation of bike lanes. Second, control variables were only available at the neighborhood level. This meant that the bike lane and new business data needed to be transformed to fit into a neighborhood-based model.

I collected the primary four variables used in the following difference in differences analysis by using GIS. I first calculated the number of business applications with an approved status in each New York City neighborhood for the year 2010 and repeated the same process for the year 2018. I next calculated the number of bike lanes in each neighborhood in 2010, and again for 2018. By Using ArcGIS, I had my primary four variables of interest at the neighborhood level, business applications in 2010 for each neighborhood, business applications in 2018 in each neighborhood, feet of bike lanes in 2010 in each neighborhood, and feet of bike lanes in 2018 in each neighborhood. Examples of how GIS was used to find these variables can be found below in figures 1 and 2. This process allowed me to create the panel data necessary for the difference in differences modeling.

Figure 1. Neighborhood Bike Lanes

![Image of Bike Lanes](https://github.com/albertfrantz/Identifying-the-Relationship-Between-Bike-Lanes-and-New-Business-Creation/blob/master/figure1.JPG)

Map depicting bike lanes by neighborhood in 2018. Redlines represent bike lanes while black lines depict the neighborhood borders. Source: [Department of Transportation, 2020](https://data.cityofnewyork.us/Transportation/Bicycle-Routes/7vsa-caz7)

Figure 2. Neighborhood Business Applications

![Image of Business Applications](https://github.com/albertfrantz/Identifying-the-Relationship-Between-Bike-Lanes-and-New-Business-Creation/blob/master/Figure%202.JPG)

Map depicting business applications in 2018 by neighborhood. Each point represents a business application in 2018. Lines separate New York City neighborhoods. Source : [Department of Consumer Affairs, 2020](https://data.cityofnewyork.us/Business/License-Applications/ptev-4hud)

The difference in differences model allowed me to control for fixed effects in each neighborhood, but I still needed to control for things that changed over time in each neighborhood that would also affect new business creation. To control for these neighborhood changes, I used New York City census data in each neighborhood provided by New York City Planning. I chose six variables to control for. I controlled for neighborhood population, gender distribution, age, education, unemployment, and income all of which may affect new business applications. 

I assumed that the built environment in each location would not face any drastic changes in these eight years. For this reason, the built environment is assumed to be relatively constant in each neighborhood between 2010 and 2018. An example of how the data was organized can be found in table 1 below.

Table 1. Data Organization

Year | Y18 | Neighborhood | TotalBusinessApps | TotalBikeLanes | TotalPop | FemalePct | MediandAge | BachDgrPct | UnemPct | MeanHIncome
---- | --- | ------------ | ----------------- | -------------- | -------- | --------- | ---------- | ---------- | ------- | -----------
2010 | 0 | Gravesend | 27 | 9837.701 | 27105 | 54.1 | 45.4 | 22.1 | 4.4 | 61342
2018 | 1 | Gravesend | 45 | 10354.636 | 30587 | 52.9 | 41.7 | 33.7 | 5.9 | 68025

Total bike lanes are measured in feet. Total population is measured in people. FemalePct is a percentage. MedianAge is measured in years. BachDgrPct is a percentage. UnemPct is a percentage. MeanHIncome is measured in dollars.

# Modeling and Variable Description
To estimate the change in business applications from newly installed bike lanes I will compare the number of business applications and bike lanes in the same neighborhoods while controlling for time-variable changes in each neighborhood. 

A difference in differences model will be used to identify the impact that bike lanes had on the number of new business applications in New York City. Additionally, I will be using neighborhoods as a fixed effect. The complete difference in differences model can be found below.

# Model
Model 1. Difference in Differences

![Difference in Difference Model](https://github.com/albertfrantz/Identifying-the-Relationship-Between-Bike-Lanes-and-New-Business-Creation/blob/master/model.JPG)

This is a difference in differences model assessing the impact of bike lanes on new business applications. The base year is 2010 and the non-base year is 2018. This model has six control variables.

# Model Description

Using this model, I will be able to see how business applications changed in each neighborhood from the installation of new bike lanes alone. The difference in differences model controls for neighborhood factors affecting new business creation that do not change over time. Additionally, the control variables I chose will control for neighborhood factors affecting new business applications that do change over time. This modeling method should result in far less omitted variable bias compared to a simple linear regression. 

A brief explanation of each variable can be found below. Year is the year of the observation. Neighborhood is the neighborhood the observation is taken from.TotalBikeLanes is the length of bike lanes measured in feet.TotalPop is the neighborhood population for the given year. FemalePct is the percentage of people who identify as female in a neighborhood. BachDgrPct is the percentage of the population that holds a bachelor's degree or higher in the neighborhood. UnemPct is the unemployment percentage in the neighborhood. Finally, MeanHIncome is the mean household income. Descriptive Statistics can be found below in table 2.

Table 2. Variable Descriptive Statistics
![Desriptive Statistics](https://github.com/albertfrantz/Identifying-the-Relationship-Between-Bike-Lanes-and-New-Business-Creation/blob/master/descriptiveStats.JPG)
N is the number of observations. Mean is the mean value of the variable. Min is the minimum value of the observation. Max is the maximum value of the observation.

# Adjusting for Multicollinearity and Robustness
Due to the wide range of control variables needed, there are potential issues of multicollinearity. Originally, more variables were included, but after testing for multicollinearity using the variance inflation factor, many were removed. Those variables featuring variance inflation factors above 10 were removed as this indicates a problematic amount of collinearity. The variance inflation factor for the remaining control variables that were used can be found in table 3. Finally, robustness was also used to detect and adjust for heteroskedasticity.

Table 3. Variable Variation Inflation Factors
Y18 | TotalBikeLanes | Y18 * TotalBikeLanes | TotalPop | FemalePct | MediandAge | BachDgrPct | UnemPct | MeanHIncome
--- | -------------- | -------------------- | -------- | --------- | ---------- | ---------- | ------- | -----------
2.3 | 3.7 | 5.2 | 1.2 | 1.1 | 1.5 | 4.3 | 1.8 | 4.0 |

# Results
The reported results of running the difference in differences model with six control variables can be found in table 4. 

Table 4 Regression Results of the difference in difference model

![Regression Results](https://github.com/albertfrantz/Identifying-the-Relationship-Between-Bike-Lanes-and-New-Business-Creation/blob/master/results.JPG)

All variables but bike lanes were found to be significant at the 10% level. The most important determinants in new business creation in New York City appear to be population and the percentage of females.

Looking at the regression results, total population is found to be the most important factor in predicting the number of business applications in a given New York City neighborhood. The model predicts that for every 1,000 additional people in a New York City neighborhood, business applications in that respective neighborhood will increase by .72, in the given year. This is a reasonably large increase considering that the mean average number of business applications for New York City neighborhoods was 43.6 for 2010 and 2018. This result is highly significant (p value: < 2e-16). Business applications increasing as the population grows lines up with intuition. It would make sense that as a population grows more businesses are created because more businesses will be needed to support that neighborhood.
	
The model also finds that the percentage of females in a New York City neighborhood is highly significant in predicting the number of business applications (p value: 2.40e-11). Looking at table 4 we can see a negative relationship between the female percentage and the number of business applications. Unfortunately, this result lines up with previous research that has found that women tend to start their own companies at a lower rate than men. Worldwide it has been found that 6.2% of women owned business while 9.5% of men owned businesses. More locally in the United States, 42% of all businesses are owned by women while 58% are owned by men ([Global Entrepreneurship Monitor, 2016](https://www.gemconsortium.org/report/gem-2016-2017-global-report)). Fortunately, this gap is continuing to narrow as women gain greater access to the market. My results line up with this literature in that it finds that a 1% increase in the percentage of females in a given neighborhood is associated with a drop in business applications by 3.38. 

The unemployment rate for a given neighborhood was also significant in determining the number of new businesses (p value: .0183). The model found that as unemployment increases so does new business creation. Intuitively, this result also makes sense. As people become more desperate for work they may become increasingly inclined to start their own business. If an individual has reduced faith in finding a job he or she may instead decide it is best to start a business. More specifically, the model found that for every percent increase in the unemployment rate total business applications for the given year also increase by 1.81. 

Bachelor's degree or higher was almost significant at the 5% level (p value: .0597). Looking at this result, once again found in table 4, we can see that as education increased in New York City neighborhoods so too did business applications. We found that for every percent increase in the neighborhood population that held a bachelor's degree or higher, the number of business applications increased by .202. This result seems to counteract previous research that has found that college graduates are less likely to start a new business. Research outside of the United States, in England, has found that only 4.7% of recent graduates are self-employed compared to the 8.7% of the general population ([HESA, 2017](https://www.hesa.ac.uk/news/20-07-2017/graduates-employment)). 

The results found using this difference in differences model could come about for two reasons. First, this study looked at the United States rather than England. Second, this study only looked at recent graduates. Recent graduates might start off seeking standard employment and later in life transition to self-employment. For these reasons, the effect of education on entrepreneurial activities needs more research, especially in New York City.

Mean household income was found to be significant at the 10% level (p value: .0764). This result found that as mean household income in a specific neighborhood increased so too did the number of new businesses. As income increases by $10,000 the number of business applications increases by 1.162. As people have more access to capital they may be more inclined to take risks and start new businesses. Wealthier individuals may also have a better safety net in case their new business fails and so they may be more inclined to take the risk of starting a new business. The results found in this analysis line up with such an assessment. 

Finally, for the last of the significant results we find that the median population age of a New York City neighborhood is significant at determining the number of business applications at the 10% level (p value: .0781). We find that as age increases the number of business applications decreases. As average neighborhood population age increases by .1 years, the number of business applications decreases by .506. Perhaps younger people are more likely to take risks and therefore are more interested in starting a new business. 

Although these variables all provide interesting insights into what factors may play important roles in new business creation the number of bike lanes was found to be non-significant (p value: .3282). The difference in differences model used in this analysis found that the number of bike lanes did not significantly impact new business creation. There could be several for this result. Perhaps bike lanes are yet to be widely utilized enough to promote new business creation. Alternatively, bike lanes may not be important in the determination of new business creation. Individuals may pay less attention to the built environment when creating a new business then may have been anticipated. This result does not mean that bike lanes do not have their use, however, it does appear that bike lanes do not influence new business creation to a significant level in New York City. 

Looking at the overall model it appears that the selection of control variables provides a reasonably accurate look into some of the most powerful factors affecting new business creation in New York City. This difference in differences model has an adjusted r-squared of .495 meaning that 49.5% of the variation in mean business applications is captured by the model. This adjusted r-squared shows a relatively strong level of correlation. 

# Limitations
The major limitation of this model is including proper control variables. The factors contributing to new business creation are perhaps endless, so properly controlling for new business creation becomes a near-impossible task.

Additionally, the model does not demonstrate diminishing returns. As the population of a neighborhood grows, the model finds that more business applications would be created. As the population of a neighborhood grows, however, new business applications should continue to increase, but at a decreasing rate. The issue of diminishing returns is present in many of the variables used in this model. To better model the relationship between bike lanes and new business creation diminishing returns would have to be accounted for.

This model also assumes that individuals live in the same neighborhood that they are inclined to start a new business in. When looking at the controls of female percentage, median age, education, unemployment, and income the model assumes that new business creation is pursued by the people living in those neighborhoods. Although individuals may be inclined to start a business near their home, there are a whole host of reasons they may choose to start a business outside of their home neighborhood. One of those reasons is rent, where individuals may choose to start a business outside of their neighborhood where rent is lower. Unfortunately, properly controlling for this would require a connection between new business creation, and the owner’s housing location. This data is not publicly available.

Finally, the model only accounts for new physical business creation, leaving out the potential for online businesses. As e-commerce grows, physical store locations will become increasingly less important in judging the economic health of a city. Bike lanes are less likely to influence e-commerce as opposed to physical locations. This is because e-commerce is less likely to be affected by the built environment. Accounting for online business creation may have significantly altered the results, likely making bike lanes even less influential in overall new business creation.

# Policy Implications
This analysis found that bike lanes did not have a significant impact on new business creation. Looking at this result from a policy standpoint it is clear that there are better ways to promote entrepreneurship than bike lanes. Bike lanes have seemingly been installed mostly for transportation related purposes. That being said, understanding the impact of bike lanes beyond transportation is important for city planners in determining the location of future bike infrastructure.

Although bike lanes do not appear to impact new business creation, that does not mean they do not serve a purpose. Bike lanes still have the potential to greatly reduce the impacts that come along with urbanization. Two of those most obvious impacts are pollution and commuter congestion. Because bike lanes do not appear to affect new business creation, their placement should still largely be determined by areas experiencing high levels of commuter suggestion

Bike lanes may not promote new business creation where they are installed, however, they likely have important impacts outside of transportation alone. Additional research needs to be done to see how bike lanes affect the local communities in where they are installed. As more studies on this subject begin to be published, city planners can get a better idea of where to prioritize the installation of bike lanes. By learning more about the ulterior effects of bike lanes, city planners can target areas that may most greatly benefit from their installation. 
