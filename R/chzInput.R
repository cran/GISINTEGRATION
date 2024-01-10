chzInput <-
function(d1, d2, chz = "NULL"){
pre_d <- preproc(d1, d2)
#ii <- pre_d$num_changed_var
cc <- pre_d$num_changed_var_d2

pre_d$name_d2[cc[chz]] <- pre_d$name_initial2[cc[chz]]

if (length(pre_d$name_initial2[cc[chz]]) == 0) {
          message("No variable names have been changed.")
    return(pre_d$name_d2)
     } else {
      return(pre_d$name_d2)
         }
}
