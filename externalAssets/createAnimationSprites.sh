#Run this from the base folder.
cd externalAssets

montage -background transparent -geometry "+0+0" \
tracyLeft01.png \
tracyClimb.png \
tracyFail01.png \
tracyFail02.png \
../assets/tracy.png

montage -background transparent -geometry "+0+0" \
pot.png \
potBreak01.png \
potBreak02.png \
potBreak03.png \
../assets/pot.png

cp backgroundDay.png ../assets/

#Post processing
cd ..