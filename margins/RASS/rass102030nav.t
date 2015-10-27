In order to determine the best angular separation radius to compare RASS to the maser and control list, increments of 10 arcseconds up to 70" were compared to one another. 10", 20" and 30" were the initial considerations, so the marginal objects found between 10"-20" were compared against those between 20-30" in the SDSS navigator. 

For 20-30" there were 13 matches. 10-20" has 47. The maser and control objects are always in the direct center of the galaxy, whereas BSC is always slightly off. Of those found in the navigator, most of the BSC results are either not associated with any object by the navigator or they are associated with a star (occasionally another galaxy) nearby to the galaxy. A few are associated with the same object as the maser or control object. For some, they both appear to target the same galaxy but there is no SDSS match anywhere near the image.

It was previously known, and is now made obvious, that the RASS catalog does not have a level of precision that can match the SDSS or the maser and control catalogs. Unfortunately, this hinders the relevance of the information extracted from the SDSS navigator. It has been shown that as radius increases, the number of random matches increases linearly[cite paper]. It would be expected from that study that as angular separate increases from zero it increases to a peak, then decreases gradually to a minimum, at which point it follows a nearly linear increase. The number of matches seen in the ranges tested are outlined below:
0-10"  115
10-20" 47
20-30" 13
30-40" 6
40-50" 2
50-60" 2
60-70" 1
These results suggest that the linear effect of random matches is very small, suggesting a high percentage of true matches throughout the comprehensive 0-70" range. Because of the small number of results from 40-70", it is difficult to examine any trend, and because of the wide separation, it is difficult to interpret them in the SDSS navigator. As such, these values should not be considered true matches. 0-10" encompasses the peak number of values, and 10-20" also has roughly 3.5 times as many values as 20-30" while 20-30" should have 1.5-2 times as many randoms, suggesting it has only 1/7 to 1/5 as many random selections as 20-30".

This narrows down the choice to deciding between 20", 30", or 40" as the edge of the range of angular separations to include. In order to favor accurate ratios over large numbers of results, the most conservative choice would be 20". Increasing to a radius of 30" from 20" would more than double the number of randoms while only increasing the total sample by 8%. However, based on just how low the number of matches decreases as radius continues to increase, it could be easy to justify including those from 20-30" by making a somewhat justified assumption that at most one or two of them are random matches.


IDL> y=[115,115,47,47,13,13,6,6,2,2,2,2,1,1]
IDL> x=[0,9.9,10,19.9,20,29.9,30,39.9,40,49.9,50,59.9,60,70]
IDL> plot,x,y


      	  	  BETWEEN 20" AND 30"
