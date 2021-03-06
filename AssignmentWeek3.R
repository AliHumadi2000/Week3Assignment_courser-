#set work dirctory 
setwd('G:\\Data Science\\Coursera')
getwd()
#makeCacheMatrix: This function creates a special "matrix" 
#object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL # hold the inverse of a matrix
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() {x}
  setinverse <- function(inverse){ 
    # set the value of the matrix and clear the value of inverse matrix
    # The "<<-" operator used to set variable that already exists 
 
    i <<- inverse}
  getinverse <- function() {i}
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}
#cacheSolve: This function computes the inverse of the special "matrix" 
#returned by makeCacheMatrix above. If the inverse has already been 
#calculated (and the matrix has not changed),
#then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i # return inverse matrix
}
#demo for the program
B <- matrix(c(1,2,3,4),2,2)
B
B1 <- makeCacheMatrix(B)
B1
cacheSolve(B1)
