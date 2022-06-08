.get_cpue_df <- function(M)
{
  n   <- length(M)
  mdf <- NULL
  for (i in 1:n)
  {
    A        <- M[[i]]
    df       <- data.frame(Model = names(M)[i], as.data.frame(A$dSurveyData))
    if(dim(df)[2]<11) df = data.frame(cbind(df, rep(0,dim(df)[1])))
    colnames(df) <- c("Model","Index","year","seas","fleet","sex","mature","cpue","cv","units","cpue_Timing")
      
    df$sex   <- .SEX[df$sex+1]
    df$fleet <- .FLEET[df$fleet]
    sd       <- sqrt(log(1 + df$cv^2))
    df$lb    <- exp(log(df$cpue) - 1.96*sd)
    df$ub    <- exp(log(df$cpue) + 1.96*sd)
    
    df$cvest <- na.exclude(as.vector(t(A$cpue_cv_add)))
    sde      <- sqrt(log(1 + df$cvest^2))
    df$lbe   <- exp(log(df$cpue) - 1.96*sde)
    df$ube   <- exp(log(df$cpue) + 1.96*sde)
    
    df$pred  <- na.exclude(as.vector(t(A$pre_cpue)))
    df$resd  <- na.exclude(as.vector(t(A$res_cpue)))
    mdf      <- rbind(mdf, df)
  }
  return(mdf)
}









.get_catch_df <- function(M)
{
  n <- length(M)
  mdf <- NULL
  for ( i in 1:n )
  {
    A <- M[[i]]
    df <- data.frame(Model = names(M)[i], A$dCatchData_out)
    colnames(df) <- c("model","year","seas","fleet","sex","obs","cv","type","units","mult","effort","discard.mortality")
    df$observed  <- na.omit(as.vector(t(A$obs_catch_out)))
    df$predicted <- na.omit(as.vector(t(A$pre_catch_out)))
    #df$residuals <- na.omit(as.vector(t(A$res_catch_out)))
    df$residuals <- as.vector(t(A$res_catch_out))
    df$sex       <- .SEX[df$sex+1]
    df$fleet     <- .FLEET[df$fleet]
    
    if(length(which(df$type==0))>0) df[which(df$type==0),"type"] <- 3
    df$type      <- .TYPE[df$type]
    
    df$sd        <- sqrt(log(1+df$cv^2))
    df$lb        <- exp(log(df$obs)-1.96*df$sd)
    df$ub        <- exp(log(df$obs)+1.96*df$sd)
    mdf <- rbind(mdf, df)
    if ( !all(df$observed == df$obs) )
    {
      stop("Error: observed catch data is buggered.")
    }
  }
  mdf$year <- as.integer(mdf$year)
  mdf$sex <- factor(mdf$sex, levels = .SEX)
  mdf$type <- as.factor(mdf$type)
  mdf$fleet <- factor(mdf$fleet, levels = .FLEET)
  return(mdf)
}








plot_selectivity <- function(M,
         xlab = "Mid-point of size class (mm)",
         ylab = "Selectivity",
         tlab = "Type", ilab = "Period year",
         nrow = NULL, ncol = NULL, legend_loc=c(1.05,.05))
{
  xlab <- paste0("\n", xlab)
  ylab <- paste0(ylab, "\n")
  
  mdf <- .get_selectivity_df(M)
  
  mdf <- mdf[!mdf$sex%in%"Aggregate",]
  
  ncol <-length(unique(mdf$fleet))
  nrow <-length(unique(mdf$Model))
  nrow_sex <-length(unique(mdf$sex))
  p <- ggplot(mdf) + expand_limits(y = c(0,1))
  if (.OVERLAY)
  {
    p <- p + geom_line(aes(variable, value, col = factor(year), linetype = type))
    if (length(M) == 1 && length(unique(mdf$sex)) == 1)
    {
      p <- p + facet_wrap(~fleet, nrow = nrow, ncol = ncol)
    } else if (length(M) != 1 && length(unique(mdf$sex)) == 1) {
      p <- p + facet_wrap(~Model + fleet, nrow = nrow, ncol = ncol)
    } else if (length(M) == 1 && length(unique(mdf$sex)) != 1) {
      p <- p + facet_wrap(~fleet + sex, ncol = nrow_sex, nrow = ncol)
    } else {
      # p <- p + facet_wrap(~Model + fleet + sex, nrow = nrow_sex, ncol = ncol)
      p <- p + facet_grid(sex + fleet~Model, margins = FALSE)
    }
  } else {
    p <- p + geom_line(aes(variable, value, col = factor(year), linetype = sex), alpha = 0.5)
    p <- p + facet_wrap(~Model + fleet + type, nrow = nrow, ncol = ncol)
  }
  p <- p + labs(y = ylab, x = xlab, col = ilab, linetype = tlab) +
    scale_linetype_manual(values = c("solid", "dashed", "dotted")) + 
    .THEME
  p <- p + theme(strip.text.x = element_text(margin= margin(1,0,1,0)),
                 panel.grid.major = element_blank(), 
                 panel.grid.minor = element_blank(),
                 panel.border = element_blank(),
                 panel.background = element_blank(),
                 strip.background = element_rect(color="white",fill="white"))
  
  print(p )
}










