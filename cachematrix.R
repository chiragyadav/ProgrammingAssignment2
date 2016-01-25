## 

## This gunction will create a special matrix which basically return a list a 4 functions

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## this functions returns the cached inverse of the matrix if available otherwise would calculate one and cache it for next time 

cacheSolve <- function(x, ...) {
	  inv <- x$getinverse()
	  if(!is.null(inv)) {
		message("getting cached data")
		return(inv)
	  }
	  data <- x$get()
	  inv <- solve(data)
	  x$setinverse(inv)
	  inv
}
