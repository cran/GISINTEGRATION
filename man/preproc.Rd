\name{preproc}
\alias{preproc}
\alias{print.explain}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Preprocessing and Unification of Variable Names of Two Input Data Sets
}
\description{
In this function data preprocessing has been meticulously executed to cover a wide range of datasets, ensuring that variable names are standardized using synonyms. 
}
\usage{
preproc(d1, d2)
\method{print}{explain}(x,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{d1}{
A data frame.
}
  \item{d2}{
A data frame.
}
\item{x}{
an object of class \code{'eplain'}.
  }
\item{\dots}{further arguments passed to preproc function.}
}
\details{
Because we want users to be able to change their names. The output of this function gives the names and classes that have changed in the new version and the previous version, as well as the number of changes in both datasets. Returns the corresponding number for the \code{chz} argument in the \code{chzInput} function.
}
\value{
\code{preproc} an object of class \code{'explain'}.

An object of class \code{'explain'} is a list containing the following components:

  \item{Changed variable's names}{Character.}  
  \item{Changed variable's classes}{Character.}
  \item{Initial variable's names}{Character.}
  \item{Initial variable's classes}{Character.}
  \item{A number of changed variable values for the first dataset are }{Data frame.}
  \item{A number of changed variable values for the second dataset }{Data frame.}
  \item{Number of changed variable's names }{Vector.}

}

\author{
Hossein Hassani and and Leila Marvian Mashhad and Sara Stewart and Steve Macfeelys.
}
\note{
This function has a comprehensible output if changes have been made on the names of the variables for equalization, otherwise it has no specific output and everything is zero.

In addition, it should be noted that the names of the variables of the second data set are matched and the necessary changes are made based on the first data set.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{chzInput}}
}
\examples{
  d1 = RLdata500
  d2 = RLdata10000
  preproc(d1, d2)
}
