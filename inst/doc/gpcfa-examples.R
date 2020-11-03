## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "R>"
)

## -----------------------------------------------------------------------------
library(LAWBL)
dat <- sim18ccfa40$dat
dim(dat)
summary(dat) #10% missingness at random
J <- ncol(dat) # no. of items
K <- 3 # no. of factors
qlam <- sim18ccfa40$qlam
qlam

Q<-matrix(-1,J,K); # -1 for unspecified items
Q[1:2,1]<-Q[7:8,2]<-Q[13:14,3]<-1 # 1 for specified items
Q

## ----eval=FALSE---------------------------------------------------------------
#  m0 <- pcfa(dat = dat, Q = Q,LD = FALSE, cati = -1,burn = 4000, iter = 4000,verbose = TRUE)
#  
#  # summarize basic information
#  summary(m0)
#  
#  #summarize significant loadings in pattern/Q-matrix format
#  summary(m0, what = 'qlambda')
#  
#  #factorial eigenvalue
#  summary(m0,what='eigen')
#  
#  #thresholds for categorical items
#  summary(m0,what='thd')
#  
#  #plotting factorial eigenvalue
#  plot_eigen(m0) # trace
#  plot_eigen(m0, what='density') #density
#  plot_eigen(m0, what='APSR') #adj, PSRF

## ----eval=FALSE---------------------------------------------------------------
#  Q<-matrix(-1,J,K);
#  tmp<-summary(m0, what="qlambda")
#  cind<-apply(tmp,1,which.max)
#  Q[cbind(c(1:J),cind)]<-1
#  #alternatively
#  #Q[1:6,1]<-Q[7:12,2]<-Q[13:18,3]<-1 # 1 for specified items
#  
#  m1 <- pcfa(dat = dat, Q = Q, cati = -1,burn = 4000, iter = 4000,verbose = TRUE)
#  summary(m1)
#  summary(m1, what = 'qlambda')
#  summary(m1, what = 'offpsx') #summarize significant LD terms
#  summary(m1,what='eigen')
#  summary(m1,what='thd')
#  
#  #plotting factorial eigenvalue
#  plot_eigen(m1) # trace
#  plot_eigen(m1, what='density') #density
#  plot_eigen(m1, what='APSR') #adj, PSRF

## ----eval=FALSE---------------------------------------------------------------
#  Q<-summary(m1, what="qlambda")
#  Q[Q!=0]<-1
#  Q
#  
#  m2 <- pcfa(dat = dat, Q = Q, cati = -1,burn = 4000, iter = 4000,verbose = TRUE)
#  summary(m2)
#  summary(m2, what = 'qlambda')
#  summary(m2, what = 'offpsx')
#  summary(m2,what='eigen')
#  summary(m2,what='thd')
#  
#  plot_eigen(m2) # Eigens' traces are excellent without regularization of the loadings

## ---- eval=FALSE--------------------------------------------------------------
#  dat <- sim18ccfa41$dat
#  summary(dat) #10% missingness at random
#  J <- ncol(dat) # no. of items
#  K <- 3 # no. of factors
#  sim18ccfa41$qlam
#  sim18ccfa41$LD # effect size = .3
#  
#  Q<-matrix(-1,J,K); # -1 for unspecified items
#  Q[1:2,1]<-Q[7:8,2]<-Q[13:14,3]<-1 # 1 for specified items
#  Q
#  

## ----eval=FALSE---------------------------------------------------------------
#  m0 <- pcfa(dat = dat, Q = Q,LD = FALSE, cati = -1,burn = 4000, iter = 4000,verbose = TRUE)
#  summary(m0)
#  summary(m0, what = 'qlambda')
#  summary(m0,what='eigen')
#  summary(m0,what='thd')
#  
#  plot_eigen(m0) # trace
#  plot_eigen(m0, what='APSR')

## ----eval=FALSE---------------------------------------------------------------
#  Q<-matrix(-1,J,K);
#  tmp<-summary(m0, what="qlambda")
#  cind<-apply(tmp,1,which.max)
#  Q[cbind(c(1:J),cind)]<-1
#  Q
#  
#  m1 <- pcfa(dat = dat, Q = Q, cati = -1,burn = 4000, iter = 4000,verbose = TRUE)
#  summary(m1)
#  summary(m1, what = 'qlambda')
#  summary(m1,what='eigen')
#  summary(m1, what = 'offpsx')
#  summary(m1,what='thd')

## ----eval=FALSE---------------------------------------------------------------
#  Q<-summary(m1, what="qlambda")
#  Q[Q!=0]<-1
#  Q
#  
#  m2 <- pcfa(dat = dat, Q = Q, cati = -1,burn = 4000, iter = 4000,verbose = TRUE)
#  summary(m2)
#  summary(m2, what = 'qlambda')
#  summary(m2,what='eigen')
#  summary(m2, what = 'offpsx')
#  summary(m2,what='thd')

## ---- eval=FALSE--------------------------------------------------------------
#  dat <- sim18mcfa41$dat
#  summary(dat) #10% missingness at random
#  J <- ncol(dat) # no. of items
#  K <- 3 # no. of factors
#  sim18mcfa41$qlam
#  sim18mcfa41$LD # effect size = .3
#  
#  Q<-matrix(-1,J,K); # -1 for unspecified items
#  Q[1:2,1]<-Q[7:8,2]<-Q[13:14,3]<-1 # 1 for specified items
#  Q
#  

## ----eval=FALSE---------------------------------------------------------------
#  m0 <- pcfa(dat = dat, Q = Q,LD = FALSE, cati = c(1:12),burn = 4000, iter = 4000,verbose = TRUE)
#  summary(m0)
#  summary(m0, what = 'qlambda')
#  summary(m0,what='eigen')
#  summary(m0,what='thd') # only for 12 items
#  
#  plot_eigen(m0) # trace
#  plot_eigen(m0, what='density')
#  plot_eigen(m0, what='APSR')

## ----eval=FALSE---------------------------------------------------------------
#  Q<-matrix(-1,J,K);
#  tmp<-summary(m0, what="qlambda")
#  cind<-apply(tmp,1,which.max)
#  Q[cbind(c(1:J),cind)]<-1
#  Q
#  
#  m1 <- pcfa(dat = dat, Q = Q, cati = c(1:12),burn = 4000, iter = 4000,verbose = TRUE)
#  summary(m1)
#  summary(m1, what = 'qlambda')
#  summary(m1,what='eigen')
#  summary(m1, what = 'offpsx')
#  summary(m1,what='thd')

## ----eval=FALSE---------------------------------------------------------------
#  Q<-summary(m1, what="qlambda")
#  Q[Q!=0]<-1
#  Q
#  
#  m2 <- pcfa(dat = dat, Q = Q, cati = c(1:12),burn = 4000, iter = 4000,verbose = TRUE)
#  summary(m2)
#  summary(m2, what = 'qlambda')
#  summary(m2,what='eigen')
#  summary(m2, what = 'offpsx')
#  summary(m2,what='thd')

