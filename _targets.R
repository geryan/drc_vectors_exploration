library(targets)
library(geotargets)

tar_option_set(
  packages = c(
    "terra",
    "geotargets",
    "dplyr",
    "tidyterra",
    "tidyr",
    "readr",
    "ggplot2",
    "sdmtools"
  ),
  format = "qs"
)

# Run the R scripts in the R/ folder with your custom functions:
tar_source()
# tar_source("other_functions.R") # Source other scripts as needed.

# Replace the target list below with your own:
list(

  tar_terra_rast(
    drc_mask,
    rast("~/Documents/tki_work/vector_atlas/africa_spatial_data/data/raster/cod_mask.tif")
  ),


  tar_terra_rast(
    drc_lyrs,
    rast("~/Documents/tki_work/vector_atlas/africa_spatial_data/outputs/raster/africa_static_vars_std.tif") |>
      crop(drc_mask) |>
      mask(drc_mask) |>
      writereadrast(
        filename = "data/raster/cod_vars_std.tif"
      )
  )
)
