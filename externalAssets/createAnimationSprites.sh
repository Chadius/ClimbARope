#Run this from the base folder.
cd externalAssets

montage -background transparent -geometry "+0+0" \
tracyLeft01.png \
tracyClimb.png \
tracyFail01.png \
tracyFail02.png \
../assets/tracy.png

#Post processing
cd ..