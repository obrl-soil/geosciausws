#' Get Geoscience Australia data
#'
#' Downloads gridded landscape data in raster format from Geoscience Australia's
#' public WCS services.
#'
#' @param product Character, one of the options from column 'Short_Name' in
#'   \code{\link[geosciausws:ga_service_info]{ga_service_info}}.
#' @param aoi Vector of WGS84 coordinates defining a rectangular area of
#'   interest. The vector may be specified directly in the order xmin, xmax,
#'   ymin, ymax, or the function can derive an aoi from the boundary of an `sf`
#'   or `raster` object.
#' @param write_out Boolean, whether to write the retrieved dataset to the
#'   working directory as a GeoTiff.
#' @return Raster dataset for a single landscape product.
#' @importFrom httr content GET write_disk
#' @importFrom raster getValues raster subs writeRaster
#' @examples \dontrun{
#' # get elevation data for King Island
#' aoi <- c(143.75, -40.17, 144.18, -39.57)
#' ki_dem <- get_ga_data(product = 'SRTM_BATH', aoi = aoi, write_out = FALSE)
#' }
#' @export
#'
get_ga_data <- function(product   = NULL,
                        aoi       = NULL,
                        write_out = TRUE) {

  # generate URL
  this_url <- make_ga_url(product = product, aoi = aoi)

  # get data, send to temp file
  out_temp <- paste0(tempfile(), '_GA_', product, '.tif')
  suppressMessages(httr::GET(url = this_url,
                             httr::write_disk(out_temp)))

  # pull back in and tidy up
  # still need to decide on NA handling
  r <- if(product %in% c('AUS_BASE', 'AUS_NATMAP')) {
    raster::brick(out_temp) # multiband data
  } else {
    raster::raster(out_temp)
  }

  # write final product to working directory if directed
  if(write_out == TRUE) {
    out_dest <- file.path(getwd(), paste0('GA_', product, '.tif'))
    raster::writeRaster(r, out_dest, datatype = 'FLT4S',
                          NAflag = -9999, overwrite = TRUE)
    if(product %in% c('AUS_BASE', 'AUS_NATMAP')) {
      raster::brick(out_dest)
    } else {
      raster::raster(out_dest)
    }
  } else {
    r
  }
}
