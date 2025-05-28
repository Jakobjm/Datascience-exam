This is the repo for my exam in Datascience, prediction and forecasting. 
I am working on a remote sensing task, looking at satellite imagery of the Kazanlak Valley in Bulgaria, where I am trying to detect burial mounds.

The preprocessing starts in the create_bb_training_data.rmd file, the mosaic.R file is slightly altered from CHC at AU's file, but "stitches" together two satellite images.

the preprocessing then proceeds in image_processing_pipeline.ipynb

and model training and evaluation is in Multihead_unet.ipynb

all scripts, except the Mosaic.R have been created by me, with assistance from ChatGPT and GitHub Copilot. Mainly used to dig up documentation and clean up messy code that I wrote. 


Data is not included here as I'm as of now unaware whether I'm allowed to share it, either way, the satellite images are too big to be hosted here.
