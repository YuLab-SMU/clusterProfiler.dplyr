##' @method select enrichResult
##' @export
select.enrichResult <- function(.data, ...) {
    dots <- quos(...)
    .data@result %<>% select(!!!dots,)
    return(.data)
}

##' @method select gseaResult
##' @export
select.gseaResult <- select.enrichResult

