context('metadata')

test_that(
  'metadata_lscape works',
  c(
    expect_error(geosciausws::metadata_ga('ASPCT')),
    expect_error(geosciausws::metadata_ga('SRTM_DEM', format = 'JSON'))
  )
)
