\name{create_new_data}
\alias{create_new_data}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Final Data Preprocessing
}
\description{
First, after calling the two data sets, preliminary dat preprocessing is done using \code{preproc} function. Then, according to its output, the user decides which variables should not be renamed. Then this function performs complementary data preprocessing such as sorting the names of the variables, matching the gender variable with different formats, etc. and produces two new data frames.
}
\usage{
create_new_data(d1, d2, chz = "NULL")
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
Two data frames.
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
  create_new_data(d1, d2)
}