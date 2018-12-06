context('get_data')

# can only cover the fails :/
test_that(
  'get_ga_data functions as expected',
  c(
    expect_error(geosciausws:::get_ga_data('Fairies', c(143.75, -40.17, 143.751, -40.169))),
    expect_error(geosciausws:::get_ga_data('SRTM_DEMS', c(1,1,2,2))),
    expect_error(geosciausws:::get_ga_data('SRTM_DEMS', 'not a bbox'))
  )
)
