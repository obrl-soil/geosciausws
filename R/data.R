#' GA Service Information
#'
#' A data frame containing information about WCS services available from
#' GeoScience Australia.
#'
#' @format A data frame with 1 observations and 14 variables \describe{
#' \item{Name}{Product Name}
#' \item{Short_Name}{Product short name}
#' \item{Service}{Product code}
#' \item{xmin}{left bounding longitude in decimal degrees}
#' \item{xmax}{right bounding longitude in decimal degrees}
#' \item{ymin}{bottom latitude in decimal degrees}
#' \item{ymax}{top bounding latitude in decimal degrees}
#' \item{offset_x}{Cell resolution in x dimension}
#' \item{offset_y}{Cell resolution in y dimension}
#' \item{origin_x}{x coordinate result of
#'   \code{\link[raster:origin]{raster::origin()}} for this dataset.}
#' \item{origin_y}{y coordinate result of
#'   \code{\link[raster:origin]{raster::origin()}} for this dataset.}
#' \item{ncol}{number of raster cells in x dimension}
#' \item{nrow}{number of raster cells in y dimension}
#' \item{na_val}{Raster No Data value}
#' }
#'
"ga_service_info"

#ga_service_info <-
#  data.frame("Name" = c('SRTM 1" DEM over Bathymetry', 'DEM from LiDAR - 25m', 'DEM from LiDAR - 5m'),
#             "Short_Name" = c('SRTM_BATH', 'LIDAR_25', 'LIDAR_05'),
#             "Service" = c('DEM_SRTM_1Second_over_Bathymetry_Topography', 'DEM_LiDAR_25m',
#                           'DEM_LiDAR_5m'),
#             "xmin" = c(91.997360943325319, 113.76023194201119, 113.76023292500008),
#             "ymin" = c(-60.002824466238778, -43.996225096314618, -45.949852453747006),
#             "xmax" = c(171.99763936110531, 156.7806037200736, 162.00003317680361),
#             "ymax" = c(-8.0022684946787805, -9.2055912338565218, -9.2055683139999545),
#             "offset_x" = c(0.00027777777999999997, 0.00023999002436732555, 4.4915764205976067e-005),
#             "offset_y" = c(-0.00027777777999999997, -0.00023999002436732563, -4.4915764205976074e-005),
#             "origin_x" = c(1.3798512533469420e-04, -7.9398612840009264e-05, 1.0795371025551503e-05),
#             "origin_y" = c(-4.6208438782002759e-05, -5.3879174645388161e-05, 7.3915432530213820e-06),
#             "ncol" = c(288000, 179258, 1074005 ),
#             "nrow" = c(187201, 144966, 818070),
#             'na_val' = c(-3.4028234663852886e+038, NA, NA),
#             stringsAsFactors = FALSE
#             )
#usethis::use_data(ga_service_info, overwrite = TRUE)
