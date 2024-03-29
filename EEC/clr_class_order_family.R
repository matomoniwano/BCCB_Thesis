#=========================================================================
  #class
#=========================================================================
  
  
clr_class_EEC <-  merge_EEC %>% 
  dplyr::select(2:29, 33) %>% 
  group_by(Class) %>% 
  summarise_all(funs(sum)) 

# Make taxonomy name as rownames
row.names(clr_class_EEC) <- clr_class_EEC$Class
clr_class_EEC$Class <- NULL

# Pruning ASV that represents <1% of all ASVs
clr_class_EEC$condition <- rowSums(clr_class_EEC) / sum(clr_class_EEC) * 100 > 1
clr_class_EEC$rn <- rownames(clr_class_EEC)
clr_class_EEC <- clr_class_EEC[clr_class_EEC$condition == TRUE,]
row.names(clr_class_EEC) <- clr_class_EEC$rn
clr_class_EEC$condition <- NULL
clr_class_EEC$rn <- NULL

# make samples into rows

clr_class_EEC_t <- t(clr_class_EEC)

# if the value in the table is 0, add a small constant 0.1 to make sure we can take the log
clr_class_EEC_t[clr_class_EEC_t == 0] <- 0.1
rm(clr_class_EEC)

# CLR transformation on OTU table
# CLR = taking log from ratio calculated by proportion of each ASVs within a sample

clr_class_EEC <- t(clr(clr_class_EEC_t, ifwarn = FALSE))
rm(clr_class_EEC_t)
#=========================================================================
# Order
#=========================================================================

clr_order_EEC <-  merge_EEC %>% 
  dplyr::select(2:29, 34) %>% 
  group_by(Order) %>% 
  summarise_all(funs(sum)) 

# Make taxonomy name as rownames
row.names(clr_order_EEC) <- clr_order_EEC$Order
clr_order_EEC$Order <- NULL


# Pruning ASV that represents <1% of all ASVs
clr_order_EEC$condition <- rowSums(clr_order_EEC) / sum(clr_order_EEC) * 100 > 1
clr_order_EEC$rn <- rownames(clr_order_EEC)
clr_order_EEC <- clr_order_EEC[clr_order_EEC$condition == TRUE,]
row.names(clr_order_EEC) <- clr_order_EEC$rn
clr_order_EEC$condition <- NULL
clr_order_EEC$rn <- NULL

# make samples into rows

clr_order_EEC_t <- t(clr_order_EEC)
rm(clr_order_EEC)

# if the value in the table is 0, add a small constant 0.1 to make sure we can take the log
clr_order_EEC_t[clr_order_EEC_t == 0] <- 0.1

# CLR transformation on OTU table
# CLR = taking log from ratio calculated by proportion of each ASVs within a sample

clr_order_EEC <- t(clr(clr_order_EEC_t, ifwarn = FALSE))

rm(clr_order_EEC_t)
#==========================================================================
# Family
#==========================================================================


clr_family_EEC <-  merge_EEC %>% 
  dplyr::select(2:29, 35) %>% 
  group_by(Family) %>% 
  summarise_all(funs(sum)) 

# Make taxonomy name as rownames
row.names(clr_family_EEC) <- clr_family_EEC$Family
clr_family_EEC$Family <- NULL

# Pruning ASV that represents <1% of all ASVs
clr_family_EEC$condition <- rowSums(clr_family_EEC) / sum(clr_family_EEC) * 100 > 1
clr_family_EEC$rn <- rownames(clr_family_EEC)
clr_family_EEC <- clr_family_EEC[clr_family_EEC$condition == TRUE,]
row.names(clr_family_EEC) <- clr_family_EEC$rn
clr_family_EEC$condition <- NULL
clr_family_EEC$rn <- NULL

# make samples into rows

clr_family_EEC_t <- t(clr_family_EEC)

# if the value in the table is 0, add a small constant 0.1 to make sure we can take the log
clr_family_EEC_t[clr_family_EEC_t == 0] <- 0.1
rm(clr_family_EEC)

# CLR transformation on OTU table
# CLR = taking log from ratio calculated by proportion of each ASVs within a sample

clr_family_EEC <- t(clr(clr_family_EEC_t, ifwarn = FALSE))

rm(clr_family_EEC_t)