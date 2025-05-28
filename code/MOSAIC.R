################################ MOSAIC ORIGINAL SATELLITE IMAGES - LARGE!!
# This script was used to create background image for cutout mound stamps for CNN


library(pacman)
p_load(rgdal, raster,sf)
#setwd("E:/TRAP Workstation/Shared GIS/Satellite imagery/IKONOS/Kazanlak/ERDAS/Cormac")

# Create an extent for mounds, one tight, one with 1000m buffer
visible_mounds <- st_read("../data/KAZ_mounds.shp")
extent <- st_make_grid(st_bbox(visible_mounds),n = 1)
st_bbox(extent)
extent_adj <- st_buffer(st_as_sf(extent), 1000)


# Load original  Kaz_e_fuse and Kaz_w_fuse from E:\TRAP Workstation\Shared GIS\Satellite imagery\IKONOS\Kazanlak\ERDAS\Cormac, clip by mound extent and then create cutouts.
KAZE <- brick("../data/KazEastfused.tif")
KAZW <- brick("../data/KazWestfused.tif")

# Crop to visible mound extent
KAZEcropped <- crop(KAZE, st_as_sf(extent)) # crop to mound 3.5m extent
KAZWcropped <- crop(KAZW, st_as_sf(extent))

# Crop to adjusted larger than visible-mounds extent togetthoroughoverlap
KAZWcropped <- crop(KAZW, extent_adj) 
KAZEcropped <- crop(KAZE, extent_adj)



### Mosaic Option 3 with merge()  - WORKS but histograms are misaligned. 

KAZcropped <- merge(KAZEcropped,KAZWcropped,tolerance=1) # tolerance gets around origin issue?
plotRGB(KAZcropped, stretch = "hist") # NAs are handled ok as long as E comes first..

# Writing the cropped-to-mound rasters
writeRaster(KAZcropped, file="Kazcrop_merged.tif", format="GTiff")

