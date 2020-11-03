## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "R>"
)

## -----------------------------------------------------------------------------
library(LAWBL)
dat <- sim24ccfa21$dat
head(dat)
J <- ncol(dat) # no. of items
qlam <- sim24ccfa21$qlam
qlam
K <- ncol(qlam) # no. of factors


## ----eval=FALSE---------------------------------------------------------------
#  ipf <- 8
#  Q<-matrix(-1,J,K-1); # -1 for unspecified items
#  Q[1:8,1]<-Q[9:16,2]<-Q[17:24,3]<-1
#  Q
#  m0<-pcirm(dat = dat,Q=  Q,LD = TRUE,cati = -1,burn = 2000,iter = 2000,verbose = TRUE)
#  summary(m0)
#  summary(m0, what = 'qlambda')
#  summary(m0, what = 'offpsx') #summarize significant LD terms
#  summary(m0,what='int')
#  summary(m0,what='eigen')
#  
#  #plotting factorial eigenvalue
#  plot_eigen(m0) # trace
#  plot_eigen(m0, what='density') #density
#  plot_eigen(m0, what='APSR') #adj, PSRF

## ----eval=FALSE---------------------------------------------------------------
#  Q<-cbind(Q,-1);
#  Q[c(15:16),K] <- 1
#  
#  m1<-pcirm(dat = dat,Q=  Q,LD = FALSE, cati = -1,burn = 4000,iter = 4000,verbose = TRUE)
#  summary(m1)
#  summary(m1, what = 'qlambda') #close to qlam

## ----eval=FALSE---------------------------------------------------------------
#  tmp<-summary(m1, what="qlambda")
#  Q<-matrix(-1,J,K)
#  Q[tmp!=0]<-1
#  Q
#  
#  m2<-pcirm(dat = dat,Q=  Q,LD = TRUE,cati = -1,burn = 4000,iter = 4000,verbose = TRUE)
#  summary(m2)
#  summary(m2, what = 'qlambda')
#  summary(m2, what = 'offpsx') #summarize significant LD terms
#  summary(m2,what='int')
#  summary(m2,what='eigen')
#  
#  #plotting factorial eigenvalue
#  plot_eigen(m2) # trace
#  plot_eigen(m2, what='density') #density
#  plot_eigen(m2, what='APSR') #adj, PSRF

