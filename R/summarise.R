##' @method summarise enrichResult
##' @export
summarise.enrichResult <- function(.data, ...) {
    dots <- quos(...)
    .data@result %>% summarise(!!!dots)
}


##' @method summarise gseaResult
##' @export
summarise.gseaResult <- summarise.enrichResult
