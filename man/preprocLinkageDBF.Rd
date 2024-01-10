\name{preprocLinkageDBF}
\alias{preprocLinkageDBF}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
GIS Integration
}
\description{
This function enables users to effectively preprocess GIS data before conducting complex spatial analyses. By automating complex processes like data cleaning, normalization, and format transformation, GeoLinkR ensures that data are prepared for precise and reliable analysis.
}
\usage{
preprocLinkageDBF(d1,d2,chz="NULL",var="area",threshold=0.9)
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
the number of the name of the variable that the user does not want to change based on the output of the \code{\link{preproc}} function.
}
  \item{var}{
The vector of the names of the blocked variables that the user chooses based on the output of the \code{selVar} function that gives the vector of the names of the common variables between the two data sets.
}
  \item{threshold}{
A numeric value between 0 and 1. 
}
  
}
\details{
The results are stored in the .dbf file in the system default path. 
}
\value{
dbf file.
}
\author{
Hossein Hassani and and Leila Marvian Mashhad and Sara Stewart and Steve Macfeelys.
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
 \code{\link{selVar}}, \code{\link{chzInput}}
}
\examples{
  \donttest{
  library(sf)
  nc1 <- system.file("shape/nc.shp", package="sf")
  nc2 <- system.file("shape/nc.shp", package="sf")

  nc1 <- st_read(nc1, stringsAsFactors = FALSE)
  nc2 <- st_read(nc2, stringsAsFactors = FALSE)

  d1 <- data.frame(nc1)
  d2 <- data.frame(nc2)

  preprocLinkageDBF(d1, d2, var='area')
  }
}
