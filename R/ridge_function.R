
#' Fit a ridge regression model
#'
#' @description This function passes parameters to the ridge_reg function.
#' @param form a formula
#' @param lambda a lambda value
#' @param d a data.frame
#' @return An ridge_reg object
#' @import stats MASS
#' @examples
#' fit = ridge_reg(Sepal.Length~., 2, iris)
#' @export

ridge_reg = function(form, lambda, d){
  rownames(d) = NULL #without this statement, rownames(m) dimension was set with a boundary limit as d's dimension has
  m = model.matrix(form, d) 
  y = matrix(d[,as.character(form)[2]], ncol = 1)
  y = y[as.numeric(rownames(m)),,drop = FALSE]
  #beta  = solve(t(m)%*% + labmda * diag(rep(1,ncol(m))))%*% t(m)%*%y
  svd_obj = svd(m)
  U = svd_obj$u
  V = svd_obj$v
  svals = svd_obj$d
  
  D = diag(svals / (svals^2 + lambda))
  beta = V %*% D%*% t(U) %*% y
  rownames(beta) = colnames(m) #as.character(form) [-(1:2)]
  ret = list(coefficients = beta, lambda = lambda, form = form)
  class(ret) = "ridge_reg"
  ret
}

predict_ridge_reg = function(object, ...){#pass variable names
  newdata = list(...)[[1]]
  m = model.matrix(object$form, newdata)
  #args = as.list(match.call()) 
  #newdata = eval(args[[3]])
  m %*% object$coefficient
}