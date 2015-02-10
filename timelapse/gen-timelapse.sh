#!/bin/bash

mkdir convert

amount=$(ls -l IMG_*.JPG | wc -l)
povray_amount=$(ls -l IMG_*.JPG | wc -l)

counter=10000
H=100
M=100
S=100
for f in IMG_*.JPG; do
    let "counter+=1"
    let "S+=10"
    if [ $S == 160 ] ; then
	S=100;
	let "M+=1"
	fi
    if [ $M == 160 ] ; then
	M=100;
	let "H+=1"
	fi
    echo "Copying image ${counter:1}"
    cp $f convert/frame${counter:1}.jpg
done

ffmpeg -r 30 -i convert/frame%04d.jpg timelapse.mp4