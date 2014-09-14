#' jdf class combines structured JSON (as a data.frame) with remaining
#' parsed JSON
#' 
#' @name jdf
NULL

#' @export
#' @rdname jdf
as.jdf <- function(x, ...) UseMethod("as.jdf")

#' @export
#' @rdname jdf
as.jdf.jdf <- function(x, ...) x

#' @rdname jdf
#' #' @export
is.jdf <- function(x) inherits(x, "jdf")

#' Turns a character vector into a jdf object
#' @param x character vector of json
#' @rdname jdf
#' @export
as.jdf.character <- function(x, ...) {

  # Parse the json
  json <- lapply(x, fromJSON)

  # Setup document ids
  ids <- data.frame(document.id = seq_along(json))

  # Return a structure with JSON as an attribute
  structure(ids, JSON = json, class = c("jdf", "data.frame"))

}