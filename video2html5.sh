#!/bin/sh
#
echo tools to convert video HMTL5 compatible
echo take a video and convert to MP4, WEBM and OGV
echo
echo    MP4 = MPEG 4 files with H264 video codec and AAC audio codec
echo    WebM = WebM files with VP8 video codec and Vorbis audio codec
echo    Ogg = Ogg files with Theora video codec and Vorbis audio codec
echo
echo UBUNTU DEPENDANCIES: ffmpeg libavcodec-extra-53
echo
INPUTFILE=${1}
BASENAME=${INPUTFILE%.*}
OUTFILE_MP4=${BASENAME}_reencoded.mp4
OUTFILE_WEBM=${BASENAME}_reencoded.webm
OUTFILE_OGV=${BASENAME}_reencoded.ogv
ffmpeg -i ${INPUTFILE} -vcodec libx264 -vpre medium ${OUTFILE_MP4}
ffmpeg -i ${INPUTFILE} -vcodec libvpx -acodec libvorbis -f webm ${OUTFILE_WEBM}
ffmpeg -i ${INPUTFILE} -vcodec libtheora -acodec libvorbis ${OUTFILE_OGV}