## To write a pair of functions that cache the inverse of a matrix.

## creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {  
        m <- NULL                    
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(inv) m <<- inv
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}



## calculates the mean of the special "vector" created with the above function

cacheSolve <- function(x, ...) {
      m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}

