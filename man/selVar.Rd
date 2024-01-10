\name{selVar}
\alias{selVar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Display the names of common variables}
\description{
This function displays the names of common variables based on the \code{create_new_data} function so that the user can give any variable he/she wants as a blocked variable in the \code{preprocLinkage} function.
}
\usage{
selVar(d1, d2, chz = "NULL")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{d1}{
A data frame.
}
  \item{d2}{
A data frame.
}
  \item{chz}{
the number of the name of the variable that the user does not want to change based on the output of the \code{preproc} function.
}
}

\value{
Character.
}

\author{
Hossein Hassani and and Leila Marvian Mashhad and Sara Stewart and Steve Macfeelys.
}

\seealso{
\code{\link{preproc}}
}
\examples{
  d1 = RLdata500
  d2 = RLdata10000
  selVar(d1, d2)
}

