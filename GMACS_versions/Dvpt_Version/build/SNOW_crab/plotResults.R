#--plot results from one (or several) model(s)
require(ggplot2);
#--set up global variables
#----plot-related 
.THEME    = ggplot2::theme_bw(base_size = 12, base_family = "") +
            ggplot2::theme(strip.text.x = element_text(margin= margin(1,0,1,0)),
                           panel.grid.major = element_blank(), 
                           panel.grid.minor = element_blank(),
                           panel.border = element_blank(),
                           panel.background = element_blank(),
                           strip.background = element_rect(color="white",fill="white"));
.OVERLAY  = TRUE;

#----model-related
#==some of this repeats info in the .DAT file and should be read directly, rather than
#==repeated here (e.g. .FLEET and .SEAS)
.SEX      = c("Aggregate","Male","Female");
.FLEET    = c("Pot_Fishery","Trawl_Bycatch","NMFS_Trawl_1982","NMFS_Trawl_1989","BSFRF_2009", "NMFS_2009", "BSFRF_2010", "NMFS_2010");
.TYPE     = c("Retained","Discarded","Total");
.SHELL    = c("New","Old");
.MATURITY = c("Aggregate","Mature","Immature");
.SEAS     = c("1","2","3");

.MODELDIR = c(".");
mod_names = c("test");

#--read in the results
fn       <- file.path(.MODELDIR, "gmacs")
M        <- lapply(fn, read_admb) #need .prj file to run gmacs and need .rep file here
names(M) <- mod_names

gmr::plot_catch(M);
gmr::plot_cpue(M,subsetby="NMFS_Trawl_1989");
gmr::plot_cpue_res(M,subsetby="NMFS_Trawl_1989");


