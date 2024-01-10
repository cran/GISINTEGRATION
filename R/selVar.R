selVar <-
function(d1, d2, chz = "NULL")
{
message("please select variables from this function's output and set var arqument 
in the preprocLinkage function\n")
dd <- create_new_data(d1, d2, chz)

data1 <- dd$data1
data2 <- dd$data2

name_int <- names(data1)  #Intersection's names
return(name_int)
}
