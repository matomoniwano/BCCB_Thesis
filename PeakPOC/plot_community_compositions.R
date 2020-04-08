###############################################
# Make function to plot the community composition plot based on clr transformed data (matrix)
###############################################
# https://stackoverflow.com/questions/27948446/about-barplot-for-data-with-negative-values
StackedBarplotClr <- function(
  x, 
  save = "StackedBarplot.pdf",
  width = 8,
  height = 6,
  colLegend = 1, 
  sizeLegend = 1, 
  main = "",
  ylab = "ylab",
  density = 50, # width of lines (for texture)
  angle = c(0, 45, 90, 135), # of lines (for texture) 
  inset = c(-0.4,-0.18),
  mar = c(5.1, 4.1, 4.1, 13.1),
  mainLegend = "Legend",
  title.adj = 0.1
) {
  #
  #
  #
  #
  # This function aims to make a stacked barplot from clr transoformed matrixes
  # meaning that it can handle negative values as well as positive values
  # and was inspired by 
  # https://stackoverflow.com/questions/27948446/about-barplot-for-data-with-negative-values
  #
  # x: clr transformed matrix with species as rows and sites as columns
  ## phy_mat_clr_t
  # save: path and name to which you want to save the plot
  ## "/Users/master/Desktop/SPOT data/AnalysisOfAlmaData/plots/Community_phy_SPOT.pdf"
  # width: how wide should the saved image be
  ## 10
  # height: how high should the saved image be
  ## 6
  # colLegend: number of columns you want the legend to be split into
  ## 1
  # sizeLegend: size of the text in the legend
  ## 1
  # main: main plot title
  ## Community Composition (Phylum)
  # ylab: label of y axis
  ## relative abundance clr
  # mar: mar parameter in par() function of base R To set the proportion of plot to legend space
  # create two objects that are the same as the phylum clr matrix
  pos <- neg <- x
  # in Pos have set all negative numbers to zero -> have only positive numbers
  pos[x<0] <- 0
  # in Neg set all positive values to zero -> have only negative numbers
  neg[x>0] <- 0
  # save the range from the most negative to the most positive
  myrange <- c(min(colSums(neg)),max(colSums(pos)))
  # where do you want to save it and with which dimensions
  pdf(save, width, height)
  par(mar = mar, xpd = TRUE)
  # load packages
  require(viridis)
  # set palette
  palette(
    viridis(
      length(
        unique(rownames(x))
      )
    )
  )
  # plot the enriched phyla, set the y achsis to fit all neg and pos values
  barplot(
    pos, 
    ylim = myrange, 
    ylab = ylab,
    las = 2, # labels perpendicular to axis
    main = main,
    col = as.factor(rownames(x)),
    density = density,
    angle = angle
  )
  # to that plot add the depleted phyla
  barplot(
    neg, 
    add = TRUE, 
    ylim = rev(myrange), 
    las = 2, # labels perpendicular to axis
    col = as.factor(rownames(x)),
    density = density,
    angle = angle
  )
  # add legend
  legend(
    "topright",
    inset = inset, # have legend outside of the plot
    legend = as.factor(rownames(x)), # labels in legend
    cex = sizeLegend, # size of text
    border = as.factor(rownames(x)), # surround the box in legend
    fill = as.factor(rownames(x)), # fille the box in legend
    density = density, # width of lines (for texture)
    angle = angle, # of lines (for texture)
    ncol = colLegend, # how many columns should the legend have
    bty = "n", # the type of box drawn around legend
    title = mainLegend,
    title.adj = 0
  )
  dev.off()
}
###############################################
## Plot for Phylum
###############################################
# have phyla as rows and samples as columns
StackedBarplotClr(
  x = clr_phylum_peakpoc,
  save = "C:\\Users\\MSI\\AppData\\Local\\Packages\\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\\LocalState\\rootfs\\home\\matomo\\jacobs\\BCCB_Thesis\\PeakPOC\\peakpoc_plots\\Community_phylum_EUK_FRAM.pdf",
  main = "Community Composition (Phylum)",
  ylab = "relative abundance clr",
  inset = c( -0.6,0),
  width = 15,
  height = 9,
  mainLegend = "Phylum",
  colLegend = 3,
  mar = c(10.1, 4.1, 4.1, 27.1)
)
###############################################
## Plot for Class
###############################################
# have classes as rows and samples as columns
StackedBarplotClr(
  x = clr_class_peakpoc,
  save = "C:\\Users\\MSI\\AppData\\Local\\Packages\\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\\LocalState\\rootfs\\home\\matomo\\jacobs\\BCCB_Thesis\\PeakPOC\\peakpoc_plots\\Community_class_EUK_FRAM.pdf",
  main = "Community Composition (Class)",
  ylab = "relative abundance clr",
  inset = c( -0.6,-0.02),
  width = 25,
  height = 15,
  colLegend = 2,
  mar = c(10.1, 4.1, 4.1, 60.1),
  mainLegend = "Class"
)
###############################################
## Plot for Order
###############################################
# have phyla as rows and samples as columns

StackedBarplotClr(
  x = clr_order_peakpoc,
  save = "C:\\Users\\MSI\\AppData\\Local\\Packages\\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\\LocalState\\rootfs\\home\\matomo\\jacobs\\BCCB_Thesis\\PeakPOC\\peakpoc_plots\\Community_order_EUK_FRAM.pdf",
  main = "Community Composition (Order)",
  ylab = "relative abundance clr",
  inset = c( -0.6,-0.02),
  width = 30,
  height = 15,
  colLegend = 3,
  mar = c(10.1, 4.1, 4.1, 60.1),
  mainLegend = "Order"
)
###############################################
## Plot for Family
###############################################
# have phyla as rows and samples as columns

StackedBarplotClr(
  x = clr_family_peakpoc,
  save = "C:\\Users\\MSI\\AppData\\Local\\Packages\\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\\LocalState\\rootfs\\home\\matomo\\jacobs\\BCCB_Thesis\\PeakPOC\\peakpoc_plots\\Community_family_EUK_FRAM.pdf",
  main = "Community Composition (Family)",
  ylab = "relative abundance clr",
  inset = c( -1.0,-0.02),
  width = 30,
  height = 15,
  colLegend = 4,
  mar = c(10.1, 4.1, 4.1, 80.1),
  mainLegend = "Family"
)
