context('url_generator')

test_that(
  'ga url generates correctly',
  c(
    # testing on caloundra with a plain vector aoi
    aoi <- c(153.12, -26.81, 153.15, -26.78),
    val1 <- geosciausws:::make_ga_url('SRTM_DEMS', aoi),
    expect_is(val1, 'character'),
    expect_equal(nchar(val1), 257),
    expect_equal(val1, "http://services.ga.gov.au/gis/services/DEM_SRTM_1Second/MapServer/WCSServer?REQUEST=GetCoverage&SERVICE=WCS&VERSION=1.0.0&COVERAGE=1&CRS=EPSG:4283&BBOX=153.119861113365,-26.8101389007338,153.150138891142,-26.7798611229565&WIDTH=109&HEIGHT=109&FORMAT=GeoTIFF"),
    expect_error(geosciausws:::make_ga_url('bigfoot', aoi)),
    expect_error(geosciausws:::make_ga_url('SRTM_DEMS', 'leprechauns')),
    val2 <- geosciausws:::make_ga_url('SRTM_DEMS', req_type = 'desc'),
    expect_equal(val2, "http://services.ga.gov.au/gis/services/DEM_SRTM_1Second/MapServer/WCSServer?REQUEST=DescribeCoverage&SERVICE=WCS&VERSION=1.0.0&COVERAGE=1"),
    val3 <- geosciausws:::make_ga_url('SRTM_DEMS', req_type = 'cap'),
    expect_equal(val3, "http://services.ga.gov.au/gis/services/DEM_SRTM_1Second/MapServer/WCSServer?REQUEST=GetCapabilities&SERVICE=WCS&VERSION=1.0.0"),
    expect_error(geosciausws:::make_ga_url('SRTM_DEMS', req_type = 'capybara')),
    expect_error(geosciausws:::make_ga_url(req_type = 'capybara'))
    )
)
