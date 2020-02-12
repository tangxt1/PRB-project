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

Edit--Selected the label nodes--View--Format Nodes, so that change the node format(shape, color...). 

## 4 - DAPC (Discriminant analysis of principal components )

http://adegenet.r-forge.r-project.org/files/tutorial-dapc.pdf

Discriminant analysis of principal components (DAPC) was used to investigate genetic structure across the PRB populations. DAPC was performed with the R package ADEGENET (Jombart, 2008) in the R environment. The R scripts can be found in **DAPC-commands-PRB.R.** Importantly, DAPC does not require a biological hypothesis and acts as a complement to STRUCTURE analysis, which considers HWE and linkage equilibrium in its own algorithm. 

## 5 - STRUCTURE

STRUCTURE v. 2.3.3 (Falush et al., 2003; Pritchard et al., 2000) was used to determine a reasonable number of partitions (K) for the studied populations. Clustering results were then visualized by CLUMPAK (http://clumpak.tau.ac.il/index.html). In this analysis, we specified an initial range of potential genotype clusters (K) from 1 to 10 under the admixed model with the assumption of correlated allele frequencies among populations. For each K value, ten runs were performed with 1,000,000 iterations discarded as ‘burn-in’, followed by an additional 10 million iterations. The most probable number of K values in the data was detected by comparing the log probability of the data [LnP (D)] for K values among all ten runs and by examining the standardized second-order change of LnP (D) and ΔK (Evanno et al., 2005).

Structure Harvester: http://taylor0.biology.ucla.edu/structureHarvester/

CLUMPAK: http://clumpak.tau.ac.il/index.html

## 6 - DIYABC

## 7 - Redundancy analysis (RDA)




