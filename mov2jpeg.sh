#!/bin/bash

# Show program usage
show_usage() {
echo
echo ${0##/*}" Usage:"
echo "  Convert a source file to a sequence of images"
echo "${0##/} SOURCE_FILE DESTINATION_FOLDER [WIDTH=352] [HEIGHT=288] [FPS=15]"
exit
}

# Show usage if '-h' or  '--help' is the first argument or no argument is given
case $1 in
""|"-h"|"--help") show_usage ;;
esac

# Required args #
SRC_FILE=$1
DST_PATH=$2
echo "Converting $SRC_FILE to JPEG sequence"
echo "Output path is $DST_PATH"

# Optional args #
if [ ! -z $3 ] 
then DST_W=$3
else DST_W=352
fi

if [ ! -z $4 ] 
then DST_H=$4
else DST_H=288
fi

if [ ! -z $5 ] 
then DST_FPS=$5
else DST_FPS=15
fi

echo "Output dimensions: $DST_W x $DST_H"
echo "Output framerate: $DST_FPS fps"

# Get video dimensions #
SRC_W=`ffprobe $SRC_FILE 2>&1 | grep -o '[0-9]\{2,4\}x[0-9]\{2,4\}' | grep -o '[0-9]\{1,4\}x' | sed 's/x//'`
SRC_H=`ffprobe $SRC_FILE 2>&1 | grep -o '[0-9]\{2,4\}x[0-9]\{2,4\}' | grep -o 'x[0-9]\{1,4\}' | sed 's/x//'`
echo "Input dimensions: $SRC_W x $SRC_H"

# Initially set crop to entire source #
CROP_W=$SRC_W
CROP_H=$SRC_H

# Rotate if required #
if [ $SRC_W -lt $SRC_H ]; then

    # If aspect ratio too tall #
    if [ $(($SRC_H / $SRC_W)) -lt $(($DST_H / $DST_W)) ]; then
	CROP_W=$(( ($DST_W * $CROP_H) / $DST_H ))
    # If aspect ratio too wide #
    elif [ $(($SRC_H / $SRC_W)) -gt $(($DST_H / $DST_W)) ]; then
	CROP_H=$(( ($DST_H * $CROP_W ) / $DST_W ))
    fi 

    ffmpeg -i $SRC_FILE -vf "crop=${CROP_H}:${CROP_W},scale=${DST_H}:${DST_W}" -r $DST_FPS  -an -f image2 -qmax 1 -qmin 1 "${DST_PATH}/frame_%05d.jpg"

else

    # If aspect ratio too tall #
    if [ $(($SRC_W / $SRC_H)) -lt $(($DST_W / $DST_H)) ]; then
	CROP_H=$(( ($DST_H * $CROP_W) / $DST_W ))
    # If aspect ratio too wide #
    elif [ $(($SRC_W / $SRC_H)) -gt $(($DST_W / $DST_H)) ]; then
	CROP_W=$(( ($DST_W * $CROP_H ) / $DST_H ))
    fi 

    ffmpeg -i $SRC_FILE -vf "crop=${CROP_W}:${CROP_H},scale=${DST_W}:${DST_H}" -r $DST_FPS -an -f image2 -qmax 1 -qmin 1 "${DST_PATH}/frame_%05d.jpg"

fi

echo "Crop dimensions: $CROP_W x $CROP_H"