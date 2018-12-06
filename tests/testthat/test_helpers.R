context('helpers')

test_that(
  'transform_bb functions as expected',
  c(
    # function is only called when its clear that data is not already in 4283
    # see helpers.R lines 144-157
    # testing on Caloundra in UTM
    aoi1 <- structure(c(511925.77199888945, 7034599.92066977173,
                        514911.14007353014, 7037925.77298878692 ),
                     names = c("xmin", "ymin", "xmax", "ymax"),
                     class = "bbox", crs = sf::st_crs(28356)),
    val1 <- geosciausws:::transform_bb(aoi1),
    expect_is(val1, 'bbox'),
    expect_equal(attr(val1, 'crs')$epsg, 4283),
    expect_equivalent(val1[1], 153.119968441846055),
    expect_equivalent(val1[2], -26.810028607411326),
    expect_equivalent(val1[3], 153.150039458082318),
    expect_equivalent(val1[4], -26.779971414629362),
    # now test in 3577
    aoi2 <- structure(c(2064720.4872439757, -3077048.1701908340,
                        2068181.0507771801, -3073243.8041624278),
                     names = c("xmin", "ymin", "xmax", "ymax"),
                     class = "bbox", crs = sf::st_crs(3577)),
    val2 <- geosciausws:::transform_bb(aoi2),
    expect_is(val2, 'bbox'),
    expect_equal(attr(val2, 'crs')$epsg, 4283),
    expect_equivalent(val2[1], 153.114439629533194),
    expect_equivalent(val2[2], -26.814266501844575),
    expect_equivalent(val2[3], 153.155569390528228),
    expect_equivalent(val2[4], -26.775732470888371)
    # val1 and val2 aren't 1000% equal but that's ok, they're pretty damn close
  )
)

test_that(
  'align_aoi functions as expected',
  c(
    aoi <- structure(c(143.75, -40.17, 144.18, -39.57),
                      names = c("xmin", "ymin", "xmax", "ymax"),
                      class = "bbox", crs = sf::st_crs(4283)),
    val1 <- geosciausws:::align_aoi(aoi, 'SRTM_DEMS'),
    expect_is(val1, 'bbox'),
    expect_equal(attr(val1, 'crs')$epsg, 4283),
    expect_is(val2, 'bbox'),
    expect_equal(attr(val2, 'crs')$epsg, 4283),
    expect_equivalent(val1[1], 143.749861113513248),
    expect_equivalent(val1[2], -40.170138900522332),
    expect_equivalent(val1[3], 144.180138891284230),
    expect_equivalent(val1[4], -39.569861122754055),
    val2 <- geosciausws:::align_aoi(aoi, 'SRTM_DEMS', snap = 'in'),
    # in is inside out
    expect_true(val1[[1]] < val2[[1]]),
    expect_true(val1[[2]] < val2[[2]]),
    expect_true(val1[[3]] > val2[[3]]),
    expect_true(val1[[4]] > val2[[4]]),
    # by only one cell
    expect_equivalent(val1[1] - val2[1], -0.000277777777),
    expect_equivalent(val1[2] - val2[2], -0.000277777777),
    expect_equivalent(val1[3] - val2[3], 0.000277777777),
    expect_equivalent(val1[4] - val2[4], 0.000277777777),
    val3 <- geosciausws:::align_aoi(aoi, 'SRTM_DEMS', snap = 'near'),
    # near is near
    expect_true(val1[[1]] == val3[[1]]),
    expect_true(val1[[2]] != val3[[2]]),
    expect_error(geosciausws:::align_aoi(aoi, 'SRTM_DEMS', snap = 'wherever'))
  )
)

test_that(
  'validate_aoi functions as expected',
  c(
    aoi <- structure(c(143.75, -40.17, 144.18, -39.57),
                     names = c("xmin", "ymin", "xmax", "ymax"),
                     class = "bbox", crs = sf::st_crs(4283)),
    val1 <- geosciausws:::validate_aoi(aoi, 'SRTM_DEMS'),
    expect_is(val1, 'bbox'),
    expect_equal(attr(val1, 'crs')$epsg, 4283),
    expect_error(geosciausws:::validate_aoi(aoi, 'SA')),
    aoi_simple <- c(143.75, -40.17, 144.18, -39.57),
    val2 <- geosciausws:::validate_aoi(aoi_simple, 'SRTM_DEMS'),
    expect_equal(val1, val2),
    aoi_raster <- raster::extent(sf::st_sf(sf::st_as_sfc(val1), 4283)),
    val4 <- geosciausws:::validate_aoi(aoi_raster, 'SRTM_DEMS'),
    expect_equal(val1, val4)#,
    #library(raster),
    #data('ki_surface_clay'),
    #val5 <- geosciausws:::validate_aoi(ki_surface_clay, 'NAT'),
    #val6 <- geosciausws:::validate_aoi(raster::extent(ki_surface_clay), 'NAT'),
    #expect_equivalent(val5, val6),
    #expect_error(geosciausws:::validate_aoi('1', 'NAT')),
    #val7 <- sf::st_as_sfc(aoi, crs = 4283),
    #expect_equal(geosciausws:::validate_aoi(val7, 'NAT'), val1),
    #val8 <- st_bbox(sf::st_transform(sf::st_as_sfc(aoi, crs = 4283), 28356)),
    #val9 <- val8,
    #attr(val9, 'crs')$epsg <- NA,
    #expect_equal(geosciausws:::validate_aoi(val8, 'NAT'), geosciausws:::validate_aoi(val9, 'NAT')),
    #expect_equal(geosciausws:::validate_aoi(val9, 'NAT'), geosciausws:::validate_aoi(val9, 'NAT'))
  )
)
