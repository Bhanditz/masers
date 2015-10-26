# Masers
This repository includes files used in research leading to the AAS presentation: _A Statistical Investigation of the Connection between X-ray and Water Maser Emission in Galaxy Centers_. The abstract for this presentation is available at Harvard's SAO/NASA ADS database: http://adsabs.harvard.edu/abs/2014AAS...22325109N

I am making my work available in order to assist my former research group and promote scientific progress.

## Organization
These are my personal files in exactly the condition I had them during my undergraduate research. There is a lot of redundancy, and files may be named confusingly because it was my personal work in progress containing many drafts and slightly varied iterations of certain concepts and data sets. There is a lot of work here that has not been perfected because it was a quick solution for a specific task. If I were to return to this research now as a better coder, I would make a lot of changes. I'll leave that to you.

You will find several files with ".t" or ".tt" file extensions. These are essentially ".txt" files that I named differently in order to customize my text editor's syntax recognition. Your best bet would be to look over notes2.tt which provides information about most of the files within this repository. The one new file I created this year (2015) is pull-mcp.sh, which is the best way I came up with of creating an appropriately formatted local table of detected masers. The script automatically downloads the table from the MCP website.

## Key Topics
* Data analysis of large data sets; manipulating large tables.
* Querying and cross-matching astrophysical detections in various catalogs against each other based on position. Determining the ideal angular radius for particular surveys/telescopes (described in newpaper.pdf).
* Determining X-ray luminosities of large tables of data based on flux and luminosity distance.
* Comparing X-ray fluxes and luminosities between maser and non-maser groups at various energies.
* Simulating column density using PIMMS. Code that automatically generates PIMMS scripts to analyze large data sets.
* Monte carlo simulations of obscured X-ray luminosities at various energies for maser and non-maser groups.
