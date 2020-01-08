# PRB-project
This is the data analysis of population genetics for PRB project

## 1 - Map for PRB sampling

Arcgis-Arcmap

Add data--load China.shp

Arcgis--c:/--Deaktop--ArcGlobeData--contient.lyr

Add data--load excel file including longitude and latitude of sampling sites

In the Table of Contents--right click excel file Sheet--Display XY data--define X and Y as longitude and latitude, respectively. 


## 2 - SAMOVA

http://cmpg.unibe.ch/software/samova2/

### Inputfile:

Inputfile.arp

Inputfile.geo

Using the command line: **samova2_console.exe**

SAMOVA (spatial analysis of molecular variance) v. 2.0 (Dupanloup et al., 2002) was used to define the genetic structure of PRB populations with K values ranging from 2 to 10 and 100 independent simulated annealing processes. The most supported number of groups (K) was determined by repeating and selecting the subdivision scheme associated with the highest FCT, fixation index between groups or components. 

## 3 - SplitsTree

Haplotypes relationships were tested by SPLITSTREE v. 4.14.6 (Huson & Bryant, 2005) with the Neighbor-Net method under a distance model of Kimura-2-parameter (K2P). 

## 4 - DAPC (Discriminant analysis of principal components )

http://adegenet.r-forge.r-project.org/files/tutorial-dapc.pdf

Discriminant analysis of principal components (DAPC) was used to investigate genetic structure across the PRB populations. DAPC was performed with the R package ADEGENET (Jombart, 2008) in the R environment. The R scripts can be found in **DAPC-commands-PRB.R.** Importantly, DAPC does not require a biological hypothesis and acts as a complement to STRUCTURE analysis, which considers HWE and linkage equilibrium in its own algorithm. 

## 5 - Redundancy analysis (RDA)




