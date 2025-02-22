% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/melsm.R
\name{melsm}
\alias{melsm}
\title{S3 \code{melsm} method}
\usage{
melsm(fixed_location, random_location, fixed_scale, random_scale,
  prior = NULL, mixture = NULL, k = 2, rho_test = "muvar",
  adapt = 1000, chains = 4, iter = 5000, thin = 1, data, ...)
}
\arguments{
\item{fixed_location}{a \code{formula} object for the fixed-effects part of the location sub-model, with the response (on the left) and
the terms (on the right) sepearted by \code{~}.}

\item{random_location}{a \code{formula} object for the random effects part of the location sub-model, with the random effect (on the left)
and the cluster (on the right) seperated by \code{~}.}

\item{fixed_scale}{a \code{formula} object for the fixed-effects part of the scale sub-model, with the response (on the left) and
the terms (on the right) sepearted by \code{~}.}

\item{random_scale}{a \code{formula} object for the random effects part of the location sub-model, with the random effect (on the left)
and the cluster (on the right) seperated by \code{~}.}

\item{prior}{a list specifying non-default prior distribution. Set to \code{NULL} for the defaults.}

\item{mixture}{type of mixture prior distribution for the random effects correlations. Options are \code{mixture  = "KM"} for Kuo and
Mallick (1998) or \code{mixture = SSVS} for stochastic search variable section (X). Default is set to \code{NULL}, wherein
no covariance selection is performed. See notes for futher details.}

\item{k}{number of mixture components. options are \code{k = 2} or \code{k = 3} for \code{mixture = "SSVS"}.
When \code{mixture = "KM"}. only two components are allowed.}

\item{rho_test}{\code{rho_test = "all"} tests all of the random effects correlations, whereas \code{rho_test = "muvar"} tests
the random effects correlations that capture mean--variance relations across the location and scale sub-models.}

\item{adapt}{adaptive phase. see X.}

\item{chains}{number of chains.}

\item{iter}{number of posterior samples for each chain}

\item{thin}{thinning interval (e.g., with \code{thin = 5} every 5 iteraions are saved)}

\item{data}{a data frame  containing the variables named in \code{fixed_location}, \code{random_location},
\code{fixed_scale}, and \code{random_scale}}

\item{...}{currently ignored}
}
\value{
object of class \code{melsm}
}
\description{
S3 \code{melsm} method
}
\examples{
\dontrun{
dat <- nlme::Orthodont
fit <- melsm(fixed_location = distance ~  age,
            random_location = ~ age | Subject,
            fixed_scale = sigma ~  1, k = 3,
            random_scale = ~ 1 | Subject,
            adapt = 5000,
            iter = 10000,
            rho_test = "all",
            mixture = "SSVS",
            data = dat)
}
}
\seealso{
\code{\link{melsm.default}}
}
