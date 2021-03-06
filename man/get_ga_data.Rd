% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_data.R
\name{get_ga_data}
\alias{get_ga_data}
\title{Get Geoscience Australia data}
\usage{
get_ga_data(product = NULL, aoi = NULL, write_out = TRUE)
}
\arguments{
\item{product}{Character, one of the options from column 'Short_Name' in
\code{\link[geosciausws:ga_service_info]{ga_service_info}}.}

\item{aoi}{Vector of WGS84 coordinates defining a rectangular area of
interest. The vector may be specified directly in the order xmin, xmax,
ymin, ymax, or the function can derive an aoi from the boundary of an `sf`
or `raster` object.}

\item{write_out}{Boolean, whether to write the retrieved dataset to the
working directory as a GeoTiff.}
}
\value{
Raster dataset for a single landscape product.
}
\description{
Downloads gridded landscape data in raster format from Geoscience Australia's
public WCS services.
}
\examples{
\dontrun{
# get elevation data for King Island
aoi <- c(143.75, -40.17, 144.18, -39.57)
ki_dem <- get_ga_data(product = 'SRTM_BATH', aoi = aoi, write_out = FALSE)
}
}
