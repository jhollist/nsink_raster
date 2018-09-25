library(here)
library(sf)
library(quickmapr)
load(here("docs/examp_run.Rda"))
png(here("docs/figures/all_data.png"), 
         width = 600, height = 600)
qm<-qmap(st_geometry(niantic_huc),
         st_geometry(niantic_ssurgo_sf),
         st_geometry(niantic_streams),
         st_zm(st_geometry(niantic_waterbodies)),
         colors = c("white","brown","blue","darkblue"),fill = T)
dev.off()

png(here("docs/figures/ne_huc.png"), 
    width = 600, height = 600)
qm<-qmap(st_geometry(huc12_ne), colors = "slategray", fill = T)
dev.off()

png(here("docs/figures/ne_flowlines.png"), 
    width = 600, height = 600)
qm<-qmap(st_geometry(ne_streams), colors = "blue")
dev.off()

png(here("docs/figures/ne_waterbodies.png"), 
    width = 600, height = 600)
qm<-qmap(st_zm(st_geometry(ne_waterbodies)), colors = "darkblue", fill = T)
dev.off()

png(here("docs/figures/ne_fd.png"), 
    width = 600, height = 600)
qm<-qmap(fdr_ne)
dev.off()

png(here("docs/figures/ne_imp.png"), 
    width = 600, height = 600)
qm<-qmap(niantic_imp)
dev.off()

png(here("docs/figures/niantic_ssurgo.png"), 
    width = 600, height = 600)
qm<-qmap(st_geometry(niantic_ssurgo_sf), colors = "brown", fill = TRUE)
dev.off()

png(here("docs/figures/niantic_huc.png"), 
    width = 600, height = 600)
qm<-qmap(niantic_huc, colors = "darkblue", fill = TRUE)
dev.off()

png(here("docs/figures/lake_removal.png"), 
    width = 600, height = 600)
qm<-qmap(niantic_lake_removal)
dev.off()

png(here("docs/figures/stream_removal.png"), 
    width = 600, height = 600)
qm<-qmap(niantic_stream_removal)
dev.off()

old_par <- par()
png(here("docs/figures/type_removal.png"), 
    width = 1000, height = 600)
par(mfrow = c(1,2), mar=par('mar')+c(0,0,0,3))
plot(niantic_n_removal)
plot(niantic_types)
par(old_par)
dev.off()

png(here("docs/figures/fp_stack.png"), 
    width = 600, height = 600)
qm<-qmap(niantic_n_removal, niantic_fp, colors = c(NA, "darkblue"))
dev.off()



