% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pcfa.R
\name{pcfa}
\alias{pcfa}
\title{(Generalized) Partially Confirmatory Factor Analysis}
\usage{
pcfa(
  dat,
  Q,
  LD = TRUE,
  cati = NULL,
  cand_thd = 0.2,
  PPMC = FALSE,
  burn = 5000,
  iter = 5000,
  update = 1000,
  missing = NA,
  rfit = TRUE,
  sign_check = FALSE,
  sign_eps = -0.5,
  rs = FALSE,
  auto_stop = FALSE,
  max_conv = 10,
  rseed = 12345,
  digits = 4,
  alas = FALSE,
  verbose = FALSE
)
}
\arguments{
\item{dat}{A \eqn{N \times J} data \emph{matrix} or \emph{data.frame} consisting of the
responses of \eqn{N} individuals to \eqn{J} items.}

\item{Q}{A \eqn{J \times K} design matrix for the loading pattern with \eqn{K} factors and \eqn{J} items.
Elements are 1, -1, and 0 for specified, unspecified, and zero-fixed loadings, respectively. For models with
LI or the E-step, one can specify a few (e.g., 2) loadings per factor. For models with LD or the C-step, the
sufficient condition of one specified loading per item is suggested, although there can be a few items
without any specified loading. See \code{Examples}.}

\item{LD}{logical; \code{TRUE} for allowing LD (model with LD or C-step).}

\item{cati}{The set of categorical (polytomous) items in sequence number (i.e., 1 to \eqn{J});
\code{NULL} for no and -1 for all items (default is \code{NULL}).}

\item{cand_thd}{Candidate parameter for sampling the thresholds with the MH algorithm.}

\item{PPMC}{logical; \code{TRUE} for conducting posterior predictive model checking.}

\item{burn}{Number of burn-in iterations before posterior sampling.}

\item{iter}{Number of formal iterations for posterior sampling (> 0).}

\item{update}{Number of iterations to update the sampling information.}

\item{missing}{Value for missing data (default is \code{NA}).}

\item{rfit}{logical; \code{TRUE} for providing relative fit (DIC, BIC, AIC).}

\item{sign_check}{logical; \code{TRUE} for checking sign switch of loading vector.}

\item{sign_eps}{minimum value for switch sign of loading vector (if \code{sign_check=TRUE}).}

\item{rs}{logical; \code{TRUE} for enabling recommendation system.}

\item{auto_stop}{logical; \code{TRUE} for enabling auto stop based on \code{EPSR<1.1}.}

\item{max_conv}{maximum consecutive number of convergence for auto stop.}

\item{rseed}{An integer for the random seed.}

\item{digits}{Number of significant digits to print when printing numeric values.}

\item{alas}{logical; for adaptive Lasso or not. The default is \code{FALSE}.}

\item{verbose}{logical; to display the sampling information every \code{update} or not.
\itemize{
    \item \code{Feigen}: Eigenvalue for each factor.
    \item \code{NLA_le3}: Number of Loading estimates >= .3 for each factor.
    \item \code{Shrink}: Shrinkage (or ave. shrinkage for each factor for adaptive Lasso).
    \item \code{EPSR & NCOV}: EPSR for each factor & # of convergence.
    \item \code{Ave. Thd}: Ave. thresholds for polytomous items.
    \item \code{Acc Rate}: Acceptance rate of threshold (MH algorithm).
    \item \code{LD>.2 >.1 LD>.2 >.1}: # of LD terms larger than .2 and .1, and LD's shrinkage parameter.
    \item \code{#Sign_sw}: Number of sign switch for each factor.
}}
}
\value{
\code{pcfa} returns an object of class \code{lawbl} without item intercepts. It contains a lot of information about
the posteriors that can be summarized using \code{\link{summary.lawbl}}.
}
\description{
\code{PCFA} is a partially confirmatory approach covering a wide range of
the exploratory-confirmatory continuum in factor analytic models (Chen, Guo, Zhang, & Pan, 2021).
The PCFA is only for continuous data, while the generalized PCFA (GPCFA; Chen, 2021)
covers both continuous and categorical data.

 There are two major model variants with different constraints for identification. One assumes local
 independence (LI) with a more exploratory tendency, which can be also called the E-step.
 The other allows local dependence (LD) with a more confirmatory tendency, which can be also
 called the C-step. Parameters are obtained by sampling from the posterior distributions with
 the Markov chain Monte Carlo (MCMC) techniques. Different Bayesian Lasso methods are used to
 regularize the loading pattern and LD. The estimation results can be summarized with \code{\link{summary.lawbl}}
 and the factorial eigenvalue can be plotted with \code{\link{plot_lawbl}}.
}
\examples{
\donttest{
#####################################################
#  Example 1: Estimation with continuous data & LD  #
#####################################################

dat <- sim18cfa1$dat
J <- ncol(dat)
K <- 3
Q<-matrix(-1,J,K);
Q[1:6,1]<-Q[7:12,2]<-Q[13:18,3]<-1

m0 <- pcfa(dat = dat, Q = Q, LD = TRUE,burn = 2000, iter = 2000)
summary(m0) # summarize basic information
summary(m0, what = 'qlambda') #summarize significant loadings in pattern/Q-matrix format
summary(m0, what = 'offpsx') #summarize significant LD terms

######################################################
#  Example 2: Estimation with categorical data & LI  #
######################################################
dat <- sim18ccfa40$dat
J <- ncol(dat)
K <- 3
Q<-matrix(-1,J,K);
Q[1:2,1]<-Q[7:8,2]<-Q[13:14,3]<-1

m1 <- pcfa(dat = dat, Q = Q,LD = FALSE,cati=-1,burn = 2000, iter = 2000)
summary(m1) # summarize basic information
summary(m1, what = 'qlambda') #summarize significant loadings in pattern/Q-matrix format
summary(m1, what = 'offpsx') #summarize significant LD terms
summary(m1,what='thd') #thresholds for categorical items
}
}
\references{
Chen, J., Guo, Z., Zhang, L., & Pan, J. (2021). A partially confirmatory approach to scale development
 with the Bayesian Lasso. \emph{Psychological Methods}. 26(2), 210–235. DOI: 10.1037/met0000293.

Chen, J. (2021). A generalized partially confirmatory factor analysis framework with mixed Bayesian Lasso methods.
 \emph{Multivariate Behavioral Research}. DOI: 10.1080/00273171.2021.1925520.
}
