#' Example that calls rgl
#'
#' This function has an example that calls [rgl::open3d()].
#' @return Returns `NULL` invisibly.
#' @examples
#' if (requireNamespace("rgl", quietly = TRUE)) {
#'   rgl::open3d()
#'   rgl::close3d()
#' }
#' @export
return_nothing <- function() {
    invisible(NULL)
}
