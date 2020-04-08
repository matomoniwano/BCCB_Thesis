#=========================================================================
  #class
#=========================================================================
  
  
clr_class_jp <-  merge_jp %>% 
  dplyr::select(2:17, 21) %>% 
  group_by(Class) %>% 
  summarise_all(funs(sum)) 

clr_class_jp <- clr_class_jp[c(-1, -29),] # Removing first and last rows since the taxonomy name is unknown.

# Make taxonomy name as rownames
row.names(clr_class_jp) <- clr_class_jp$Class
clr_class_jp$Class <- NULL

# make samples into rows

clr_class_jp_t <- t(clr_class_jp)

# if the value in the table is 0, add a small constant 0.1 to make sure we can take the log
clr_class_jp_t[clr_class_jp_t == 0] <- 0.1
rm(clr_class_jp)

# CLR transformation on OTU table
# CLR = taking log from ratio calculated by proportion of each ASVs within a sample

clr_class_jp <- t(clr(clr_class_jp_t, ifwarn = FALSE))
rm(clr_class_jp_t)
#=========================================================================
# Order
#=========================================================================

clr_order_jp <-  merge_jp %>% 
  dplyr::select(2:17, 22) %>% 
  group_by(Order) %>% 
  summarise_all(funs(sum)) 

clr_order_jp <- clr_order_jp[c(-1, -56),] # Removing first and last rows since the taxonomy name is unknown.

# Make taxonomy name as rownames
row.names(clr_order_jp) <- clr_order_jp$Order
clr_order_jp$Order <- NULL

# make samples into rows

clr_order_jp_t <- t(clr_order_jp)
rm(clr_order_jp)

# if the value in the table is 0, add a small constant 0.1 to make sure we can take the log
clr_order_jp_t[clr_order_jp_t == 0] <- 0.1

# CLR transformation on OTU table
# CLR = taking log from ratio calculated by proportion of each ASVs within a sample

clr_order_jp <- t(clr(clr_order_jp_t, ifwarn = FALSE))

rm(clr_order_jp_t)
#==========================================================================
# Family
#==========================================================================


clr_family_jp <-  merge_jp %>% 
  dplyr::select(2:17, 23) %>% 
  group_by(Family) %>% 
  summarise_all(funs(sum)) 

clr_family_jp <- clr_family_jp[c(-1, -119),] # Removing first and last rows since the taxonomy name is unknown.

# Make taxonomy name as rownames
row.names(clr_family_jp) <- clr_family_jp$Family
clr_family_jp$Family <- NULL

# make samples into rows

clr_family_jp_t <- t(clr_family_jp)

# if the value in the table is 0, add a small constant 0.1 to make sure we can take the log
clr_family_jp_t[clr_family_jp_t == 0] <- 0.1
rm(clr_family_jp)

# CLR transformation on OTU table
# CLR = taking log from ratio calculated by proportion of each ASVs within a sample

clr_family_jp <- t(clr(clr_family_jp_t, ifwarn = FALSE))

rm(clr_family_jp_t)