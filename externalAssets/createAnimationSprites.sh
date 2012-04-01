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

montage -background transparent -geometry "+0+0" \
pot2.png \
pot2Break01.png \
pot2Break02.png \
pot2Break03.png \
../assets/pot2.png

montage -background transparent -geometry "+0+0" \
bird01.png \
bird02.png \
birdCrash01.png \
birdCrash02.png \
birdCrash03.png \
birdCrash04.png \
birdCrash05.png \
birdCrash06.png \
../assets/bird.png

cp backgroundDay.png ../assets/
cp backgroundNightScraper.png ../assets/

cp victory.png ../assets/
cp credits.png ../assets/

cp balcony.png ../assets/
cp balcony2.png ../assets/

#Post processing
cd ..