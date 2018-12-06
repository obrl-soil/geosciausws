#' download GA web service metadata
#'
#' Retrieves metadata from Geoscience Australia WCS
#' endpoints in XML or list format.
#'
#' @param product Character, one of the options from column 'Short_Name' in
#'   \code{\link[geosciausws:ga_service_info]{ga_service_info}}.
#' @param req_type Character; one of 'cap' or 'desc'. Defaults to 'desc'.
#' @param format Character; one of 'xml' or 'native'. Defaults to 'native'.
#' @return A list or xml document object, depending on the value of 'format'.
#' @note WCS services < v 2.0 can only return XML formatted data; JSON is not an
#'   option.
#' @importFrom httr GET content
#' @importFrom xml2 as_list
#' @export
#'
metadata_ga <- function(product  = NULL,
                        req_type = 'desc',
                        format   = 'native') {

  req_type <- match.arg(req_type, c('cap' , 'desc'))
  format <- match.arg(format, c('native', 'xml'))
  this_url <-
    switch(req_type,
           'cap'  = make_ga_url(product = product, req_type = 'cap'),
           'desc' = make_ga_url(product = product, req_type = 'desc'))

  this_metadata <- httr::GET(url = this_url) # WCS < 2.0 won't return JSON ;_;

  if(format == 'native') {
    xml2::as_list(content(this_metadata, encoding = 'UTF-8'))
  } else {
    content(this_metadata, encoding = 'UTF-8')
  }
}
