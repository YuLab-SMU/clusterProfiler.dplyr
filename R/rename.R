
##' @method rename enrichResult
##' @export
rename.enrichResult <- function(.data, ...) {
    dots <- quos(...)
    .data@result %<>% rename(!!!dots,)
    return(.data)
}

##' @method rename gseaResult
##' @export
rename.gseaResult <- rename.enrichResult
