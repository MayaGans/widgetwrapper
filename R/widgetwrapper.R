#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
widgetwrapper <- function(message, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    message = message,
    selections = 1:3
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'widgetwrapper',
    x,
    width = width,
    height = height,
    package = 'widgetwrapper',
    elementId = elementId
  )
}

#' Shiny bindings for widgetwrapper
#'
#' Output and render functions for using widgetwrapper within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a widgetwrapper
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name widgetwrapper-shiny
#'
#' @export
widgetwrapperOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'widgetwrapper', width, height, package = 'widgetwrapper')
}

#' @rdname widgetwrapper-shiny
#' @export
renderWidgetwrapper <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, widgetwrapperOutput, env, quoted = TRUE)
}

widgetwrapper_html <- function(...) {

  # HELP can I pull this from ...?
  selections <- 1:3

  htmltools::tags$div(
    htmltools::tags$select(
      purrr::map(selections, ~htmltools::tags$option(.x))
    ),
    htmltools::tags$div(...)
  )
}