plot_recruitment <- function(M, xlab = "Year", ylab = "Recruitment (millions of individuals)")
{
  xlab <- paste0("\n", xlab)
  ylab <- paste0(ylab, "\n")
  mdf <- .get_recruitment_df(M)
  p<-ggplot(mdf)
  
  if(length(M) == 1 && length(unique(mdf$sex)) == 1)
  {
    p <- p + geom_line(aes(x = year, y = exp(log_rec))) 
    #geom_ribbon(aes(x = year, ymax = ub, ymin = lb), alpha = alpha)
  } else if (length(M) != 1 && length(unique(mdf$sex)) == 1) 
  {
    p <- p + geom_line(aes(x = year, y = exp(log_rec), col = Model)) 
    #geom_ribbon(aes(x = year, ymax = ub, ymin = lb, fill = Model), alpha = alpha) 
  } else if (length(M) == 1 && length(unique(mdf$sex)) != 1) 
  {
    p <- p + geom_line(aes(x = year, y = exp(log_rec), col = sex))  #+
    #geom_ribbon(aes(x = year, ymax = ub, ymin = lb, fill = sex), alpha = alpha) 
  } else if (length(M) != 1 && length(unique(mdf$sex)) == 2)
  {
    p <- p + geom_line(aes(x = year, y = exp(log_rec), col = Model))
  } else 
  {
    
  }
  
  
  p <- p + labs(x = xlab, y = ylab)
  if (!.OVERLAY) p <- p + facet_wrap(~Model)
  if (length(unique(mdf$sex)) > 1) p <- p + facet_wrap(~sex, ncol = 1)
  
  
  # if (length(M) == 1)
  # {
  #     p <- ggplot(mdf, aes(x = year, y = exp(log_rec)/1e+06)) +
  #         geom_bar(stat = "identity", alpha = 0.4, position = "dodge") +
  #         geom_pointrange(aes(year, exp(log_rec)/1e+6, ymax = ub/1e+06, ymin = lb/1e+06), position = position_dodge(width = 0.9))
  # } else {
  #     p <- ggplot(mdf, aes(x = year, y = exp(log_rec)/1e+06, col = Model, group = Model)) +
  #         geom_hline(aes(yintercept = rbar/1e+6, col = Model)) +
  #         geom_bar(stat = "identity", alpha = 0.4, aes(fill = Model), position = "dodge") +
  #         geom_pointrange(aes(year, exp(log_rec)/1e+6, col = Model, ymax = ub/1e+06, ymin = lb/1e+06), position = position_dodge(width = 0.9))
  # }
  # 
  
  
  print(p + .THEME)
}









plot_selectivity_mod <- function(
         M,
         xlab = "Mid-point of size class (mm)",
         ylab = "Selectivity",
         tlab = "Type", ilab = "Period year",
         nrow = NULL, ncol = NULL, legend_loc=c(1.05,.05))
{
  xlab <- paste0("\n", xlab)
  ylab <- paste0(ylab, "\n")
  
  mdf <- .get_selectivity_df(M)
  ncol <-length(unique(mdf$fleet))
  nrow <-length(unique(mdf$Model))
  nrow_sex <-length(unique(mdf$sex))
  p <- ggplot(mdf) + expand_limits(y = c(0,1))
  if (.OVERLAY)
  {
    p <- p + geom_line(aes(variable, value, col = factor(year), linetype = type))
    if (length(M) == 1 && length(unique(mdf$sex)) == 1)
    {
      p <- p + facet_wrap(~fleet, nrow = nrow, ncol = ncol)
    } else if (length(M) != 1 && length(unique(mdf$sex)) == 1) {
      p <- p + facet_wrap(~Model + fleet, nrow = nrow, ncol = ncol)
    } else if (length(M) == 1 && length(unique(mdf$sex)) != 1) {
      p <- p + facet_wrap(~fleet + sex, ncol = nrow_sex, nrow = ncol)
    } else {
      p <- p + facet_wrap(~Model + sex + fleet, nrow = nrow)
    }
  } else {
    p <- p + geom_line(aes(variable, value, col = factor(year), linetype = sex), alpha = 0.5)
    p <- p + facet_wrap(~Model + fleet + type, nrow = nrow, ncol = ncol)
  }
  p <- p + labs(y = ylab, x = xlab, col = ilab, linetype = tlab) +
    scale_linetype_manual(values = c("solid", "dashed", "dotted")) + 
    .THEME
  p <- p + theme(strip.text.x = element_text(margin= margin(1,0,1,0)),
                 panel.grid.major = element_blank(), 
                 panel.grid.minor = element_blank(),
                 panel.border = element_blank(),
                 panel.background = element_blank(),
                 strip.background = element_rect(color="white",fill="white"))
  
  print(p )
}
