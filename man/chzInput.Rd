\name{chzInput}
\alias{chzInput}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Consulting User
}
\description{
After the pre processing of the data sets by \code{preproc} function, a series of changes were made on the names of the two variables for uniformity. Sometimes these changes of names based on synonyms are not desired by the user. In this function, according to the output of the \code{preproc} function, the user is asked to tell the program that any change in the name of the variables that he does not want.
}
\usage{
chzInput(d1, d2, chz = "NULL")
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
\details{
For more details about this function, refer to \code{preproc} function manual.
}
\value{
A vector of characters.
It is a vector of characters that shows the names of the variables of the second data set based on the opinion of the user who said which variable name should not be changed.
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
  chzInput(d1, d2)
}
