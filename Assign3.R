## First, create an input x as a matrix
##Second, set the inverse as a NULL
## Third, change "mean" to "solve"


setwd('C:/Users/marjo/Desktop/RStudio')

makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {   ##1
  s <- NULL                                                      ##2
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

##Repeat the past steps
## Change "mean" to "solve"
## Getting the cache data


cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {              ## Condition to check if the inverse is null
    message('getting cached data')
    return(s)                    ## Return inverse value
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}

f <- makeCacheMatrix(matrix(1:4,2,2))

f$get()

f$getsolve()

cacheSolve(f)

