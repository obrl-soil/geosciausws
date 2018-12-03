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

ga_service_info <-
  data.frame("Type" = c(rep('Elevation', 6), rep("DEM Derivative", 2), rep('Basemap', 2) ),
             "Name" = c('SRTM 1" DEM', 'SRTM Hydrologically Enforced 1" DEM', 'SRTM 1" DEM over Bathymetry', 'Topography over Bathymetry', 'DEM from LiDAR - 25m', 'DEM from LiDAR - 5m',
                        'SRTM Aspect 1"', 'SRTM Slope 1"', 'Australian Base Map', 'Australian NATMAP Topographic Base Map'),
             "Short_Name" = c('SRTM_DEMS', 'SRTM_DEMH', 'SRTM_BATH', 'TOPO_BATH', 'LIDAR_25', 'LIDAR_05',
                              'ASPECT', 'SLOPE', 'AUS_BASE', 'AUS_NATMAP'),
             "Service" = c('DEM_SRTM_1Second', 'DEM_SRTM_1Second_Hydro_Enforced', 'DEM_SRTM_1Second_over_Bathymetry_Topography', 'Bathymetry_Topography', 'DEM_LiDAR_25m',
                           'DEM_LiDAR_5m', 'DEM_SRTM_1Second_Aspect', 'DEM_SRTM_1Second_Slope', 'Global_Map_Project_Australian_Base_Map', 'NATMAP_Digital_Maps_250K_2008Edition_WM'),
             "xmin" = c(112.99986111400005, 112.99986111100009, 91.997360943325319, 91.9976220703125165, 113.76023194201119, 113.76023292500008,
                        112.9995833333, 112.9995833333, 36.999999999999829, 112.88336000000004),
             "ymin" = c(-44.0001389004617, -44.000138889548303, -60.002824466238778, -60.0024389648437548, -43.996225096314618, -45.949852453747006,
                        -44.000416667025156, -44.000416667025156, -90.000000000000114, -43.999919999999932),
             "xmax" = c(153.99986111335099, 153.9998611116614, 171.99763936110531, 171.997622070310655, 156.7806037200736, 162.00003317680361,
                        154.00013888951744, 154.00013888951744, 177.49999999999994, 154.00015999999991),
             "ymax" = c(-10.00013890099995, -10.000138888999906, -8.0022684946787805, -8.00243896484496453, -9.2055912338565218, -9.2055683139999545,
                        -9.9998611109207118, -9.9998611109207118, -6.0000000000000568, -8.9999200000000386),
             "offset_x" = c(0.00027777777777338031, 0.00027777777778225824, 0.00027777777999999997, 0.00249999999999994194, 0.00023999002436732555, 4.4915764205976067e-005,
                            0.00027777777778226209, 0.00027777777778226209, 0.0041666666666666701, 0.000319999999999999),
             "offset_y" = c(-0.00027777777777338031, -0.00027777777778225813, -0.00027777777999999997, -0.00249999999999994194, -0.00023999002436732563, -4.4915764205976074e-005,
                            -0.00027777777778226209, -0.00027777777778226209,-0.0041666666666666692, -0.00031999999999999905),
             "origin_x" = c(-0.00013888421105434645, 0.00013888695521302452, 1.3798512533469420e-04, 1.2207031466004992e-04, -7.9398612840009264e-05, 1.0795371025551503e-05,
                            0.00013888703134057323, 0.00013888703134057323,-1.9895196601282805e-13, 1.5999999961024969e-04),
             "origin_y" = c(0.00013887661951450525, -0.00013888883861312706, -4.6208438782002759e-05, 6.1035154850230811e-05, -5.3879174645388161e-05, 7.3915432530213820e-06,
                            -0.00013888853705879001, -0.00013888853705879001, -5.3290705182007514e-14, 7.9999999934798893e-05),
             "ncol" = c(147599, 147599,  288000, 31999 , 179258, 1074005, 147601, 147601, 33719, 128489  ),
             "nrow" = c(122399,122399, 187201, 20799, 144966, 818070, 122401, 122401, 20159, 109374),
             'na_val' = c(NA, NA, -3.4028234663852886e+038, NA, NA, NA, NA, NA, NA, NA),
             stringsAsFactors = FALSE
             )
usethis::use_data(ga_service_info, overwrite = TRUE)
