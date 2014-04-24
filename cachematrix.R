## The two functions below can be used to create a special object that stores a numeric matrix and caches its inverse.

## This function creates a special vector which is a list of functions to:
## 1. set the matrix values
## 2. get the matrix values
## 3. set the inverse of the matrix
## 4. get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <- function(y) {
		x<<-y
		i<<-NULL
	}
	get <- function() x
	setInverse <- function(inverse) i <<- inverse
	getInverse <- function() i
	list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## The following function calculates the inverse of the matrix created with the above function, but it first checks if the inverse matrix has already been calculated. If so, it gets the inverse from the cache and skips the computation. If the inverse matrix is not cached it calculates the inverse matrix and sets the values in the cache using the setIverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	i <- x$getInverse()
	if(!is.null(i)) {
		message("getting cached data")
		return(i)
	}
	data <- x$get()
	i <- solve(data, ...)
	x$setInverse(i)
	i
}
