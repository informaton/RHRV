\name{CalculateTimeLag}
\alias{CalculateTimeLag}
\title{Estimate an appropiate time lag for the Takens' vectors}
\usage{
  CalculateTimeLag(HRVData, method = "first.e.decay",
    value = 1/exp(1), lagMax = NULL, doPlot = TRUE)
}
\arguments{
  \item{HRVData}{Data structure that stores the beats
  register and information related to it}

  \item{method}{The method that we shall use to estimate
  the time lag (see the Details section). Available methods
  are \emph{"first.zero"}, \emph{"first.e.decay"},
  \emph{"first.minimum"} and \emph{"first.value"}.}

  \item{value}{Numeric value indicating the value that the
  autocorrelation function must cross in order to select
  the time lag. It is used only with the "first.value"
  method.}

  \item{lagMax}{Maximum lag at which to calculate the acf.
  By default, the length of the timeSeries is used.}

  \item{doPlot}{Logical value. If TRUE (default value), a
  plot of the autocorrelation function is shown.}
}
\value{
  The estimated time lag.
}
\description{
  Given a time series (timeSeries), an embedding dimension
  (m) and a time lag (timeLag), the \eqn{n^{th}} Takens'
  vector is defined as \deqn{T[n]={timeSeries[n],
  timeSeries[n+ timeLag],...timeSeries[n+m*timeLag]}.} This
  function estimates an appropiate time lag by using the
  autocorrelation function.
}
\details{
  A basic criteria for estimating a proper time lag is
  based on the following reasoning: if the time lag used to
  build the Takens' vectors is too small, the coordinates
  will be too highly temporally correlated and the
  embedding will tend to cluster around the diagonal in the
  phase space. If the time lag is chosen too large, the
  resulting coordinates may be almost uncorrelated and the
  resulting embedding will be very complicated.  Thus,
  there is a wide variety of methods for estimating an
  appropiate time lag based on the study of the
  autocorrelation function of a given time series:
  \itemize{ \item Select the time lag where the
  autocorrelation function decays to 0 (first.zero method).
  \item Select the time lag where the autocorrelation
  function decays to 1/e (first.e.decay method).  \item
  Select the time lag where the autocorrelation function
  reaches its first minimum (first.minimum method).  \item
  Select the time lag where the autocorrelation function
  decays to the value specified by the user (first.value
  method and value parameter). }
}
\note{
  If the autocorrelation function does not cross the
  specifiged value, an error is thrown. This may be solved
  by increasing the lag.max or selecting a higher value to
  which the autocorrelation function must decay.

  This function is based on the
  \code{\link[nonlinearTseries]{timeLag}} function from the
  nonlinearTseries package.
}
\author{
  Constantino A. Garcia
}
\references{
  H. Kantz and T. Schreiber: Nonlinear Time series Analysis
  (Cambridge university press)
}
\seealso{
  \code{\link[nonlinearTseries]{timeLag}}.
}

