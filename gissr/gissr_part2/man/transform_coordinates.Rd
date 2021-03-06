% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/transform_coordinates.R
\name{transform_coordinates}
\alias{transform_coordinates}
\title{Function to convert coordinates within a data frame.}
\usage{
transform_coordinates(df, x = "easting", y = "northing", from = "",
  to = "+proj=longlat +datum=WGS84 +no_defs", rename = TRUE,
  reorder = TRUE, round = 6)
}
\arguments{
\item{df}{Data frame with coordinates to be transformed.}

\item{x}{Name of \code{x} variable.}

\item{y}{Name of \code{y} variable.}

\item{from}{A proj4 string which represents what coordinate system the
data frame \code{x} and \code{y} are in.}

\item{to}{A proj4 string which represents what coordinate system the 
converted coordinates will be converted to.}

\item{rename}{Should the converted coordinates be renamed to a generic 
\code{x} and \code{y}?}

\item{reorder}{Should the converted coordinates be placed in the first two 
columns of the returned data frame?}

\item{round}{How many decimal points should the converted coordinates be
rounded to? Default is 6.}
}
\description{
\code{transform_coordinates} converts coordinate pairs from one projection 
system to another. \code{transform_coordinates} is useful when tabular data 
are supplied and the coordinate system is different that what is desired.
}
\details{
\code{transform_coordinates} works by coercing the input data frame to a 
spatial object, applies \code{sp::spTransform} to convert the coordinates, 
converts the spatial object back to a data frame and then returns the data 
frame with the transformed coordinates. The transformed coordinates can be 
optionally renamed and reordered.

\code{transform_coordinates} requires a CRS projection string for the 
\code{from} and \code{to} arguments. \code{to} by default is set as 
WGS 84/EPSG:4326 (\code{+proj=longlat +datum=WGS84}).
}
\examples{

\dontrun{
# Convert British National Grid/Ordnance Survey National Grid/OSGB36/EPSG:7405
# to latitude and longitude (WGS 84/EPSG:4326)

# The proj4 string for British National Grid (very long string!)
bng <- "+proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +towgs84=446.448,-125.157,542.060,0.1502,0.2470,0.8421,-20.4894 +units=m +no_defs"

data_oxford_transform <- transform_coordinates(
  data_oxford, x = "x_coordinate", y = "y_coordinate", from = bng)
}

}
\author{
Stuart K. Grange
}
\seealso{
See \code{\link{spTransform}}, \code{\link{sp_transform}}
}

