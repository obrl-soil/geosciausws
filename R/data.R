#' GA Service Information
#'
#' A data frame containing information about WCS services available from
#' GeoScience Australia.
#'
#' @format A data frame with 27 observations and 17 variables \describe{
#' \item{Type}{Product Type}
#' \item{Name}{Product Name}
#' \item{Short_Name}{Product short name}
#' \item{Service}{Product code}
#' \item{Layer}{Layer Number (within service)}
#' \item{Bands}{Number of bands within layer}
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
#  data.frame("Type" = c(rep('Elevation', 5), rep("DEM Derivative", 2), rep('Basemap', 3)),
#             "Name" = c('SRTM 1" DEM', 'SRTM Hydrologically Enforced 1" DEM',
#                        'SRTM 1" DEM over Bathymetry',  'DEM from LiDAR - 25m',
#                        'DEM from LiDAR - 5m', 'SRTM Aspect 1"', 'SRTM Slope 1"',
#                        'Hillshade 3"', 'Landsat Mosaic 2006', '3" Bathymetry'),
#             "Short_Name" = c('SRTM_DEMS', 'SRTM_DEMH', 'SRTM_BATH',
#                              'LIDAR_25', 'LIDAR_05', 'ASPECT', 'SLOPE',
#                              'HSHADE_90', 'LANDSAT', 'BATH_3K'),
#             "Service" = c('DEM_SRTM_1Second', 'DEM_SRTM_1Second_Hydro_Enforced',
#                           'DEM_SRTM_1Second_over_Bathymetry_Topography',
#                           'DEM_LiDAR_25m', 'DEM_LiDAR_5m', 'DEM_SRTM_1Second_Aspect',
#                           'DEM_SRTM_1Second_Slope', rep('World_Bathymetry_Imagery_WM', 3)),
#             "Layer" = c(rep(1, 7), seq(3)),
#             "Bands" = c(rep(1,8), 3, 3),
#             "xmin" = c(112.99986111400005, 112.99986111100009, 91.997360943325319,
#                        113.76023194201119, 113.76023292500008, 112.9995833333, 112.9995833333,
#                        112.9998611111, 112.92136999914302, -179.99999999999997),
#             "ymin" = c(-44.0001389004617, -44.000138889548303, -60.002824466238778,
#                        -43.996225096314618, -45.949852453747006, -44.000416667025156,
#                        -44.000416667025156, -44.000129688873692, -43.742980000298594,
#                        -89.999999999982009),
#             "xmax" = c(153.99986111335099, 153.9998611116614, 171.99763936110531,
#                        156.7806037200736, 162.00003317680361, 154.00013888951744,
#                        154.00013888951744, 153.9998447110998, 153.63836999914301,
#                        179.99999999996405),
#             "ymax" = c(-10.00013890099995, -10.000138888999906, -8.0022684946787805,
#                        -9.2055912338565218, -9.2055683139999545, -9.9998611109207118,
#                        -9.9998611109207118, -10.000143288873865, -8.9334800002986192, 90),
#             "offset_x" = c(0.00027777777777338031, 0.00027777777778225824, 0.00027777777999999997,
#                            0.00023999002436732555, 4.4915764205976067e-005, 0.00027777777778226209,
#                            0.00027777777778226209, 0.00083333299999999578, 0.00049999999999999979,
#                            0.033333333333330002),
#             "offset_y" = c(-0.00027777777777338031, -0.00027777777778225813, -0.00027777777999999997,
#                            -0.00023999002436732563, -4.4915764205976074e-005, -0.00027777777778226209,
#                            -0.00027777777778226209, -0.00083333299999999578, -0.00049999999999999958,
#                            -0.033333333333330002),
#             "origin_x" = c(-0.00013888421105434645, 0.00013888695521302452, 1.3798512533469420e-04,
#                            -7.9398612840009264e-05, 1.0795371025551503e-05, 0.00013888703134057323,
#                            0.00013888703134057323, -9.3688899426069838e-05, -0.00013000085692738139,
#                            -1.7962520360015333e-11),
#             "origin_y" = c(0.00013887661951450525, -0.00013888883861312706, -4.6208438782002759e-05,
#                            -5.3879174645388161e-05, 7.3915432530213820e-06, -0.00013888853705879001,
#                            -0.00013888853705879001, -1.4728887391513013e-04, 0.00001999970137234186,
#                            8.9954710347228684e-12),
#             "ncol" = c(147599, 147599, 288000, 179258, 1074005, 147601, 147601,
#                        49199, 81433, 10799),
#             "nrow" = c(122399, 122399, 187201, 144966,  818070, 122401, 122401,
#                        40799, 69618,  5399),
#             'na_val' = c(NA, NA, -3.4028234663852886e+038, NA, NA, NA, NA, 255, NA, NA),
#             stringsAsFactors = FALSE
#             )
#
#ga_basemap_info <-
#  data.frame("Type" = c(rep('Basemap', 12) ),
#             "Name" = c('Global Map Project - Aus Landcover', 'Global Map Project - Aus Vegetation PTC',
#                        'Global Map Project - Aus Elevation',   'NATMAP Topographic Base Map - all data',
#                        paste0('NATMAP Zone ', seq(49,56,1)) ),
#             "Short_Name" = c('GMP_LAND', 'GMP_VEG', 'GMP_ELEV', 'NATMAP_ALL', paste0('NATMAP_', seq(49,56,1))),
#             "Service" = c(rep('Global_Map_Project_Australian_Base_Map', 3),
#                           rep('NATMAP_Digital_Maps_250K_2008Edition_WM', 9)),
#             "Layer" = c(seq(3), seq(9)),
#             "Bands" = c(3,3,1, rep(3, 9)),
#             "xmin" = c(rep(36.999999999999829, 2), 36.999999999912887, 112.88336000000004,
#                        112.83541705009769, 112.937768283946, 119.08328729311187,
#                        125.17592837655015, 131.09924388775133, 137.00868705528842,
#                        142.77379501269701, 149.13142738567436),
#             "ymin" = c(rep(-90.000000000000114, 2), -89.999999999927979, -43.999919999999932,
#                        -29.022044129373381, -35.243206411137244, -34.485678365543073,
#                        -32.392971412581318, -36.433113792082437, -40.218502521278651,
#                        -43.874979294817379, -38.001474096689194),
#             "xmax" = c(rep(177.49999999999994, 2), 177.50416666652333, 154.00015999999991,
#                        114.69428614392449, 120.84327445064481, 126.91690453584506,
#                        132.82422422328, 139.01199806233561, 145.08487052584266,
#                        150.9784722788807, 154.138797231111),
#             "ymax" = c(rep(-6.0000000000000568, 2), -5.9999999999615738, -8.9999200000000386,
#                        -21.57675537257418, -19.500407285861485, -13.528249947575864,
#                        -11.036517059095111, -10.94622776882979, -8.9425913309250173,
#                        -9.0335232282367439, -19.81251125861273),
#             "offset_x" = c(rep(0.0041666666666666701, 2), 0.0041666666666649995, 0.000319999999999999,
#                            0.00028859945564769406, 0.0002890390174654972, 0.00028761996044695246,
#                            0.00028420704718255926, 0.0002910491843375245, 0.00029864229081663429,
#                            0.00030726826702807633, 0.00029415319540836762),
#             "offset_y" = c(rep(-0.0041666666666666692, 2), -0.0041666666666650004, -0.00031999999999999905,
#                            -0.00028859945564769363, -0.00028903901746549698, -0.00028761996044695268,
#                            -0.00028420704718255894, -0.00029104918433752412, -0.00029864229081663402,
#                            -0.0003072682670280766, -0.00029415319540836843),
#             "origin_x" = c(rep(-1.9895196601282805e-13, 2), -7.2311934218305396e-11, 1.5999999961024969e-04,
#                            -4.3721215149616910e-05, 0.00010779456495413342, -4.9307398626297072e-06,
#                            6.0722510923483242e-05, -7.7557690190133144e-05, -3.3987240527721951e-05,
#                            5.8396766206669781e-05, -0.00012454163231723214),
#             "origin_y" = c(rep(-5.3290705182007514e-14, 2), 3.6026293059876480e-11,  7.9999999934798893e-05,
#                            9.4329469987997072e-05, -0.00010093353426654517, -4.5107953443590532e-05,
#                            9.5204145200256107e-05, 1.3205410449224075e-04, -4.6574711728197826e-05,
#                            -1.4344587832049172e-04, -0.00011693507748233856),
#             "ncol" = c(rep(33719, 2), 33720, 128489,  6440, 27350, 27235, 26910, 27186, 27042, 26701, 17022),
#             "nrow" = c(rep(20159, 2), 20159, 109374, 25797, 54465, 72864, 75143, 87568, 104726, 113390, 61834),
#             'na_val' = c(NA, NA, 9998, rep(NA, 9)),
#             stringsAsFactors = FALSE
#             )
#
## 3857 native
#ga_popl_info <- data.frame(
#  "Type" = rep('Population', 5),
#  "Name" = paste0('NEXIS People per ', c(100, 500, 1000, 5000, 10000), 'm'),
#  "Short_Name" = paste0('PPL_', c(100, 500, 1000, 5000, 10000)),
#  "Service" = rep('NEXIS_Residential_Population_Density', 5),
#  "Layer" = seq(5),
#  "Bands" = rep(1, 5),
#  "xmin" = rep(9726301.1948450655, 5),
#  "ymin" = rep(-5523200.4889020491, 5),
#  "xmax" = rep(18025501.194845065, 5),
#  "ymax" = rep(-542200.48890204879, 5),
#  "offset_x" = rep(100, 5),
#  "offset_y" = rep(-100, 5),
#  "origin_x" = rep(1.19484506547451019, 5),
#  "origin_y" = rep(-0.48890204878989607, 5),
#  "ncol" = rep(82991, 5),
#  "nrow" = rep(49809, 5),
#  "na_val" = rep(NA, 5)
#)
#
##ga_service_info <- rbind(ga_service_info, ga_basemap_info, ga_popl_info)
##usethis::use_data(ga_service_info, overwrite = TRUE)
