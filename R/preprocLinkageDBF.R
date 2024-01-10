preprocLinkageDBF <- function (d1, d2, chz = "NULL", var = "area", threshold = 0.9) 
{
    dd <- create_new_data(d1, d2, chz = chz)
    data1 <- dd$data1
    data2 <- dd$data2
    res <- RLBigDataLinkage(dataset1 = data1, dataset2 = data2, 
        strcmp = TRUE, blockfld = var)
    res1 <- epiWeights(res)
    result <- epiClassify(rpairs = res1, threshold.upper = threshold)
    finalres <- getPairs(result, min.weight = 0.7, filter.link = "link")
    finalres2 <- finalres[-seq(0, nrow(finalres), by = 3)[-1], ]
    
    rows <- 1:(nrow(finalres2)/2)
    number_int <- rep(rows, each = 2)
    number_int[seq(0, length(number_int), by = 2)[-1]] = " "
    if (nrow(finalres2) == 0) {
        return(message("No special Linkage has been done."))
    }
    finalres2 <- cbind(number_int, finalres2)
    dataset <- rep(c("dataset1", "dataset2"), length(rows))
    finalres2 <- cbind(finalres2, dataset)
   
    dif1 <- setdiff(names(d1), names(data1))
    dif2 <- setdiff(names(d2), names(data2))
    finalres3 <- finalres2[-length(finalres2)]
    data3 <- cbind(data1, d1[dif1])
    data4 <- cbind(data2, d2[dif2])
    mat1 <- matrix(data = NA, ncol = length(setdiff(names(data4), 
        names(data3))), nrow = nrow(data3))
    colnames(mat1) <- setdiff(names(data4), names(data3))
    data5 <- cbind(data3, mat1)
    mat2 <- matrix(data = NA, ncol = length(setdiff(names(data3), 
        names(data4))), nrow = nrow(data4))
    colnames(mat2) <- setdiff(names(data3), names(data4))
    data6 <- cbind(data4, mat2)
    d3 <- data5[seq(1, (length(finalres3$id)) - 1, by = 2), ]
    d4 <- data6[seq(0, length(finalres3$id), by = 2)[-1], ]
    mm <- c()
    for (x in seq(1, nrow(finalres3), by = 2)) {
        mm1 <- rbind(cbind(data5[finalres3[x, ]$id, ][dif1], 
            data5[finalres3[x, ]$id, ][dif2]), cbind(data6[finalres3[(x + 
            1), ]$id, ][dif1], data6[finalres3[(x + 1), ]$id, 
            ][dif2]))
        mm <- rbind(mm, mm1)
    }
    if (sum(dim(mm)) != 0) {
        finalres4 <- cbind(finalres3, mm)
    }
    else {
        finalres4 <- finalres3
    }
    mm <- c()
    for (x in seq(1, nrow(finalres4), by = 2)) {
        mm1 <- cbind(finalres4[x, ], finalres4[(x + 1), ])
        mm <- rbind(mm, mm1)
    }
    finalres4 <- mm
    fat2 <- list(dbf=finalres4)
    write.dbf(fat2, "gis_res2.dbf")
}