name        ra		dec		Navigator
m6 	 156.964 	-43.9039	NA
b6 	 156.9725 	-43.9075	NA
m3 	 77.082 	17.3634		void
b3	 77.08708 	17.35944	void
c109 	 170.062 	12.9917		large galaxy no id (center)
b109 	 170.0696 	12.98806	large galaxy no id (off center > 12")
c113 	 183.771 	33.1972		galaxy
b113 	 183.77792 	33.19153	star
c106 	 158.596 	73.7651		NA
b106 	 158.59624 	73.75708	NA
c144 	 321.939 	56.9425		NA
b144 	 321.94458 	56.93514	NA
c15 	 260.855 	36.5069		galaxy1
b15 	 260.84708 	36.50292	galaxy2
c56 	 32.3929 	52.4425		NA
b56 	 32.40334 	52.44597	NA
c5 	 211.586 	-16.6164	void
b5 	 211.58209 	-16.6225	void
c133 	 29.0876 	5.629		galaxy
b133 	 29.09417 	5.62667		star?
c95  	 28.1936 	36.1519		NA
b95 	 28.18625 	36.14861	NA
c27 	 234.686 	-3.38003	void
b27 	 234.68916 	-3.38597	void
c45 	 63.7195 	-7.92772	NA
b45 	 63.71583 	-7.9225		NA

      	  	  BETWEEN 10" AND 20"
name        ra		dec		Navigator
m14	    253.245	2.40083		galaxy1 bright center
b14	    253.24124	2.39806		galaxy2 off center from galaxy1
m4	    93.9013	71.0375		NA
b4	    93.89	71.03528	NA
m5	    148.968	69.6797		large galaxy no id near center
b5	    148.96001	69.68111	large galaxy no id near center
m10	    184.61	29.8129		galaxy nucleus
b10	    184.6125	29.81486	star? off galaxy center
m12	    202.47	47.1953		large galaxy center no id
b12	    202.47417	47.19528	large galaxy near center no id
c103	    148.888	69.0653		large galaxy near center no id
b103 	    148.89459	69.06055	large galaxy near center no id
c20	    247.16	39.5517		galaxy center
b20	    247.15707	39.54694	off galaxy center no id,  between above and star
c119	    20.7979	33.4606		galaxy center
b119	    20.80375	33.45917	off center no id
c17	    301.964	-11.1428	galaxy center
b17	    301.96832	-11.14556	outside galaxy and past another galaxy behind it
c108	    166.698	72.5686		void
b108	    166.68126	72.56861	void
c35	    79.8992	-32.6578	NA
b35	    79.90042	-32.65292	NA
c93	    339.194	-12.5451	NA
b93	    339.19708	-12.54125	NA
c100	    132.493	70.2995		NA
b100	    132.50583	70.30125	NA
c143	    195.998	53.7917		galaxy center
b143	    195.99458	53.79583	outside galaxy, star?
c19	    184.846	5.82531		large galaxy center
b19	    184.85042	5.82653		off center, star?
c101	    140.365	-11.9097	NA
b101	    140.36168	-11.90653	NA
c3	    93.2917	50.4412		NA
b3	    93.29083	50.44556	NA
c96	    41.5792	-30.275		NA
b96	    41.58334	-30.2775	NA
c128	    260.855	56.9744		galaxy center
b128	    260.85001	56.97778	off galaxy no id
c46	    88.1167	59.4756		NA
b46	    88.12292	59.47847	NA
c124	    232.825	7.45778		galaxy center
b124	    232.82582	7.45361		off center, star
c48	    343.524	-17.582		void
b48	    343.52792	-17.58097	void
c26	    278.759	32.6972		NA
b26	    278.76334	32.69597	NA
c34	    55.5142	-21.2445	NA
b34	    55.51583	-21.24111	NA
c11	    82.4813	44.5775		void
b11	    82.48042	44.58111	void
c107	    159.691	53.5034		large galaxy1 center
b107	    159.69458	53.50056	galaxy2 just off galaxy1 center
c22	    49.9504	41.5117		galaxy center no id
b22	    49.9475	41.51445	off galaxy center no id
c8	    345.199	-12.9186	NA
b8	    345.20041	-12.92181	NA
above is # from csc, below is # from topcat
c73	    104.909	54.1967		NA
b73	    104.91042	54.19333	NA
c54	    72.923	-3.80933	galaxy center
b54	    72.92625	-3.80944	galaxy off center same id
c132	    174.787	59.1986		star/galaxy
b132	    174.78624	59.20181	star/galaxy
c118	    246.855	42.6797		galaxy
b118	    246.85126	42.67805	off center, star
c121	    295.669	-10.3236	void
b121	    295.67209	-10.32458	void
c25	    171.036	6.21475		galaxy
b25	    171.03291	6.21556		off center, star
c36	    41.0121	-26.1864	NA
b36	    41.01042	-26.18361	NA
C86	    219.092	58.7942		galaxy center
B86	    219.0925	58.79736	off center, star
C98	    149.983	13.0438		galaxy center
B98	    149.98083	13.04611	off center, star
C26	    169.469	29.3045		galaxy center
B26	    169.46541	29.30445	galaxy edge no id
C135	    259.81	48.9803		NA
B135	    259.81375	48.97847	NA
C146	    21.3811	32.1365		galaxy center
B146	    21.38083	32.13347	off center, star
C39	    43.9675	9.312		NA
B39	    43.96833	9.31472		NA
C71	    1.58137	20.2029		galaxy center
B71	    1.57875	20.20431	galaxy edge, star
C6	    339.233	-22.2208	NA
B6	    339.23541	-22.2225	NA
C137	    340.071	8.05389		galaxy center
B137	    340.07376	8.05444		off center, star