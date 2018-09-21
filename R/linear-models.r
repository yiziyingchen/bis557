
#' Fit a linear model
#'
#' @description This function passes parameters to the lm function.
#' @param formula a formula
#' @param data a data.frame
#' @return An lm object
#' @importFrom stats lm
#' @import stats model.frame model.matrix
#' @examples
#' @export
linear_model <- function(formula, data) {
    X = stats::model.matrix(formula, data)
    Y= stats::model.frame(formula,data)[,1]
    beta <- qr.solve(X,Y)
    for (i in 1:length(beta)){
        if (beta[i] == 0)
        beta[i] = NA
        
    }
    ret <- list()
    ret$coefficients = c(beta)
    class(ret) = "lm"
    return(ret)
}
