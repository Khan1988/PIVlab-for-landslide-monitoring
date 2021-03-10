# PIVlab for slope movement monitoring
This is a modified version of PIVlab. For the original PIVlab please follow the link.
(https://github.com/Shrediquette/PIVlab)


The modification to the softwares are as follows:
- Images are alligned before processing.
- a non-rectengular and multiple region of interests can be selected.
- Noisy images are automatically removed.
- The duration between two images is calculated automatically from the EXIF data of the image files.
- Generated vector frames are refined using a set of morphological filters and cosine comparison.

For details of these algorithms and modifications please refer to the (https://www.mdpi.com/2072-4292/13/5/893/htm)

To cite the paper use:
Khan, M.W.; Dunning, S.; Bainbridge, R.; Martin, J.; Diaz-Moreno, A.; Torun, H.; Jin, N.; Woodward, J.; Lim, M. Low-Cost Automatic Slope Monitoring Using Vector Tracking Analyses on Live-Streamed Time-Lapse Imagery. Remote Sens. 2021, 13, 893.
doi:  https://doi.org/10.3390/rs13050893
