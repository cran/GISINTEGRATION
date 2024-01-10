create_new_data <-
function(d1, d2, chz = "NULL"){

pre_d <- preproc(d1, d2)

names(d1) <- pre_d$name_d1
names(d2) <- chzInput(d1, d2, chz = chz)

d1 <- d1[sort(names(d1))]
d2 <- d2[sort(names(d2))]

data1 <- d1[intersect(names(d1),names(d2))] #Finding intersections columns
data2 <- d2[intersect(names(d1),names(d2))] #Finding intersections columns

data1 <- lapply(data1, tolower)
data2 <- lapply(data2, tolower)

if(sum(names(d1)=="gender")>0)
{
data1$gender[data1$gender=="male"] <- "m"
data1$gender[data1$gender=="female"] <- "f"

data2$gender[data2$gender=="male"] <- "m"
data2$gender[data2$gender=="female"] <- "f"
}

if(sum(names(d1)=="sex")>0)
{
data1$sex[data1$sex=="male"] <- "m"
data1$sex[data1$sex=="female"] <- "f"

data2$sex[data2$sex=="male"] <- "m"
data2$sex[data2$sex=="female"] <- "f"
}

data1 <- data.frame(data1)
data2 <- data.frame(data2)
return(list(data1 = data1,data2 = data2))
}
