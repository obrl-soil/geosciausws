#' Make GeoScience Australia URL
#'
#' Generate the WCS GetCoverage URL for a particular product available from
#' Geoscience Australia.
#'
#' @param product Character, one of the options from column 'Short_Name' in
#'   \code{\link[geosciausws:ga_service_info]{ga_service_info}}.
#' @param aoi Vector of WGS84 coordinates defining a rectangular area of
#'   interest. The vector may be specified directly in the order xmin, ymin,
#'   xmax, ymax, or the function can derive an aoi from the boundary of an `sf`
#'   or `raster` object.
#' @param req_type Character; one of 'cap', 'cov' or 'desc'. Defaults to 'cov'.
#' @keywords internal
#' @importFrom utils data
#'
make_ga_url <- function(product = NULL, aoi = NULL, req_type = 'cov') {

  ga_service_info <- NULL
  utils::data('ga_service_info', envir = environment())

  if(is.null(product)) { stop('Please specify a product.')}
  product <- match.arg(product, ga_service_info$Short_Name)

  req_type <- match.arg(req_type, c('cap', 'cov', 'desc'))
  url_root <- "http://services.ga.gov.au/gis/services/"
  service <- ga_service_info$Service[which(ga_service_info$Short_Name == product)]
  service_root <- paste0(service, "/MapServer/WCSServer?")

  if(req_type == 'cap') {
    return(
      paste0(url_root, service_root,
             "REQUEST=GetCapabilities&SERVICE=WCS&VERSION=1.0.0")
    )
  }

  if(all(req_type == 'desc', is.null(product))) {
    return(
      paste0(url_root, service_root,
             "REQUEST=DescribeCoverage&SERVICE=WCS&VERSION=1.0.0")
    )
  }

  if(req_type == 'desc') {
    return(
      paste0(url_root, service_root,
             "REQUEST=DescribeCoverage&SERVICE=WCS&VERSION=1.0.0&COVERAGE=1")
    )
  }

  aoi <- validate_aoi(aoi, product)

  res <- abs(
    c(ga_service_info$offset_x[which(ga_service_info$Short_Name == product)],
      ga_service_info$offset_y[which(ga_service_info$Short_Name == product)]))

  cols <- round(abs(aoi[1] - aoi[3]) / res[1])
  rows <- round(abs(aoi[2] - aoi[4]) / res[2])

  paste0(url_root, service_root,
         "REQUEST=GetCoverage&SERVICE=WCS&VERSION=1.0.0&COVERAGE=1",
         "&CRS=EPSG:4283&BBOX=", paste(aoi, collapse = ','),
         "&WIDTH=", cols,
         "&HEIGHT=", rows,
         "&FORMAT=GeoTIFF")
}
