#=========================================================================
  #class
#=========================================================================

clr_class_peakpoc <-  merge_peakpoc %>% 
  dplyr::select(2:25, 29) %>% 
  group_by(Class) %>% 
  summarise_all(funs(sum)) 

clr_class_peakpoc <- clr_class_peakpoc[-1,] # Removing first rows since the taxonomy name is unknown.

# Make taxonomy name as rownames
row.names(clr_class_peakpoc) <- clr_class_peakpoc$Class
clr_class_peakpoc$Class <- NULL

# make samples into rows

clr_class_peakpoc_t <- t(clr_class_peakpoc)

# if the value in the table is 0, add a small constant 0.1 to make sure we can take the log
clr_class_peakpoc_t[clr_class_peakpoc_t == 0] <- 0.1
rm(clr_class_peakpoc)

# CLR transformation on OTU table
# CLR = taking log from ratio calculated by proportion of each ASVs within a sample

clr_class_peakpoc <- t(clr(clr_class_peakpoc_t, ifwarn = FALSE))
rm(clr_class_peakpoc_t)

clr_class_peakpoc <- clr_class_peakpoc[c(-3,-4,-12, -17,-19),]
#=========================================================================
# Order
#=========================================================================

clr_order_peakpoc <-  merge_peakpoc %>% 
  dplyr::select(2:25, 30) %>% 
  group_by(Order) %>% 
  summarise_all(funs(sum)) 

clr_order_peakpoc <- clr_order_peakpoc[c(-1, -44),] # Removing first and last rows since the taxonomy name is unknown.


# Make taxonomy name as rownames
row.names(clr_order_peakpoc) <- clr_order_peakpoc$Order
clr_order_peakpoc$Order <- NULL

# Pruning ASV that represents <5% of all ASVs

clr_order_peakpoc$condition <- rowSums(clr_order_peakpoc) / sum(clr_order_peakpoc) * 100 > 1
clr_order_peakpoc$rn <- rownames(clr_order_peakpoc)
clr_order_peakpoc <- clr_order_peakpoc[clr_order_peakpoc$condition == TRUE,]
row.names(clr_order_peakpoc) <- clr_order_peakpoc$rn
clr_order_peakpoc$condition <- NULL
clr_order_peakpoc$rn <- NULL

# make samples into rows

clr_order_peakpoc_t <- t(clr_order_peakpoc)
rm(clr_order_peakpoc)

# if the value in the table is 0, add a small constant 0.1 to make sure we can take the log
clr_order_peakpoc_t[clr_order_peakpoc_t == 0] <- 0.1

# CLR transformation on OTU table
# CLR = taking log from ratio calculated by proportion of each ASVs within a sample

clr_order_peakpoc <- t(clr(clr_order_peakpoc_t, ifwarn = FALSE))

rm(clr_order_peakpoc_t)
#==========================================================================
# Family
#==========================================================================


clr_family_peakpoc <-  merge_peakpoc %>% 
  dplyr::select(2:25, 31) %>% 
  group_by(Family) %>% 
  summarise_all(funs(sum)) 

clr_family_peakpoc <- clr_family_peakpoc[c(-1, -81),] # Removing first and last rows since the taxonomy name is unknown.

# Make taxonomy name as rownames
row.names(clr_family_peakpoc) <- clr_family_peakpoc$Family
clr_family_peakpoc$Family <- NULL

# Pruning ASV that represents <5% of all ASVs

clr_family_peakpoc$condition <- rowSums(clr_family_peakpoc) / sum(clr_family_peakpoc) * 100 > 1
clr_family_peakpoc$rn <- rownames(clr_family_peakpoc)
clr_family_peakpoc <- clr_family_peakpoc[clr_family_peakpoc$condition == TRUE,]
row.names(clr_family_peakpoc) <- clr_family_peakpoc$rn
clr_family_peakpoc$condition <- NULL
clr_family_peakpoc$rn <- NULL

# make samples into rows

clr_family_peakpoc_t <- t(clr_family_peakpoc)

# if the value in the table is 0, add a small constant 0.1 to make sure we can take the log
clr_family_peakpoc_t[clr_family_peakpoc_t == 0] <- 0.1
rm(clr_family_peakpoc)

# CLR transformation on OTU table
# CLR = taking log from ratio calculated by proportion of each ASVs within a sample

clr_family_peakpoc <- t(clr(clr_family_peakpoc_t, ifwarn = FALSE))

rm(clr_family_peakpoc_t)