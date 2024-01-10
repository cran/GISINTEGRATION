preproc <-
function(d1, d2)
{
      ## ----- Data Preparation ------
names(d1) <- tolower(names(d1))
names(d2) <- tolower(names(d2))

#Function for removing Punctuation mark without remove space between them
replacePunctuation <- content_transformer(function(x) {return (gsub("[[:punct:]]"," ", x))}) 

cnd3 <- Corpus(VectorSource(names(d1)))
cnd4 <- tm_map(cnd3, replacePunctuation )

names(d1) <- t(as.matrix(data.frame(cnames=get('content', cnd4))))

cnd <- Corpus(VectorSource(names(d2)))
cnd2 <- tm_map(cnd, replacePunctuation )

names(d2) <- t(as.matrix(data.frame(cnames=get('content', cnd2))))

##Removing possible empty spaces created at the beginning and end of variable names after removing punctuation marks
names(d1) <- trimws(names(d1))
names(d2) <- trimws(names(d2))

## ---- Names of variables before finding synonyms
name_initial1 <- names(d1)
name_initial2 <- names(d2)

## ---- Finding synonyms by syn package ----
ii = c()
cc = c()
for(i in 1:length(syns(names(d1)))){
if(sum(names(d2)[names(d2) %in% syns(names(d1))[[i]]] != names(d1)[i])!= 0 )
{
ii = c(ii,i) # Changes related to the first data set
cc1 = which(names(d2) %in% syns(names(d1))[[i]])
cc = c(cc,cc1) #Changes related to the second data set
names(d2)[names(d2) %in% syns(names(d1))[[i]]] <- names(d1)[i]
}
} 

var_d2 <-  names(d2)[cc]     #Variables that have been changed after preprocessing
var_init_d2 <- name_initial2[cc] #Initial variables 

# Substituting a few well-known variables for assimilation
names(d1) <- gsub("first name","name1",names(d1))
names(d1) <- gsub("last name","name2",names(d1))

names(d2) <- gsub("first name","name1",names(d2))
names(d2) <- gsub("last name","name2",names(d2))

names(d1) <- gsub("first","name1",names(d1))
names(d1) <- gsub("last","name2",names(d1))

names(d2) <- gsub("first","name1",names(d2))
names(d2) <- gsub("last","name2",names(d2))

names(d1) <- gsub("gender","sex",names(d1))
names(d2) <- gsub("gender","sex",names(d2))


# Remove the space between the variable name
names(d1) <- str_replace_all(names(d1),' ','')
names(d2) <- str_replace_all(names(d2),' ','')


mylist <- list(var_d2 = var_d2, cls_var_d2 = class(var_d2),
  var_init_d2 = var_init_d2, cls_var_init_d2 = class(var_init_d2), 
  head_changed_data1 = head(d1[ii]),
  head_changed_data2 = head(d2[cc]),
  num_changed_var_d1 = ii,
  num_changed_var_d2 = cc,
  name_d1 = names(d1), name_initial1 = name_initial1,
  name_d2 = names(d2), name_initial2 = name_initial2,
  d1 = d1, d2 = d2)

attr(mylist, "class") <- "explain"
return(mylist)
}

##
print.explain <-
function(x, ...) 
{
if (length(x$var_d2) == 0) {
       message("No variable names have been changed.")
       } else {
message("Changed variable's names are:")
      message(paste(x$var_d2),'\n')     
message("Changed variable's classes are:")
message(paste(class(x$var_d2),'\n'))
message("Initial variable's names for changed variable's names are:")
      message(paste(x$var_init_d2),'\n')  
message("Initial variable's classes are:")
message(paste(class(x$var_init_d2), '\n')) 
message("A number of changed variable values for the first dataset are:\n")
print(head(x$d1[x$num_changed_var_d1]))
message("A number of changed variable values for the second dataset are:\n")
print(head(x$d2[x$num_changed_var_d2]))
message("Number of changed variable's names are:\n", x$num_changed_var_d1,"\n")
}
}

