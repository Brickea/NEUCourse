# OopDemo.R
# R 3.3.2

# S4 OOP
Person = setClass(
 "Person",

  slots = c(
   empID = "integer",
   lastName = "character",
   hireDate = "character",
   payRate = "numeric"
  )
)

setMethod(f="initialize", signature="Person",
 definition=function(.Object) {
  .Object@empID <- as.integer(-1)
  .Object@lastName <- "NONAME"
  .Object@hireDate <- "1990-01-01"
  .Object@payRate <- 0.01
  return(.Object)
 }
)

setGeneric(name="display", def=function(obj) {
 standardGeneric("display")
 }
)

setMethod(f="display", signature="Person",
 definition=function(obj) {
  cat("Employee ID :", obj@empID, "\n")
  cat("Last Name   :", obj@lastName, "\n")
  cat("Hire Date   :", obj@hireDate, "\n")
  cat("Pay Rate    : $", obj@payRate, "\n\n")
 }
)

setGeneric(name="yearsService", def=function(obj) {
 standardGeneric("yearsService")
 }
)

setMethod(f="yearsService", signature="Person",
 definition=function(obj) {
  hd <- as.POSIXlt(obj@hireDate)
  today <- as.POSIXlt(Sys.Date())
  yrs <- today$year - hd$year
  if (today$mon < hd$mon || (today$mon == hd$mon &&
   today$mday < hd$mday)) {
   yrs <- yrs - 1
  } 
  return(yrs)
 }
)

# ==

cat("\nBegin OOP with S4 demo \n\n")

cat("Creating Person p1 with initialize() values \n\n")
p1 <- new("Person")  # could use p1 <- Person()
display(p1)  # could use print(p1)

cat("Setting p1 fields directly \n\n")
p1@empID <- as.integer(65565)
p1@lastName <- "Adams"
p1@hireDate <- "2010-09-15"
p1@payRate <- 43.21
display(p1)

cat("Calling yearsService() \n\n")
tenure <- yearsService(p1)
cat("Person p1 tenure = ", tenure, " years \n")

cat("Making a value-copy of p1 using '<-' \n\n")
p2 <- p1

cat("\nEnd OOP with S4 demo \n\n")
