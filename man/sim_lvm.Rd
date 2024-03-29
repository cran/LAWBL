% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sim_lvm.R
\name{sim_lvm}
\alias{sim_lvm}
\title{Simulating data with Latent Variable Modeling}
\usage{
sim_lvm(
  N = 1000,
  mla = NULL,
  K = 3,
  J = 18,
  cpf = 0,
  lam = 0.7,
  lac = 0.3,
  phi = 0.3,
  ph12 = -1,
  ecr = 0,
  P = 0,
  b = 0.3,
  K1 = 0,
  ph1 = 0.2,
  b1 = 0.3,
  ilvl = NULL,
  cati = NULL,
  noc = c(4),
  misp = 0,
  ome_out = FALSE,
  necw = K,
  necb = K,
  add_ind = c(),
  add_la = 0.5,
  add_phi = 0,
  zero_it = 0,
  rseed = 333,
  digits = 4
)
}
\arguments{
\item{N}{Sample size.}

\item{mla}{Population loading matrix.}

\item{K}{Number of factors (if \code{mla=NULL}).}

\item{J}{Number of items (if \code{mla=NULL}).}

\item{cpf}{Number of cross-loadings per factor (if \code{mla=NULL}).}

\item{lam}{Number of formal iterations for posterior sampling.}

\item{lac}{Number of iterations to update the sampling information.}

\item{phi}{Homogeneous correlations between any two factors.}

\item{ph12}{Correlation between factor 1 and 2 (if it's different from \code{phi}.}

\item{ecr}{Residual correlation (local dependence).}

\item{P}{Number of observable predictors (for MIMIC model).}

\item{b}{Coefficients of observable predictors (for MIMIC model).}

\item{K1}{Number of latent predictors (for MIMIC model).}

\item{ph1}{Correlations between latent predictors (for MIMIC model).}

\item{b1}{Coefficients of latent predictors (for MIMIC model).}

\item{ilvl}{Specified levels of all items (i.e., need to specify Item 1 to \eqn{J+P});
Any value smaller than 2 is considered as continuous item.}

\item{cati}{The set of polytomous items in sequence number (i.e., can be any number set
in between 1 and \eqn{J+P}); \code{NULL} for no and -1 for all (if \code{ilvl=NULL}).}

\item{noc}{Number of levels for polytomous items.}

\item{misp}{Proportion of missingness.}

\item{ome_out}{Output factor score or not.}

\item{necw}{Number of within-factor local dependence.}

\item{necb}{Number of between-factor local dependence.}

\item{add_ind}{(Additional) minor factor with cross-loadings.}

\item{add_la}{Value of cross-loadings on (Additional) minor factor.}

\item{add_phi}{Correlations between (Additional) minor factor and other factors.}

\item{zero_it}{Surplus items with zero loading.}

\item{rseed}{An integer for the random seed.}

\item{digits}{Number of significant digits to print when printing numeric values.}
}
\value{
An object of class \code{list} containing the data, loading, and factorial correlation matrix.
}
\description{
\code{sim_lvm} can simulate data based on factor analysis or
item response models with different response formats (continuous or categorical),
loading patterns and residual covariance (local dependence) structures.
}
\examples{

# for continuous data with cross-loadings and local dependence effect .3
out <- sim_lvm(N=1000,K=3,J=18,lam = .7, lac=.3,ecr=.3)
summary(out$dat)
out$MLA
out$ofd_ind

# for categorical data with cross-loadings .4 and 10\% missingness
out <- sim_lvm(N=1000,K=3,J=18,lam = .7, lac=.4,cati=-1,noc=4,misp=.1)
summary(out$dat)
out$MLA
out$ofd_ind

}
