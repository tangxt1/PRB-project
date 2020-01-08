library("adegenet")
################DAPC##############
PRBSSR <- read.genepop("DAPC.gen",ncode = 3L)
sites <- read.table("sites.txt", header=FALSE)
cluster <- find.clusters(PRBSSR, n.clust=NULL,                                                                        
                         max.n.clust=20,                                                                                      
                         stat=c("BIC"),                                                                                       
                         n.iter=1e9, n.start=1e3,                                                                  
                         scale=FALSE,                                                                                         
                         truenames=TRUE)
numberofcluster = 2
myCol = rainbow(numberofcluster)
pdf(file="dapc.a-score-optimisation.pdf") 
temp <- optim.a.score(dapc(PRBSSR, pop=cluster$grp, n.pca=60, n.da=numberofcluster),                                           
                      n.pca=10:80, smart=TRUE, n=50, n.sim=1e3, n.da=numberofcluster,                                                 
                      plot=TRUE) 
dev.off() 
temp$best 

dapc.cluster <- dapc(PRBSSR, pop=cluster$grp, n.pca=temp$best, n.da=numberofcluster)


pdf(file="dapc.cluster.table.pdf")                                                                                            
table.value(table(pop(PRBSSR), cluster$grp), col.lab=paste("Cluster", 1:numberofcluster))                                 
dev.off() 

pdf(file="dapc.cluster.description1.pdf")                                                                                     
scatter(dapc.cluster, posi.da="bottomright", posi.pca="bottomleft", scree.pca=TRUE, bg="white", pch=17:22)                    
dev.off() 

pdf(file="dapc.cluster.description2.pdf")                                                                                     
scatter(dapc.cluster, posi.da="bottomright", posi.pca="bottomleft", bg="white", scree.pca=TRUE, pch=17:22, cstar=0, col=myCol)
dev.off()                                                                                                                     

###
pdf(file="dapc.cluster.description3.pdf")                                                                                     
scatter(dapc.cluster, ratio.pca=0.3, bg="white", pch=20, cell=0,                                                              
        cstar=0, col=myCol, solid=.4, cex=3, clab=0,                                                                          
        mstree=TRUE, scree.da=TRUE,                                                                                           
        posi.da="bottomright", posi.pca="bottomleft",                                                                         
        leg=TRUE, txt.leg=paste("Cluster",1:numberofcluster))                                                                 
par(xpd=TRUE)                                                                                                                 
points(dapc.cluster$grp.coord[,1], dapc.cluster$grp.coord[,2], pch=4,                                                         
       cex=3, lwd=8, col="black")                                                                                             
points(dapc.cluster$grp.coord[,1], dapc.cluster$grp.coord[,2], pch=4,                                                         
       cex=3, lwd=2, col=myCol)                                                                                               
myInset <- function(){                                                                                                        
  temp <- dapc.cluster$pca.eig                                                                                                
  temp <- 100* cumsum(temp)/sum(temp)                                                                                         
  plot(temp, col=rep(c("black","lightgrey"),                                                                                  
                     c(dapc.cluster$n.pca,1000)), ylim=c(0,100),                                                              
       xlab="PCA axis", ylab="Cumulated variance (%)",                                                                        
       cex=1, pch=20, type="h", lwd=2)                                                                                        
}                                                                                                                             
add.scatter(myInset(), posi="bottomright",                                                                                    
            inset=c(-0.03,-0.01), ratio=.28,                                                                                  
            bg=transp("white"))                                                                                               
dev.off()                              

dapc.sites <- dapc(PRBSSR, pop=sites$grp, n.da=numberofcluster, n.pca=60) # temp$best from a-score                       

###
pdf(file="dapc.sites.assignplot.pdf")                                                                                         
assignplot(dapc.sites,cex.lab=.75,pch=3) 
compoplot(dapc.sites)
dev.off()                                                                                                                     

###
pdf(file="dapc.sites.assignscatter.pdf")                                                                                      
scatter(dapc.sites,cstar=0,
        # mstree=TRUE,                                                                                                          
        # posi.da="bottomright", posi.pca="bottomleft", scree.pca=TRUE,                                                         
        scree.da=F,                                                                                                       
        pch=20,                                                                                                   
        leg=T,posi.leg = "topleft",                                                                                                             
        # vcol=seasun(32),                                                                                                       
        clab=0, # population names in the circle                                                                              
        ratio.pca=0.3, solid=.8, cex=2) 
dev.off() 

dapc.sites
dapc.sites$ind.coord
dapc.sites$prior
dapc.sites$assign
dapc.sites$pca.cent
dapc.sites$var.contr
dapc.sites$posterior
