#!/usr/bin/python

import subprocess
import sys

# Show program usage
def show_usage():
    print sys.argv[0] + " Usage:"
    print "  Convert a source file to a sequence of images"
    print sys.argv[0] + " SOURCE_FILE DESTINATION_FOLDER [WIDTH=352] [HEIGHT=288] [FPS=15]"
    return

# Show usage if '-h' or  '--help' is the first argument or no argument is given
if (len(sys.argv) < 3):
    show_usage();

# Required args
SRC_FILE = sys.argv[1]
DST_PATH = sys.argv[2]
print "Converting %s to JPEG sequence" % SRC_FILE
print "Output path is %s" % DST_PATH

# Optional args
if (len(sys.argv) > 3): DST_W=sys.argv[3]
else: DST_W=352
if (len(sys.argv) > 4): DST_H=sys.argv[4]
else: DST_H=288
if (len(sys.argv) > 5): DST_FPS=sys.argv[5]
else: DST_FPS=15

print "Output dimensions: %s x %s" % (DST_W, DST_H)
print "Output framerate: %s fps" % DST_FPS

# Get video dimensions #
dim_str = subprocess.check_output("ffprobe %s 2>&1 | grep -o '[0-9]\{2,4\}x[0-9]\{2,4\}'" % SRC_FILE, shell=True)
SRC_W = dim_str.split('x')[0]
SRC_H = dim_str.split('x')[1]
print "Input dimensions: %s x %s" % (SRC_W, SRC_H)

# Initially set crop to entire source #
CROP_W = SRC_W
CROP_H = SRC_H

# Rotate if required #
if (SRC_W < SRC_H):

    # If aspect ratio too tall #
    if ( (float(SRC_H) / float(SRC_W)) < (float(DST_H) / float(DST_W)) ):
        CROP_W = float(DST_W * CROP_H) / float(DST_W)

    # If aspect ratio too wide #
    elif ( (float(SRC_H) / float(SRC_W)) > (float(DST_H) / float(DST_W)) ):
        CROP_H = float(DST_H * CROP_W) / float(DST_W)
   
    subprocess.call( 'ffmpeg -i %s -vf "crop=%u:%u,scale=%u:%u" -r %u  -an -f image2 -qmax 1 -qmin 1 "%s/frame_%%05d.jpg"' % (SRC_FILE, int(CROP_H), int(CROP_W), int(DST_H), int(DST_W), DST_FPS, DST_PATH), shell=True )

else:
    
    # If aspect ratio too tall #
    if ( (float(SRC_W) / float(SRC_H)) < (float(DST_W) / float(DST_H)) ):
        CROP_H = float(DST_H * CROP_W) / float(DST_H)

    # If aspect ratio too wide #
    elif ( (float(SRC_W) / float(SRC_H)) > (float(DST_W) / float(DST_H)) ):
        CROP_W = ( float(DST_W) * float(CROP_H) ) / float(DST_H)

    subprocess.call( 'ffmpeg -i %s -vf "crop=%u:%u,scale=%u:%u" -r %u  -an -f image2 -qmax 1 -qmin 1 "%s/frame_%%05d.jpg"' % (SRC_FILE, int(CROP_W), int(CROP_H), int(DST_W), int(DST_H), DST_FPS, DST_PATH), shell=True )

print "Crop dimensions: %s x %s" % (CROP_W, CROP_H)
