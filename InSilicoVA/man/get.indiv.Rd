% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/get_indiv.r
\name{get.indiv}
\alias{get.indiv}
\title{Get individual COD probabilities from InSilicoVA Model Fits}
\usage{
get.indiv(object, data = NULL, CI = 0.95, is.aggregate = FALSE,
  by = NULL, java_option = "-Xmx1g", ...)
}
\arguments{
\item{object}{Fitted \code{"insilico"} object.}

\item{data}{data for the fitted \code{"insilico"} object. The first column of the data should be the ID that matches the \code{"insilico"} fitted model.}

\item{CI}{Confidence interval for posterior estimates.}

\item{is.aggregate}{logical indicator for constructing aggregated distribution rather than individual distributions.}

\item{by}{list of column names to group by.}

\item{java_option}{Option to initialize java JVM. Default to ``-Xmx1g'', which sets the maximum heap size to be 1GB.}

\item{\dots}{Not used.}
}
\value{
\item{mean}{ individual mean COD distribution matrix.}
\item{median}{ individual median COD distribution matrix.}
\item{lower}{ individual lower bound for each COD probability.}
\item{upper}{ individual upper bound for each COD probability.}
}
\description{
This function calculates individual probabilities for each death and provide posterior credible intervals for each estimates. The default set up is to calculate the 95% C.I. when running the inSilicoVA model. If a different C.I. is desired after running the model, this function provides faster re-calculation without refitting the model.
}
\examples{
\dontrun{
data(RandomVA1)
fit1<- insilico(RandomVA1, subpop = NULL,
                length.sim = 1000, burnin = 500, thin = 10 , seed = 1,
                auto.length = FALSE)
summary(fit1, id = "d199")

# The following script updates credible interval for individual
# probabilities to 90\%
indiv.new <- get.indiv(fit1, CI = 0.9)
fit1$indiv.prob.lower <- indiv.new$lower
fit1$indiv.prob.upper <- indiv.new$upper
fit1$indiv.CI <- 0.9
summary(fit1, id = "d199")
}
}
\author{
Zehang Li, Tyler McCormick, Sam Clark

Maintainer: Zehang Li <lizehang@uw.edu>
}
\references{
Tyler H. McCormick, Zehang R. Li, Clara Calvert, Amelia C.
Crampin, Kathleen Kahn and Samuel J. Clark Probabilistic cause-of-death
assignment using verbal autopsies, \emph{arXiv preprint arXiv:1411.3042}
\url{http://arxiv.org/abs/1411.3042} (2014)
}
\seealso{
\code{\link{insilico}}, \code{\link{plot.insilico}}
}

