# calc raster::origin for GA products
options(digits = 22)
# formula adapted from https://github.com/rspatial/raster/blob/master/R/origin.R
orig <- function(xmin = NULL, ymin = NULL, xmax = NULL, ymax = NULL,
                 cell_x = NULL, cell_y = NULL) {
  e <- c('xmin' = xmin, 'ymin' = ymin, 'xmax' = xmax,'ymax' = ymax)

  r <- abs(c(cell_x, cell_y))

  x <- e['xmin'] - r[1]*(round(e['xmin'] / r[1]))
  y <- e['ymax'] - r[2]*(round(e['ymax'] / r[2]))

  if (isTRUE(all.equal((r[1] + x), abs(x)))) {
    x <- abs(x)
  }
  if (isTRUE(all.equal((r[2] + y), abs(y)))) {
    y <- abs(y)
  }
  return(c(x, y))
}

# DEM_SRTM_1Second_over_Bathymetry_Topography_1
orig(91.997360943325319, -60.002824466238778, 171.99763936110531, -8.0022684946787805,
     0.00027777777999999997, -0.00027777777999999997)

# 25m lidar
orig(113.76023194201119, -43.996225096314618, 156.7806037200736, -9.2055912338565218,
     0.00023999002436732555 , -0.00023999002436732563)

# 5m lidar
orig(113.76023292500008, -45.949852453747006, 162.00003317680361, -9.2055683139999545,
     4.4915764205976067e-005, -4.4915764205976074e-005)
