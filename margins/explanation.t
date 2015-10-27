In order to determine the best angular separation radius for the Chandra Source Catalog (CSC) and the ROSAT All Sky Survey (RASS), numerous comparative crossmatches were compared against the combination of both the control list and the list of all maser detections. The RASS Bright Source Catalog (RBSC) was matched at 10 arcseconds to 70" in increments of 10" and a histogram was formed. The same was done for CSC from 1" to 7" in incremends of 1".

RASS has previously been compared to the TYCHO catalog (precision of 1") in a similar manner (voges 2000 ap7 jp359). The number of mismatches has been shown by this study as well as (parejko) to be a linear relationship of random matches. Voges' findings showed that above 40", no reliable matches can be found. Their results indicated that 90% of RBSC sources are found within 25".

The RBSC histogram formed here from crossmatching against all maser detections and non-detections showed a high incidence of matches until 10" at 115, with 47 matches between 10" and 20". This accounts for 87% of all detections found until 70". From 20" to 30", there were 13 more matches which brings it up by 7% to 94% of all matches. 

While there is not enough data to calculate that actual number of mismatches within each range or the percentage of total matches that are mismatches, if the number of mismatches is assumed to increase linearly, it is possible to make comparable calculations. The ratio of angular separation to total number of matches changes between each range. Because angular separation increases proportionally with number of mismatches, the factor by which that ratio changes is the same as the factor by which the percent of mismatches increases. This has been labelled the Percentage Increase Factor (PIF) value. The following formula was used. It results in a curve that represents the derivative of the percentage of mismatches per margin.

theta = current peak angular separation
phi = previous peak angular separation
c1 = count within this margin
c0 = count within previous margin

PIF = (theta/c1)/(phi/c0)
simplifies to:
PIF = (theta*c0)/(phi*c1)

Graphing these results for each angular separation shows that these values peak somewhere between 20" and 30", presumably near 25". The peak of the PFI function represents the highest rate of change in the percent of mismatches, an inflexion point on the curve of the percent of randoms per margin. Until this point, true matches have a significantly higher impact on the number of matches in each range. After this point, the rate of increase in percentage begins to approach the constant number representing the slope of the linear relationship. As such, everything after the peak represents a shift in influence where random mismatches become much more relevant. Based on this peak around 25", the similar curve represented by Voges' data, and their suggestion that 90% of true matches are within 25" (very similar to our results), 25" has been chosen as the ideal angular separation radius to include data up to.

For CSC, a similar histogram was formed for ranges a factor of ten smaller. A similar curve was seen, however the 1" to 2" range consisted of proportionally many more results than the 10" to 20" range seen on the RBSC histogram. This suggests a slightly broader (scaled by ten) curve. PIF values were also calculated and graphed in the same manner as done for RBSC. The peak PIF value for CSC can be seen to be at or very close to 3". Because of the lack of enough data to analyze in the manner done by Voges or Parejko, and that this PIF distinction has been shown to be very agreeable with other data for RASS, it was also selected to represent the CSC's precision in this circumstance. The CSC crossmatch radius has been chosen to be 3", which includes 89% of all CSC matches within 7".


voges: http://adsabs.harvard.edu/abs/1999A%26A...349..389V
parejko: http://adsabs.harvard.edu/abs/2008AJ....135...10P
